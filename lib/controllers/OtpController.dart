import 'package:app_banca_virtual_movil_2/infraestructure/helpers/auth_helper.dart';
import 'package:app_banca_virtual_movil_2/ui/movil/posicion_consolidada_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../ui/widgets/dialog_otp.dart';
import 'NotificationsController.dart';

class OTPController {
  static void otpLoginAction(
      BuildContext context, int idUsuario, String tokenUsuario) {
    const storage = FlutterSecureStorage();

    _codigoOtp(context, () async {
      NotificationsController.showSnackBar('Bienvenido');
      await AuthHelper(secureStorage: storage).saveAuthToken(tokenUsuario);
      await AuthHelper(secureStorage: storage).saveIdUsuario(idUsuario);
      Navigator.of(context).pushNamedAndRemoveUntil(
        'posicionconsolidada',
        (route) => false,
      );
    });
  }

  static void _codigoOtp(BuildContext context, VoidCallback callback) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: DialogoOtp(
            okPress: (valorOtp) {
              print("Valor otp Ingresado:$valorOtp");
              //eAqui enviar el codigo otp al servidor
              if (valorOtp == '456456') {
                callback();
              } else {
                NotificationsController.showSnackBar(
                    'El código ingresado no es correcto');
              }
            },
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
