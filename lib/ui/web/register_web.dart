import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class RegisterWeb extends StatefulWidget {
  const RegisterWeb({super.key});

  @override
  State<RegisterWeb> createState() => _RegisterWebState();
}

class _RegisterWebState extends State<RegisterWeb> {
  String? identificacion;
  String? celular;
  String? email;
  final formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Para afiliarte y registrarte ingresa los siguientes datos:',
            style: TextStyle(fontSize: 11),
          ),
          const SizedBox(height: 15),
          Form(
            key: formKeyRegister,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('N° de identificación'),
                TextFormField(
                  autocorrect: false,
                  cursorColor: AppTheme.textFieldColor,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    labelText: 'Ingresa tu identificación',
                  ),
                  onChanged: (value) {
                    setState(() {
                      identificacion = value;
                    });
                  },
                  validator: (value) {
                    return (value != null && value != '')
                        ? null
                        : 'El num. de identificación no es válido';
                  },
                ),
                const SizedBox(height: 15),
                const Text('N° de celular'),
                TextFormField(
                  autocorrect: false,
                  cursorColor: AppTheme.textFieldColor,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    labelText: 'Ingresa tu número de celular',
                  ),
                  onChanged: (value) {
                    setState(() {
                      celular = value;
                    });
                  },
                  validator: (value) {
                    return (value != null && value != '')
                        ? null
                        : 'El num. de celular no es válido';
                  },
                ),
                const SizedBox(height: 15),
                const Text('Correo electrónico'),
                TextFormField(
                  autocorrect: false,
                  cursorColor: AppTheme.textFieldColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    labelText: 'Ingresa tu correo electrónico',
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);

                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El correo no es válido';
                  },
                ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    height: 54,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();

                        // if (!formKeyRegister.currentState!.validate()) return;

                        Navigator.of(context).pushNamed('creacion_cuenta');
                      },
                      child: const Text(
                        'Registrarme',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
