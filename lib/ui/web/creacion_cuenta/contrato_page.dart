import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class ContratoPage extends StatelessWidget {
  ContratoPage({super.key, this.isComplete});

  bool? isComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          color: const Color.fromARGB(255, 231, 233, 239),
          height: 50,
          width: !Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width * 0.8
              : 500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                isComplete != null
                    ? const Icon(
                        Icons.check_circle_outline,
                        size: 25,
                      )
                    : Container(),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Contrato de Servicios Electrónicos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 45,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 1,
          color: Colors.black45,
        ),
      ],
    );
  }
}
