import 'package:app_banca_virtual_movil_2/domain/uses_cases/posicion_consolidada/posicion_consolidada_usescase.dart';
import 'package:app_banca_virtual_movil_2/infraestructure/driven_adapters/api/posicion_consolidada_adapter_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final posicionConsolidadaProvider =
    Provider<PosicionConsolidadaUsesCase>((ref) {
  return PosicionConsolidadaUsesCase(PosicionConsolidadaAdapterApi());
});
