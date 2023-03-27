import 'dart:math';

import 'package:app_banca_virtual_movil_2/ui/movil/simulador/resultado_credito.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercharged/supercharged.dart';

import '../../../controllers/NotificationsController.dart';

List<List<dynamic>> creditos = [
  [
    'Micro Impulso',
    50, //Valor Mínimo
    60000, //Valor Máximo
    17.50, //Porcentaje
    ['Mensual', 'Quincenal', 'Semanal'] //Frecuencias de Pago
  ],
  [
    'Consumo',
    100,
    120000,
    14.80,
    ['Mensual', '']
  ],
  [
    'Credi Iglesia',
    3000,
    200000,
    12.00,
    ['Mensual', '']
  ],
  [
    'Agropecuario',
    50,
    50000,
    15.00,
    ['Mensual', 'Bimensual', 'Trimestral', 'Semestral']
  ],
  [
    'Vivienda',
    5000,
    100000,
    9.60,
    ['Mensual', '']
  ],
  [
    'Daqui Crecimiento',
    60001,
    150000,
    15.50,
    ['Mensual', 'Quincenal', 'Semanal']
  ],
  [
    'Daqui Empresario',
    150001,
    200000,
    14.50,
    ['Mensual', 'Quincenal', 'Semanal']
  ],
  [
    'Pymes Iglesia',
    200001,
    1000000,
    10.50,
    ['Mensual', 'Bimensual', 'Trimestral', 'Semestral']
  ],
  [
    'Daqui Pymes',
    200001,
    500000,
    10.50,
    ['Mensual', 'Trimestral', 'Semestral']
  ],
];

List<String> tipoCuota = ['Fija', 'Decreciente'];

final GlobalKey<FormState> _montoKey = GlobalKey<FormState>();

class CreditosPage extends StatefulWidget {
  const CreditosPage({super.key});

  @override
  State<CreditosPage> createState() => _CreditosPageState();
}

class _CreditosPageState extends State<CreditosPage> {
  String monto = '';
  String cuotas = '';
  String valorVivienda = '';
  String credito = '';
  String frecuencia = '';
  String cuota = tipoCuota.first;

  bool isRespuesta = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      credito = creditos.first.first;
      frecuencia = getFrecuencia().first;
    });
  }

  List<String> getFrecuencia() {
    List<String> frecuencias = creditos[getPosition()][4];
    return frecuencias;
  }

  int getPosition() {
    int index = 0;

    for (var i = 0; i < creditos.length; i++) {
      if (creditos[i].first == credito) {
        index = i;
      }
    }
    return index;
  }

  double getApi() {
    double api = 0;

    if (monto.isNotEmpty && cuotas.isNotEmpty) {
      if (frecuencia == 'Mensual') {
        api = monto.toDouble()! * 0.00208333345 * cuotas.toDouble()!;
      } else if (frecuencia == 'Quincenal') {
        api = monto.toDouble()! * 0.001041666667 * cuotas.toDouble()!;
      } else if (frecuencia == 'Semanal') {
        api = monto.toDouble()! * 0.0005208333333 * cuotas.toDouble()!;
      } else if (frecuencia == 'Bimensual') {
        api = monto.toDouble()! * 0.004166667;
      } else if (frecuencia == 'Trimestral') {
        api = monto.toDouble()! * 0.00208333345 * 3;
      } else if (frecuencia == 'Semestral') {
        api = monto.toDouble()! * 0 * cuotas.toDouble()!;
      }
    }

    if (api > monto.toDouble()! * 0.025) {
      api = monto.toDouble()! * 0.025;
    }

    return api;
  }

  double getAportacion() {
    double aportacion = 0;

    if (monto.isNotEmpty) {
      if (frecuencia != 'Semestral') {
        aportacion = monto.toDouble()! * 0.005000001;
      }
    }
    return aportacion;
  }

  double getTotalPagosFija() {
    double totalPagos = 0;
    double r = 0;

    if (frecuencia == 'Mensual') {
      r = (((creditos[getPosition()][3]).toDouble()) / 100) / 12;
    } else if (frecuencia == 'Quincenal') {
      r = (((creditos[getPosition()][3]).toDouble()) / 100) / 24;
    } else if (frecuencia == 'Semanal') {
      r = (((creditos[getPosition()][3]).toDouble()) / 100) / 52;
    } else if (frecuencia == 'Bimensual') {
      r = (((creditos[getPosition()][3]).toDouble()) / 100) / 6;
    } else if (frecuencia == 'Trimestral') {
      r = (((creditos[getPosition()][3]).toDouble()) / 100) / 4;
    } else if (frecuencia == 'Semestral') {
      r = (((creditos[getPosition()][3]).toDouble()) / 100) / 2;
    }

    //M = c * ( r * (1 + r) ^ n) / ((1 + r) ^ n) - 1
    if (monto.isNotEmpty && cuotas.isNotEmpty) {
      totalPagos = monto.toDouble()! *
          (r * pow((1 + r), cuotas.toDouble()!)) /
          (pow((1 + r), cuotas.toDouble()!) - 1);
    }

    return totalPagos;
  }

  double getTotalPagosDecreciente() {
    double totalPagoDec = 0;

    if (monto.isNotEmpty && cuotas.isNotEmpty) {
      totalPagoDec = monto.toDouble()! / cuotas.toDouble()!;
    }

    return totalPagoDec;
  }

  double getTotalIntereses() {
    double totalIntereses = 0;

    if (monto.isNotEmpty && cuotas.isNotEmpty) {
      totalIntereses =
          (getTotalPagosFija() * cuotas.toDouble()!) - monto.toDouble()!;
    }

    return totalIntereses;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 90),
              child: Form(
                key: _montoKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autocorrect: false,
                      style: const TextStyle(fontSize: 18),
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: '0.00',
                        hintStyle: TextStyle(color: Colors.grey),
                        label: Center(
                          child: Text(
                            'Monto \$',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          monto = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese un valor';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autocorrect: false,
                      style: const TextStyle(fontSize: 18),
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: '12',
                        hintStyle: TextStyle(color: Colors.grey),
                        label: Center(
                          child: Text(
                            'Cuotas',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          cuotas = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese un valor';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    credito == 'Vivienda'
                        ? TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autocorrect: false,
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(9),
                            ],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: '00.00',
                              hintStyle: TextStyle(color: Colors.grey),
                              label: Center(
                                child: Text(
                                  'Valor reposición del bien \$',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                valorVivienda = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingrese un valor';
                              }
                              return null;
                            },
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            const Text('Tipo de Crédito:'),
            Card(
              elevation: 3,
              child: DropdownButton(
                elevation: 0,
                value: credito,
                alignment: AlignmentDirectional.center,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(255, 5, 5, 5),
                  size: 40,
                ),
                onChanged: (String? value) {
                  setState(() {
                    credito = value!;
                    frecuencia = getFrecuencia().first;
                  });
                },
                items: creditos
                    .map<DropdownMenuItem<String>>((List<dynamic> value) {
                  return DropdownMenuItem<String>(
                    value: value.first,
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        value.first,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Frecuencia de Pago:'),
            Card(
              elevation: 3,
              child: DropdownButton(
                elevation: 0,
                value: frecuencia,
                alignment: AlignmentDirectional.center,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(255, 5, 5, 5),
                  size: 40,
                ),
                onChanged: (String? value) {
                  setState(() {
                    frecuencia = value!;
                  });
                },
                items: getFrecuencia()
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Tipo de Cuota:'),
            Card(
              elevation: 3,
              child: DropdownButton(
                elevation: 0,
                value: cuota,
                alignment: AlignmentDirectional.center,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(255, 5, 5, 5),
                  size: 40,
                ),
                onChanged: (String? value) {
                  setState(() {
                    cuota = value!;
                  });
                },
                items: tipoCuota.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 41),
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.57,
              child: MaterialButton(
                onPressed: () {
                  if (monto.isEmpty || cuotas.isEmpty || frecuencia.isEmpty) {
                    NotificationsController.showSnackBar(
                        'Complete los campos vacíos');
                    setState(() {
                      isRespuesta = false;
                    });
                    return;
                  } else if (monto.toDouble()! < creditos[getPosition()][1] ||
                      monto.toDouble()! > creditos[getPosition()][2]) {
                    NotificationsController.showSnackBar(
                        'El monto ingresado no corresponde al rango de este tipo de crédito');
                    return;
                  }

                  if (_montoKey.currentState!.validate()) {
                    setState(() {
                      isRespuesta = true;
                    });
                  } else {
                    setState(() {
                      isRespuesta = false;
                    });
                  }
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.black,
                child: const Text(
                  'Calcular',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            isRespuesta
                ? ResultadoCredito(
                    monto: monto,
                    cuotas: cuotas,
                    tipoCuota: cuota,
                    frecuencia: frecuencia,
                    api: getApi(),
                    aportacion: getAportacion(),
                    totalPagosFija: getTotalPagosFija(),
                    totalPagosDecreciente: getTotalPagosDecreciente(),
                    totalIntereses: getTotalIntereses(),
                    porcentaje: creditos[getPosition()][3],
                  )
                : Container(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
