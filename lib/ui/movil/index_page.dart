import 'package:app_banca_virtual_movil_2/config/providers/usuario_provider.dart';
import 'package:app_banca_virtual_movil_2/ui/movil/agencias/agencias_page.dart';
import 'package:app_banca_virtual_movil_2/ui/movil/login_page.dart';
import 'package:app_banca_virtual_movil_2/ui/movil/simulador/simulador_page.dart';
import 'package:app_banca_virtual_movil_2/ui/theme/app_theme.dart';
import 'package:app_banca_virtual_movil_2/ui/utils/global.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../config/routes/app_router_movil.dart';
import '../../controllers/NotificationsController.dart';
import '../../infraestructure/helpers/auth_helper.dart';
import '../widgets/button_icon_text_custom.dart';
import '../widgets/icon_text_custom.dart';

List<Image> imagenes = [
  const Image(
    image: AssetImage('assets/images/giphy3_2.gif'),
    width: 350,
  ),
  const Image(
    image: AssetImage('assets/images/giphy2_2.gif'),
    width: 350,
  ),
  const Image(
    image: AssetImage('assets/images/giphy1_2.gif'),
    width: 350,
  )
];

class IndexPage extends ConsumerStatefulWidget {
  const IndexPage({super.key});

  @override
  ConsumerState<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends ConsumerState<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalIsDarkSelected
          ? const Color.fromARGB(255, 50, 50, 50)
          : AppTheme.backgorundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 290,
                  ),
                  const SizedBox(height: 5),
                  const Text("Version 2.0.0"),
                  CarouselSlider(
                      items: imagenes,
                      options: CarouselOptions(
                        animateToClosest: true,
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonIconTextCustom(
                        label: "Usuario y contraseña",
                        icono: Icons.person,
                        onTap: () {
                          Navigator.of(context).push(
                              AppRouterMovil.createRouteEffect(
                                  const LoginPage()));
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      FutureBuilder(
                        future: ref
                            .watch(usuarioProvider)
                            .soportaAuthWithCredentials(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data == true) {
                              return ButtonIconTextCustom(
                                label: "Huella / Face Id",
                                icono: Icons.fingerprint,
                                onTap: () async {
                                  final autenticar = await ref
                                      .watch(usuarioProvider)
                                      .autenticacionBiometrica();

                                  const storage = FlutterSecureStorage();
                                  bool tokenExists =
                                      await AuthHelper(secureStorage: storage)
                                          .isUserLoggedIn();

                                  String idUsuario =
                                      await AuthHelper(secureStorage: storage)
                                              .getIdUsuario() ??
                                          '';
                                  if (autenticar == 'authorized') {
                                    if (tokenExists && idUsuario != '') {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              'posicionconsolidada');
                                      NotificationsController.showSnackBar(
                                          'Bienvenido');
                                      return;
                                    } else {
                                      Navigator.of(context).pushNamed('login');
                                      NotificationsController.showSnackBar(
                                          'Por favor inicie sesión');
                                    }
                                  }
                                },
                              );
                            }
                          }
                          return Container();
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconTextCustom(
                        label: "Crear Usuario",
                        icono: Icons.person_add,
                        onPressed: () {},
                      ),
                      IconTextCustom(
                        label: "Simulador",
                        icono: Icons.calculate_rounded,
                        onPressed: () => Navigator.of(context).push(
                          AppRouterMovil.createRouteEffect(
                              const SimuladorPage()),
                        ),
                      ),
                      IconTextCustom(
                        label: "Agencias",
                        icono: Icons.location_on,
                        onPressed: () => Navigator.of(context).push(
                          AppRouterMovil.createRouteEffect(
                              const AgenciasPage()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
