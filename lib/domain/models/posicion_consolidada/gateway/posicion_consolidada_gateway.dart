import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/posicion_consolidada.dart';

abstract class PosicionConsolidadaGateway {
  Future<PosicionConsolidada> consultarSaldo(int id);
}
