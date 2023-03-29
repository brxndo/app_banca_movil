import 'package:app_banca_virtual_movil_2/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../config/providers/usuario_provider.dart';
import 'custom_otp_text_field.dart';

class DialogoOtp extends ConsumerStatefulWidget {
  DialogoOtp({super.key, required this.okPress});
  Function(String) okPress;
  String valorOtp = "";
  @override
  ConsumerState<DialogoOtp> createState() => _DialogoOtpState();
}

class _DialogoOtpState extends ConsumerState<DialogoOtp> {
  CustomOtpFieldController otpFieldController = CustomOtpFieldController();

  @override
  Widget build(BuildContext context) {
    final estadoUsuario = ref.watch(estadosUsuario);
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      title: const Text(
        "Código de Seguridad",
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.36,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Se envió un código de seguridad al correo electrónico y/o celular registrados para verificar su identidad.\nIntroduce el código de seguridad para poder continuar",
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomOTPTextField(
              otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: Colors.black26,
                  backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
                  enabledBorderColor: Colors.black),
              controller: otpFieldController,
              keyboardType: TextInputType.number,
              length: 6,
              spaceBetween: 4,
              // obscureText: true,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 42,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 10,
              style: const TextStyle(fontSize: 20),
              onChanged: (pin) {
                print("change: " + pin);
                widget.valorOtp = pin;
              },
              onCompleted: (pin) {
                print("Completed: " + pin);
                //valorOtp = pin;
              },
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                otpFieldController.clear();
                otpFieldController.setFocus(0);
              },
              tooltip: 'Borrar',
              icon: const Icon(
                Icons.backspace,
                size: 35,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿No recibiste el código? ',
                  style: TextStyle(fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text(
                          '!Código reenviado!',
                        ),
                        content: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                Text(
                                    'Revise su celular y/o correo electrónico'),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 202, 88, 110)),
                              )),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'Reenviar código',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: TextButton.icon(
            icon: Icon(
              Icons.close,
              color: AppTheme.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context, 'Cancel');
              estadoUsuario.isLoading = false;
            },
            label: Text(
              'Cancelar',
              style: TextStyle(
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: TextButton.icon(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              widget.okPress(widget.valorOtp);
              estadoUsuario.isLoading = false;
            },
            label: const Text(
              'Comprobar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
