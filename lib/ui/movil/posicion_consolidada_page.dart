import 'package:app_banca_virtual_movil_2/config/providers/change_notifier/theme_change_notifier.dart';
import 'package:app_banca_virtual_movil_2/config/providers/posicion_consolidada_provider.dart';
import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/posicion_consolidada.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/providers/app_provider.dart';
import '../../config/providers/usuario_provider.dart';
import '../../infraestructure/helpers/auth_helper.dart';
import '../theme/app_theme.dart';
import '../theme/app_theme_dark.dart';
import '../utils/global.dart';

class PosicionConsolidadaPage extends ConsumerStatefulWidget {
  PosicionConsolidadaPage({super.key});

  @override
  ConsumerState<PosicionConsolidadaPage> createState() =>
      _PosicionConsolidadaPageState();
}

class _PosicionConsolidadaPageState
    extends ConsumerState<PosicionConsolidadaPage> {
  late Future<PosicionConsolidada> posicionConsolidada;

  final _storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posicion Consolidada'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: FutureBuilder(
              future: AuthHelper(secureStorage: _storage).getIdUsuario(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  posicionConsolidada = ref
                      .watch(posicionConsolidadaProvider)
                      .consultarSaldoUsesCase(int.parse(snapshot.data!));

                  return FutureBuilder(
                    future: posicionConsolidada,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final listaAhorrosVista = snapshot.data!.cuentasVista;
                        final listaCreditos = snapshot.data!.cuentasCredito;
                        final listaInversiones =
                            snapshot.data!.cuentasInversion;
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              const Text(
                                'Cuentas Vista:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Card(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: listaAhorrosVista!.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      '${listaAhorrosVista[index].numeroCuenta} - ${listaAhorrosVista[index].tipoCuenta}',
                                      style: const TextStyle(fontSize: 17),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Cuentas Inversión:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Card(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: listaInversiones!.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      '${listaInversiones[index].numeroCuenta} - ${listaInversiones[index].tipoCredito}',
                                      style: const TextStyle(fontSize: 17),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Cuentas Crédito:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Card(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: listaCreditos!.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      '${listaCreditos[index].numeroCuenta} - ${listaCreditos[index].tipoCredito}',
                                      style: const TextStyle(fontSize: 17),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  await AuthHelper(secureStorage: _storage)
                                      .clearAuthToken();

                                  await AuthHelper(secureStorage: _storage)
                                      .clearIdUsuario();

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      'index', ModalRoute.withName('/'));
                                },
                                icon: const Icon(Icons.logout),
                                label: const Text('Cerrar Sesión'),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              RollingSwitch.icon(
                                initialState: globalIsDarkSelected,
                                width: 160,
                                onChanged: (bool value) {
                                  final theme = ref.watch(themeProvider);
                                  setState(() {
                                    globalIsDarkSelected = value;
                                  });
                                  onThemeChanged(value, theme);
                                },
                                rollingInfoLeft: RollingIconInfo(
                                  icon: Icons.dark_mode_outlined,
                                  text: Text(
                                    'Desactivado',
                                    style: TextStyle(
                                        color: AppTheme.backgorundColor),
                                  ),
                                  backgroundColor: AppTheme.secondColor,
                                ),
                                rollingInfoRight: RollingIconInfo(
                                  icon: Icons.check,
                                  backgroundColor: AppTheme.primaryColor,
                                  text: const Text('Activado'),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  );
                }
                return const CircularProgressIndicator();
              })),
    );
  }

  void onThemeChanged(bool value, ThemeChangeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(AppThemeDark.theme)
        : themeNotifier.setTheme(AppTheme.theme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
    globalIsDarkSelected = value;
  }
}
