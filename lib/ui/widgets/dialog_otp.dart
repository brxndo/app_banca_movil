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
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: const Text(
        "Código de Seguridad",
        textAlign: TextAlign.center,
      ),
      content: Container(
        height: 260,
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
                icon: const Icon(
                  Icons.backspace,
                  size: 35,
                )),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(172, 30, 35, 1)),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: TextButton.icon(
            icon: const Icon(
              Icons.close,
              color: Color.fromRGBO(172, 30, 35, 1),
            ),
            onPressed: () {
              Navigator.pop(context, 'Cancel');
              estadoUsuario.isLoading = false;
            },
            label: const Text(
              'Cancelar',
              style: TextStyle(
                color: Color.fromRGBO(172, 30, 35, 1),
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextButton.icon(
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
