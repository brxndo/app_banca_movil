import 'package:app_banca_virtual_movil_2/config/providers/usuario_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/NotificationsController.dart';
import '../../controllers/OtpController.dart';
import '../utils/input_decoration.dart';
import '../widgets/auth_background.dart';
import '../widgets/card_container.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  String? username;
  String? password;
  bool? error;
  Map<String, dynamic> respuesta = {};

  @override
  void initState() {
    ref.read(usuarioProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final estadoUsuario = ref.watch(estadosUsuario);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: AuthBackground(
          headerIcon: Icons.person,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 160),
                Center(
                  child: CardContainer(
                      child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text('Iniciar Sesión',
                          style: Theme.of(context).textTheme.headline4),
                      const SizedBox(height: 30),
                      loginForm(context)
                    ],
                  )),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 20),
                  child: TextButton(
                      onPressed: () => {},
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              const Color.fromRGBO(172, 30, 35, 1)
                                  .withOpacity(0.1)),
                          shape:
                              MaterialStateProperty.all(const StadiumBorder())),
                      child: const Text(
                        '¿No tiene la banca virtual móvil? Solicítela aqui',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.center,
                      )),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    final estadoUsuario = ref.watch(estadosUsuario);
    return Container(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Usuario o Correo electrónico',
                  prefixIcon: Icons.person),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              validator: (value) {
                // String pattern =
                //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                // RegExp regExp = RegExp(pattern);

                // return regExp.hasMatch(value ?? '')
                //     ? null
                //     : 'El correo no es válido';

                return (value != null && value != '')
                    ? null
                    : 'El correo no es válido';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              validator: (value) {
                return (value != null && value.length >= 4)
                    ? null
                    : 'La contraseña debe de ser mayor a 4 caracteres';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.black,
              onPressed: estadoUsuario.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      if (!formKey.currentState!.validate()) return;

                      respuesta = await ref
                          .watch(usuarioProvider)
                          .login(username!, password!);

                      error = respuesta.containsKey('message');
                      if (error != false) {
                        NotificationsController.showSnackBar(
                            respuesta['message']);
                        return;
                      }

                      estadoUsuario.isLoading = true;

                      // ignore: use_build_context_synchronously
                      OTPController.otpLoginAction(
                        context,
                        respuesta['id_usuario'],
                        respuesta['token_usuario'],
                      );
                      print(respuesta);
                    },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  estadoUsuario.isLoading ? 'Cargando...' : 'Ingresar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
