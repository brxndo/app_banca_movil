import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../utils/responsive.dart';

class CreacionCuentaPageWeb extends StatelessWidget {
  const CreacionCuentaPageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Image.asset(
              'assets/images/logo.png',
              scale: 4,
            ),
            centerTitle: true,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Creación de cuenta',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CardContainer(
                  context: context,
                  height: MediaQuery.of(context).size.height * 0.52,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.grey[200],
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Text(
                                'Datos Personales',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black45,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 54,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: ElevatedButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                          },
                          child: const Text(
                            'Continuar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black54,
          height: 60,
          width: double.infinity,
          child: const Center(
            child: Text(
              '©COOPERATIVA DAQUILEMA 2023 - Todos los derechos reservados',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  CardContainer(
      {required BuildContext context,
      required double height,
      required Column child}) {
    double ancho = double.infinity;
    if (!Responsive.isMobile(context)) {
      ancho = MediaQuery.of(context).size.width * 0.6;
    }
    return Container(
      height: height,
      width: ancho,
      decoration: _createCardShape(),
      child: child,
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
            )
          ]);
}
