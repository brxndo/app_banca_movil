import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/cuenta_vista.dart';
import 'package:app_banca_virtual_movil_2/domain/models/transferencia/cuenta_destino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/providers/transferencia_provider.dart';
import '../../domain/models/transferencia/transferencia.dart';

class TransferenciaPage extends ConsumerStatefulWidget {
  TransferenciaPage({super.key});

  @override
  ConsumerState<TransferenciaPage> createState() => _TransferenciaPageState();
}

class _TransferenciaPageState extends ConsumerState<TransferenciaPage> {
  String? numeroCuentaOrigen;
  String? numeroCuentaDestino;
  String motivo = '';
  DateTime now = DateTime.now();
  String fecha = '';
  String monto = '';
  int? idUsuario;
  int? idCuentaVista;
  int? idCuentaDestino;
  late Future<List<CuentaVista>> cuentasVista;
  late Future<List<CuentaDestino>> cuentasDestino;

  @override
  void initState() {
    ref.read(transferenciaProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cuentasVista =
        ref.watch(transferenciaProvider).obtenerCuentaVistaUsesCase();

    cuentasDestino =
        ref.watch(transferenciaProvider).obtenerCuentaDestinoUsesCase();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferencias'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Origen',
                style: TextStyle(fontSize: 18),
              ),
              FutureBuilder(
                future: cuentasVista,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final listaCuentasVista = snapshot.data;

                    return DropdownButton(
                      hint: const Text('Seleccione una cuenta de origen'),
                      value: numeroCuentaOrigen,
                      items: listaCuentasVista!.map<DropdownMenuItem>((value) {
                        idUsuario = value.idUsuario;
                        return DropdownMenuItem(
                          value: value.numeroCuenta,
                          child: Text(value.numeroCuenta),
                        );
                      }).toList(),
                      onChanged: (value) {
                        var indexCuentaVista = listaCuentasVista.indexWhere(
                          (element) => element.numeroCuenta.contains(value),
                        );

                        setState(() {
                          numeroCuentaOrigen = value as String;
                          idCuentaVista =
                              listaCuentasVista[indexCuentaVista].idCuentaVista;
                        });
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Destino',
                style: TextStyle(fontSize: 18),
              ),
              FutureBuilder(
                future: cuentasDestino,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final listaCuentasDestino = snapshot.data;

                    return DropdownButton(
                      hint: const Text('Seleccione una cuenta destino'),
                      value: numeroCuentaDestino,
                      items:
                          listaCuentasDestino!.map<DropdownMenuItem>((value) {
                        return DropdownMenuItem(
                          value: value.numeroCuenta,
                          child: Text(value.numeroCuenta),
                        );
                      }).toList(),
                      onChanged: (value) {
                        var indexCuentaDestino = listaCuentasDestino.indexWhere(
                          (element) => element.numeroCuenta.contains(value),
                        );

                        setState(() {
                          numeroCuentaDestino = value as String;
                          idCuentaDestino =
                              listaCuentasDestino[indexCuentaDestino]
                                  .idCuentaDestino;
                        });
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Monto a transferir', labelText: 'Monto'),
                onChanged: (value) {
                  setState(() {
                    monto = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Motivo de la transferencia',
                    labelText: 'Motivo'),
                onChanged: (value) {
                  setState(() {
                    motivo = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  fecha = DateTime(now.year, now.month, now.day)
                      .toString()
                      .replaceAll("00:00:00.000", "");

                  Transferencia transferencia = Transferencia(
                    numeroCuentaOrigen: numeroCuentaOrigen!,
                    numeroCuentaDestino: numeroCuentaDestino!,
                    motivo: motivo,
                    fecha: fecha,
                    monto: monto,
                    id_usuario: idUsuario!,
                    id_cuenta_vista: idCuentaVista!,
                    idCuentaDestino: idCuentaDestino!,
                  );

                  ref
                      .watch(transferenciaProvider)
                      .transferirUsesCase(transferencia);
                },
                child: const Text('Transferir'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
