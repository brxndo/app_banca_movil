import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/providers/usuario_provider.dart';
import '../../controllers/NotificationsController.dart';
import '../../controllers/OtpController.dart';
import '../theme/app_theme.dart';

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
  final textFieldFocusNode = FocusNode();
  final formKeyWeb = GlobalKey<FormState>();
  bool _obscured = true;

  @override
  void initState() {
    ref.read(usuarioProvider);
    super.initState();
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final estadoUsuario = ref.watch(estadosUsuario);
    return Column(
      children: [
        const SizedBox(height: 20),
        Form(
          key: formKeyWeb,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nombre de usuario'),
              TextFormField(
                autocorrect: false,
                cursorColor: AppTheme.textFieldColor,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  labelText: 'Ingresa tu usuario',
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                validator: (value) {
                  return (value != null && value != '')
                      ? null
                      : 'El nombre de usuario no es válido';
                },
              ),
              const SizedBox(height: 30),
              const Text('Contraseña'),
              TextFormField(
                autocorrect: false,
                obscureText: _obscured,
                focusNode: textFieldFocusNode,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: AppTheme.textFieldColor,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    labelText: 'Ingresa tu contraseña',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: GestureDetector(
                        onTap: _toggleObscured,
                        child: Icon(
                          _obscured ? Icons.visibility_off : Icons.visibility,
                          size: 20,
                        ),
                      ),
                    ),
                    suffixIconColor: Colors.black),
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
                  onTap: () =>
                      Navigator.of(context).pushNamed('recuperar_password'),
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width * 0.4,
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
                    child: Text(
                      estadoUsuario.isLoading ? 'Cargando...' : 'Ingresar',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
