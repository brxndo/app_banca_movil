import 'cuenta_credito.dart';
import 'cuenta_inversion.dart';
import 'cuenta_vista.dart';

class PosicionConsolidada {
  List<CuentaVista>? cuentasVista;
  List<CuentasCredito>? cuentasCredito;
  List<CuentasInversion>? cuentasInversion;

  PosicionConsolidada({
    this.cuentasVista,
    this.cuentasCredito,
    this.cuentasInversion,
  });
}
