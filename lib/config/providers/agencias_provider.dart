import 'package:app_banca_virtual_movil_2/domain/uses_cases/agencias/agencias_usescase.dart';
import 'package:app_banca_virtual_movil_2/infraestructure/driven_adapters/api/agencias_adapter_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final agenciasProvider = Provider<AgenciasUsescase>((ref) {
  return AgenciasUsescase(AgenciasAdapterApi());
});
