import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class SeguridadPage extends StatelessWidget {
  const SeguridadPage({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Preguntas de Seguridad',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
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
