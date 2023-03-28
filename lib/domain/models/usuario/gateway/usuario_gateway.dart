import '../usuario.dart';

abstract class UsuarioGateway {
  Future<Map<String, dynamic>> login(String username, String password);
  Future<bool> supportAuthWithCredentials();
  Future<String> autenticacionBiometrica();
}
