import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthHelper {
  final FlutterSecureStorage _secureStorage;

  AuthHelper({required FlutterSecureStorage secureStorage})
      : _secureStorage = secureStorage;

  static const String _authTokenKey = 'token_usuario';
  static const String _idUsuario = 'id_usuario';

  Future<void> saveAuthToken(String authToken) async {
    await _secureStorage.write(key: _authTokenKey, value: authToken);
  }

  Future<void> saveIdUsuario(int idUsuario) async {
    await _secureStorage.write(key: _idUsuario, value: idUsuario.toString());
  }

  Future<String?> getAuthToken() async {
    return await _secureStorage.read(key: _authTokenKey);
  }

  Future<String?> getIdUsuario() async {
    return await _secureStorage.read(key: _idUsuario);
  }

  Future<bool> isUserLoggedIn() async {
    final authToken = await getAuthToken();
    return authToken != null;
  }

  Future<void> clearAuthToken() async {
    await _secureStorage.delete(key: _authTokenKey);
  }

  Future<void> clearIdUsuario() async {
    await _secureStorage.delete(key: _idUsuario);
  }
}
