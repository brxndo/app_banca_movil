import 'package:app_banca_virtual_movil_2/ui/web/creacion_cuenta/seguridad_page.dart';
import 'package:app_banca_virtual_movil_2/ui/widgets/card_container.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

import '../../theme/app_theme.dart';
import '../../utils/responsive.dart';
import 'contrato_page.dart';
import 'datos_personales_page.dart';

class CreacionCuentaPageWeb extends StatefulWidget {
  CreacionCuentaPageWeb({super.key});

  @override
  State<CreacionCuentaPageWeb> createState() => _CreacionCuentaPageWebState();
}

class _CreacionCuentaPageWebState extends State<CreacionCuentaPageWeb> {
  int activeStep = 0;

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
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pantallainterna.jpg"),
                fit: BoxFit.cover),
          ),
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
                Container(
                  color: const Color.fromARGB(255, 231, 233, 239),
                  height: 50,
                  width: !Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width * 0.6
                      : 500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            activeStep > 0
                                ? const Icon(
                                    Icons.check_circle_outline,
                                    size: 25,
                                  )
                                : Container(),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Datos Personales',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        EasyStepper(
                          activeStep: activeStep,
                          lineLength: MediaQuery.of(context).size.width * 0.12,
                          lineSpace: 5,
                          lineType: LineType.normal,
                          defaultLineColor: Colors.white,
                          finishedLineColor: AppTheme.primaryColor,
                          activeStepTextColor: AppTheme.primaryColor,
                          finishedStepTextColor: Colors.black87,
                          internalPadding: 0,
                          showLoadingAnimation: false,
                          stepRadius: 8,
                          showStepBorder: false,
                          enableStepTapping: false,
                          steps: [
                            EasyStep(
                              customStep: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: activeStep >= 0
                                      ? AppTheme.primaryColor
                                      : Colors.white,
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: activeStep >= 0
                                        ? Colors.white
                                        : Colors.black38,
                                  ),
                                ),
                              ),
                              title: 'Datos Personales',
                            ),
                            EasyStep(
                              customStep: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: activeStep >= 1
                                      ? AppTheme.primaryColor
                                      : Colors.white,
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: activeStep >= 1
                                        ? Colors.white
                                        : Colors.black38,
                                  ),
                                ),
                              ),
                              title: 'Contrato',
                            ),
                            EasyStep(
                              customStep: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: activeStep >= 2
                                      ? AppTheme.primaryColor
                                      : Colors.white,
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: activeStep >= 2
                                        ? Colors.white
                                        : Colors.black38,
                                  ),
                                ),
                              ),
                              title: 'Seguridad',
                            ),
                          ],
                          // onStepReached: (index) =>
                          //     setState(() => activeStep = index),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 1,
                  color: Colors.black45,
                ),
                CardContainer(
                  context: context,
                  height: activeStep == 0
                      ? MediaQuery.of(context).size.height * 0.4
                      : activeStep == 1
                          ? MediaQuery.of(context).size.height * 0.6
                          : MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          activeStep == 0
                              ? const DatosPersonalesPage()
                              : activeStep == 1
                                  ? Column(
                                      children: [
                                        const DatosPersonalesPage(),
                                        ContratoPage(),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        const DatosPersonalesPage(),
                                        ContratoPage(
                                          isComplete: true,
                                        ),
                                        const SeguridadPage()
                                      ],
                                    ),
                          Padding(
                            padding: const EdgeInsets.all(25),
                            child: Row(
                              children: [
                                Container(
                                  height: 54,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (activeStep == 2) {
                                        return;
                                      }
                                      setState(() {
                                        activeStep++;
                                      });
                                    },
                                    child: const Text(
                                      'Continuar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 54,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (activeStep == 0) {
                                        Navigator.pop(context);
                                      }
                                      setState(() {
                                        activeStep--;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      side: BorderSide(
                                          width: 1,
                                          color: AppTheme.primaryColor),
                                    ),
                                    color: Colors.white,
                                    child: Text(
                                      "Cancelar",
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
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
      ],
    );
