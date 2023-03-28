import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class CalculoPlazoFijoChangeNotifier extends ChangeNotifier {
  String montoPF = '';
  String frecuenciaPF = '';
  String plazoPF = '';

  set setMonto(String monto) {
    montoPF = monto;
    notifyListeners();
  }

  set setFrecuencia(String frecuencia) {
    frecuenciaPF = frecuencia;
    notifyListeners();
  }

  set setPlazo(String plazo) {
    plazoPF = plazo;
    notifyListeners();
  }

  String getPorcentajeInteres() {
    String interes = '';

    if (montoPF.isNotEmpty && frecuenciaPF.isNotEmpty && plazoPF.isNotEmpty) {
      switch (plazoPF) {
        case '30':
          interes = '3.00';
          break;
        case '60':
          interes = '3.00';
          break;
        case '90':
          interes = '6.00';
          break;
        case '120':
          if (montoPF.toDouble()! >= 100 && montoPF.toDouble()! <= 2000) {
            interes = '7.25';
          } else if (montoPF.toDouble()! >= 2001 &&
              montoPF.toDouble()! <= 5000) {
            interes = '7.50';
          } else if (montoPF.toDouble()! >= 5001 &&
              montoPF.toDouble()! <= 10000) {
            interes = '7.75';
          } else if (montoPF.toDouble()! > 10000) {
            interes = '8.25';
          }
          break;
        case '150':
          if (montoPF.toDouble()! >= 100 && montoPF.toDouble()! <= 2000) {
            interes = '7.50';
          } else if (montoPF.toDouble()! >= 2001 &&
              montoPF.toDouble()! <= 5000) {
            interes = '7.75';
          } else if (montoPF.toDouble()! >= 5001 &&
              montoPF.toDouble()! <= 10000) {
            interes = '8.00';
          } else if (montoPF.toDouble()! > 10000) {
            interes = '8.75';
          }
          break;
        case '180':
          if (montoPF.toDouble()! >= 100 && montoPF.toDouble()! <= 2000) {
            interes = '7.75';
          } else if (montoPF.toDouble()! >= 2001 &&
              montoPF.toDouble()! <= 5000) {
            interes = '8.00';
          } else if (montoPF.toDouble()! >= 5001 &&
              montoPF.toDouble()! <= 10000) {
            interes = '8.25';
          } else if (montoPF.toDouble()! > 10000) {
            interes = '9.25';
          }
          break;
        case '210':
          if (montoPF.toDouble()! >= 100 && montoPF.toDouble()! <= 2000) {
            interes = '7.75';
          } else if (montoPF.toDouble()! >= 2001 &&
              montoPF.toDouble()! <= 5000) {
            interes = '8.00';
          } else if (montoPF.toDouble()! >= 5001 &&
              montoPF.toDouble()! <= 10000) {
            interes = '8.25';
          } else if (montoPF.toDouble()! > 10000) {
            interes = '9.25';
          }
          break;
        case '240':
          if (montoPF.toDouble()! >= 100 && montoPF.toDouble()! <= 2000) {
            interes = '7.75';
          } else if (montoPF.toDouble()! >= 2001 &&
              montoPF.toDouble()! <= 5000) {
            interes = '8.00';
          } else if (montoPF.toDouble()! >= 5001 &&
              montoPF.toDouble()! <= 10000) {
            interes = '8.25';
          } else if (montoPF.toDouble()! > 10000) {
            interes = '9.25';
          }
          break;
        case '270':
          if (montoPF.toDouble()! >= 100 && montoPF.toDouble()! <= 2000) {
            interes = '7.75';
          } else if (montoPF.toDouble()! >= 2001 &&
              montoPF.toDouble()! <= 5000) {
            interes = '8.00';
          } else if (montoPF.toDouble()! >= 5001 &&
              montoPF.toDouble()! <= 10000) {
            interes = '8.25';
          } else if (montoPF.toDouble()! > 10000) {
            interes = '9.25';
          }
          break;
        case '300':
          if (montoPF.toDouble()! >= 100 && montoPF.toDouble()! <= 2000) {
            interes = '7.75';
          } else if (montoPF.toDouble()! >= 2001 &&
              montoPF.toDouble()! <= 5000) {
            interes = '8.00';
          } else if (montoPF.toDouble()! >= 5001 &&
              montoPF.toDouble()! <= 10000) {
            interes = '8.25';
          } else if (montoPF.toDouble()! > 10000) {
            interes = '9.25';
          }
          break;
        case '330':
          if (montoPF.toDouble()! >= 100 && montoPF.toDouble()! <= 2000) {
            interes = '7.75';
          } else if (montoPF.toDouble()! >= 2001 &&
              montoPF.toDouble()! <= 5000) {
            interes = '8.00';
          } else if (montoPF.toDouble()! >= 5001 &&
              montoPF.toDouble()! <= 10000) {
            interes = '8.25';
          } else if (montoPF.toDouble()! > 10000) {
            interes = '9.25';
          }
          break;
        case '365':
          if (montoPF.toDouble()! >= 100 && montoPF.toDouble()! <= 2000) {
            interes = '8.25';
          } else if (montoPF.toDouble()! >= 2001 &&
              montoPF.toDouble()! <= 5000) {
            interes = '8.50';
          } else if (montoPF.toDouble()! >= 5001 &&
              montoPF.toDouble()! <= 10000) {
            interes = '8.75';
          } else if (montoPF.toDouble()! > 10000) {
            interes = '9.75';
          }
          break;
        default:
          interes = '';
          break;
      }
    }
    return interes;
  }

  //(monto * interes) / 12 = interes mensual

  double getInteresesMensuales() {
    double porcentajeInteres = (getPorcentajeInteres().toDouble()! / 100);
    return (montoPF.toDouble()! * porcentajeInteres) / 12;
  }

  /**
   * La funcion getResultado() devuelve una lista con el calculo del plazo fijo.
   * @param {List} respuestaPF - lista donde se almacenan los 6 valores del resultado, dispuesto de la siguiente manera;
   * respuestaPF[0] - valor del Interés anual
   * respuestaPF[1] - valor de los Intereses Diarios
   * respuestaPF[2] - valor de los Intereses Mensuales
   * respuestaPF[3] - valor del Interés total
   * respuestaPF[4] - valor del Impuesto 2%
   * respuestaPF[5] - valor del Total
   */

  List getResultado() {
    var respuestaPF = List<dynamic>.filled(6, 0);
    double resta;

    respuestaPF[0] = getPorcentajeInteres();

    respuestaPF[1] = (getInteresesMensuales() / 30).toStringAsFixed(2);

    if (frecuenciaPF == 'Mensual') {
      respuestaPF[2] = getInteresesMensuales().toStringAsFixed(2);
    } else {
      respuestaPF[2] = 0;
    }

    respuestaPF[3] = (getInteresesMensuales() * (plazoPF.toDouble()! / 30))
        .toStringAsFixed(2);

    if (plazoPF.toDouble()! < 180) {
      respuestaPF[4] =
          ((getInteresesMensuales() * (plazoPF.toDouble()! / 30)) * 0.02)
              .toStringAsFixed(2);

      resta = (getInteresesMensuales() * (plazoPF.toDouble()! / 30)) -
          ((getInteresesMensuales() * (plazoPF.toDouble()! / 30)) * 0.02);
    } else {
      respuestaPF[4] = 0;
      resta = (getInteresesMensuales() * (plazoPF.toDouble()! / 30));
    }

    respuestaPF[5] = (montoPF.toDouble()! + resta).toStringAsFixed(2);

    return respuestaPF;
  }
}
