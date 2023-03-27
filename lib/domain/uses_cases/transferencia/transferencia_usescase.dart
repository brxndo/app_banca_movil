import 'package:app_banca_virtual_movil_2/domain/models/transferencia/transferencia.dart';

import '../../models/posicion_consolidada/cuenta_vista.dart';
import '../../models/transferencia/cuenta_destino.dart';
import '../../models/transferencia/gateway/transferencia_gateway.dart';

class TransferenciaUsesCase {
  final TransferenciaGateway transferenciaGateway;

  TransferenciaUsesCase(this.transferenciaGateway);

  transferirUsesCase(Transferencia transferencia) {
    transferenciaGateway.transferir(transferencia);
  }

  Future<List<CuentaVista>> obtenerCuentaVistaUsesCase() {
    return transferenciaGateway.obtenerCuentasVista();
  }

  Future<List<CuentaDestino>> obtenerCuentaDestinoUsesCase() {
    return transferenciaGateway.obtenerCuentasDestino();
  }
}
