import 'package:app_banca_virtual_movil_2/config/providers/posicion_consolidada_provider.dart';
import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/posicion_consolidada.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../config/providers/usuario_provider.dart';
import '../../infraestructure/helpers/auth_helper.dart';

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
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      'home', ModalRoute.withName('/'));
                                },
                                icon: const Icon(Icons.logout),
                                label: const Text('Cerrar Sesión'),
                              )
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
}
