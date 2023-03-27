import 'package:app_banca_virtual_movil_2/ui/movil/agencias/agencias_page.dart';
import 'package:app_banca_virtual_movil_2/ui/movil/home_page.dart';
import 'package:app_banca_virtual_movil_2/ui/movil/login_page.dart';
import 'package:app_banca_virtual_movil_2/ui/movil/posicion_consolidada_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/NotificationsController.dart';
import '../ui/movil/simulador/simulador_page.dart';
import '../ui/movil/transferencia_page.dart';

class AppArquitecturaLimpia2 extends StatelessWidget {
  const AppArquitecturaLimpia2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: NotificationsController.messengerKey,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case 'home':
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );

          case 'posicionconsolidada':
            return MaterialPageRoute(
              builder: (context) => PosicionConsolidadaPage(),
            );

          case 'transferencia':
            return MaterialPageRoute(builder: (context) => TransferenciaPage());
          case 'login':
            return MaterialPageRoute(builder: (context) => const LoginPage());

          case 'simulador':
            return MaterialPageRoute(
                builder: (context) => const SimuladorPage());
          case 'agencias':
            return MaterialPageRoute(
                builder: (context) => const AgenciasPage());
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
    );
  }
}
