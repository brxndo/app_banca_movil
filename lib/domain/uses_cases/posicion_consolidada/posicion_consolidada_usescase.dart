import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/gateway/posicion_consolidada_gateway.dart';
import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/posicion_consolidada.dart';

class PosicionConsolidadaUsesCase {
  final PosicionConsolidadaGateway posicionConsolidadaGateway;

  PosicionConsolidadaUsesCase(this.posicionConsolidadaGateway);

  Future<PosicionConsolidada> consultarSaldoUsesCase(int id) {
    return posicionConsolidadaGateway.consultarSaldo(id);
  }
}
