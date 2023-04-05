import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/card_container.dart';

class RecuperarPasswordPageWeb extends StatefulWidget {
  const RecuperarPasswordPageWeb({super.key});

  @override
  State<RecuperarPasswordPageWeb> createState() =>
      _RecuperarPasswordPageWebState();
}

class _RecuperarPasswordPageWebState extends State<RecuperarPasswordPageWeb> {
  final formRecuperarKey = GlobalKey<FormState>();
  String? identificacion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Image.asset(
              'assets/images/logo.png',
              scale: 4,
            ),
            centerTitle: true,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pantallainterna.jpg"),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CardContainer(
                  height: MediaQuery.of(context).size.height * 0.52,
                  child: Form(
                    key: formRecuperarKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Ingresa tu número de identificación, te enviaremos un enlace para reestablecer tu contraseña.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('N° de identificación'),
                        TextFormField(
                          autocorrect: false,
                          cursorColor: AppTheme.textFieldColor,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
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
                        const SizedBox(height: 30),
                        Center(
                          child: Container(
                            height: 54,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusScope.of(context).unfocus();

                                if (!formRecuperarKey.currentState!.validate())
                                  return;
                              },
                              child: const Text(
                                'Recuperar Contraseña',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black54,
          height: 60,
          width: double.infinity,
          child: const Center(
            child: Text(
              '©COOPERATIVA DAQUILEMA 2023 - Todos los derechos reservados',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
