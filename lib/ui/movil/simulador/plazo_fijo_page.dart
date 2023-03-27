import 'package:app_banca_virtual_movil_2/config/providers/usuario_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supercharged/supercharged.dart';

import '../../../controllers/NotificationsController.dart';
import 'resultado_plazo_fijo.dart';

List<String> frecuenciaPago = ['Mensual', 'Vencimiento'];
List<String> plazoPago = [
  '30 días',
  '60 días',
  '90 días',
  '120 días',
  '150 días',
  '180 días',
  '210 días',
  '240 días',
  '270 días',
  '300 días',
  '330 días',
  'Mayor a 365 días',
];

GlobalKey<FormState> _montoKey = GlobalKey<FormState>();

class PlazoFijoPage extends ConsumerStatefulWidget {
  const PlazoFijoPage({super.key});

  @override
  ConsumerState<PlazoFijoPage> createState() => _PlazoFijoPageState();
}

class _PlazoFijoPageState extends ConsumerState<PlazoFijoPage> {
  String frecuencia = frecuenciaPago.first;
  String plazo = plazoPago.first;
  bool isRespuesta = false;

  @override
  Widget build(BuildContext context) {
    final plazoFijo = ref.watch(plazoFijoUsuario);
    if (plazo == plazoPago.last) {
      plazoFijo.plazoPF = '365';
    } else {
      plazoFijo.plazoPF = plazo.allBefore(' ');
    }

    plazoFijo.frecuenciaPF = frecuencia;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 100),
              child: Form(
                key: _montoKey,
                child: TextFormField(
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
                    plazoFijo.montoPF = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese un valor';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const Text('Frecuencia de Pago:'),
            Card(
              elevation: 3,
              child: DropdownButton(
                elevation: 0,
                value: frecuencia,
                alignment: AlignmentDirectional.center,
                dropdownColor: Colors.white,
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
                items: frecuenciaPago
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
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
            const Text('Plazo (días):'),
            Card(
              elevation: 3,
              child: DropdownButton(
                elevation: 0,
                value: plazo,
                alignment: AlignmentDirectional.center,
                dropdownColor: Colors.white,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(255, 5, 5, 5),
                  size: 40,
                ),
                onChanged: (String? value) {
                  setState(() {
                    plazo = value!;
                  });
                },
                items: plazoPago.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
              width: MediaQuery.of(context).size.width * 0.53,
              child: MaterialButton(
                onPressed: () {
                  if (plazoFijo.montoPF.isEmpty) {
                    NotificationsController.showSnackBar('Ingrese un valor');
                    return;
                  } else if (plazoFijo.montoPF.toDouble()! < 100) {
                    NotificationsController.showSnackBar(
                        'El monto debe ser mayor o igual a 100');
                    return;
                  }

                  if (_montoKey.currentState!.validate()) {
                    setState(() {
                      isRespuesta = true;
                    });
                    // print(
                    //     '${plazoFijo.montoPF}, ${plazoFijo.frecuenciaPF}, ${plazoFijo.plazoPF}');
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
                ? ResultadoPlazoFijo(resultado: plazoFijo.getResultado())
                : Container(),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
