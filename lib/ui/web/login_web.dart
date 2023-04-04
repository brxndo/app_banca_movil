import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/providers/usuario_provider.dart';
import '../../controllers/NotificationsController.dart';
import '../../controllers/OtpController.dart';
import '../theme/app_theme.dart';

GlobalKey<FormState> formKeyWeb = GlobalKey<FormState>();

class LoginWeb extends ConsumerStatefulWidget {
  const LoginWeb({super.key});

  @override
  ConsumerState<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends ConsumerState<LoginWeb> {
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
    return Column(
      children: [
        const SizedBox(height: 30),
        loginForm(context),
      ],
    );
  }

  Widget loginForm(BuildContext context) {
    final estadoUsuario = ref.watch(estadosUsuario);
    return Container(
      child: Form(
        key: formKeyWeb,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre de usuario'),
            TextFormField(
              autocorrect: false,
              cursorColor: AppTheme.textFieldColor,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                ),
                labelText: 'Ingresa tu usuario',
              ),
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
                    : 'El usuario no es válido';
              },
            ),
            const SizedBox(height: 30),
            Text('Contraseña'),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              cursorColor: AppTheme.textFieldColor,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                ),
                labelText: 'Ingresa tu usuario',
              ),
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
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text(
                      '¿Olvidaste tu contraseña?',
                    ),
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: SingleChildScrollView(
                        child: Column(
                          children: const [
                            Text(
                                'Nostrud consectetur aliquip amet laborum labore et ea reprehenderit anim sit anim est adipisicing pariatur. Est cupidatat laboris exercitation et sunt do quis ea in ut sunt eiusmod. Nulla commodo labore ad tempor. Non incididunt sunt sint velit ex aliquip non adipisicing anim aliqua cillum exercitation fugiat. Pariatur voluptate cillum in laboris Lorem. Fugiat aliquip nulla velit incididunt commodo eiusmod labore deserunt ullamco excepteur.'),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: estadoUsuario.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!formKeyWeb.currentState!.validate()) return;

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
                      },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 105, vertical: 18),
                  child: FittedBox(
                    child: Text(
                      estadoUsuario.isLoading ? 'Cargando...' : 'Ingresar',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
