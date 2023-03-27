import 'package:app_banca_virtual_movil_2/domain/uses_cases/transferencia/transferencia_usescase.dart';
import 'package:app_banca_virtual_movil_2/infraestructure/driven_adapters/api/transferencia_adapter_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transferenciaProvider = Provider<TransferenciaUsesCase>((ref) {
  return TransferenciaUsesCase(TransferenciaAdapterApi());
});
