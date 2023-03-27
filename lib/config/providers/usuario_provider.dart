import 'package:app_banca_virtual_movil_2/config/providers/change_notifier/calculo_plazo_fijo_change_notifier.dart';
import 'package:app_banca_virtual_movil_2/domain/uses_cases/usuario/usuario_usescase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infraestructure/driven_adapters/api/usuario_adapter_api.dart';
import 'change_notifier/estados_usuario_change_notifier.dart';

final usuarioProvider = Provider<UsuarioUsesCase>((ref) {
  return UsuarioUsesCase(UsuarioAdapterApi());
});

final estadosUsuario =
    ChangeNotifierProvider((ref) => EstadosUsuarioChangeNotifier());

final plazoFijoUsuario =
    ChangeNotifierProvider((ref) => CalculoPlazoFijoChangeNotifier());
