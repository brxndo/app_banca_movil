import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/cuenta_vista.dart';
import 'package:app_banca_virtual_movil_2/domain/models/transferencia/transferencia.dart';

import '../cuenta_destino.dart';

abstract class TransferenciaGateway {
  Future<Transferencia> transferir(Transferencia transferencia);

  Future<List<CuentaVista>> obtenerCuentasVista();
  Future<List<CuentaDestino>> obtenerCuentasDestino();
}
