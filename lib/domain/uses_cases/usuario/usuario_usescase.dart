import 'package:app_banca_virtual_movil_2/domain/models/usuario/gateway/usuario_gateway.dart';

class UsuarioUsesCase {
  final UsuarioGateway usuarioGateway;

  UsuarioUsesCase(this.usuarioGateway);

  Future<Map<String, dynamic>> login(String username, String password) {
    return usuarioGateway.login(username, password);
  }
}
