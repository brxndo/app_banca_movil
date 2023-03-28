import 'package:flutter/material.dart';

import '../../ui/movil/agencias/agencias_page.dart';
import '../../ui/movil/index_page.dart';
import '../../ui/movil/login_page.dart';
import '../../ui/movil/posicion_consolidada_page.dart';
import '../../ui/movil/simulador/simulador_page.dart';
import '../../ui/movil/transferencia_page.dart';

class AppRouter {
  static const initialRoute = 'index';
  static final paginasExternas = <MenuOptionsModel>[
    MenuOptionsModel(
      route: 'login',
      nombre: 'Login Page',
      screen: const LoginPage(),
    ),

    MenuOptionsModel(
      route: 'posicionconsolidada',
      nombre: 'Posicion Consolidada Page',
      screen: PosicionConsolidadaPage(),
    ),

    MenuOptionsModel(
      route: 'transferencia',
      nombre: 'Transferencias Page',
      screen: TransferenciaPage(),
    ),

    MenuOptionsModel(
      route: 'simulador',
      nombre: 'Simulador Page',
      screen: const SimuladorPage(),
    ),

    MenuOptionsModel(
      route: 'agencias',
      nombre: 'Agencias Page',
      screen: const AgenciasPage(),
    ),

    // MenuOptionsModel(
    //     route: 'registro',
    //     icono: Icons.card_membership,
    //     nombre: 'Registro Screen',
    //     screen: const RegistroScreen()),
  ];

//paginas de navegacion interna
  static final paginasInternasNav = <MenuOptionsModel>[
    MenuOptionsModel(route: 'dashboard', nombre: 'Inicio'),
    MenuOptionsModel(route: 'transferencias', nombre: 'Transferir'),
    MenuOptionsModel(route: 'servicios', nombre: 'Servicios'),
    MenuOptionsModel(route: 'daquicard', nombre: 'Daqui Card'),
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    routes.addAll({'index': (BuildContext context) => const IndexPage()});
    for (var item in paginasExternas) {
      routes.addAll({item.route: (BuildContext context) => item.screen!});
    }
    return routes;
  }

  static Route createRouteEffect(Widget destinationScreen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          destinationScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route createRouteEffectInternal(Widget destinationScreen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          destinationScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

class MenuOptionsModel {
  final String route;
  final String nombre;
  final Widget? screen;
  Function()? notifyParent;

  MenuOptionsModel({required this.route, required this.nombre, this.screen});
}
