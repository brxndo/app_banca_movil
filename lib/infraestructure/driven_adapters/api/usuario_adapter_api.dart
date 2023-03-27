import 'dart:convert';

import 'package:app_banca_virtual_movil_2/domain/models/usuario/gateway/usuario_gateway.dart';
import 'package:http/http.dart' as http;

class UsuarioAdapterApi extends UsuarioGateway {
  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    Map<String, String> credenciales = {
      'username': username,
      'password': password,
    };

    Map<String, String> error = {};

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.13:3000/usuario/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(credenciales),
      );

      if (response.body.isNotEmpty) {
        final res = jsonDecode(response.body);
        return res;
      } else {
        return error;
      }
    } catch (e) {
      return error = {
        'message': 'Fallo en la conexión',
      };
    }

    // if (response.statusCode == 201) {
    //   Usuario usuario = Usuario(
    //     idUsuario: res['id_usuario'],
    //     cedulaUsuario: res['cedula_usuario'],
    //     primerNombreUsuario: res['primer_nombre_usuario'],
    //     segundoNombreUsuario: res['segundo_nombre_usuario'],
    //     apellidosUsuario: res['apellidos_usuario'],
    //     fechaNacimientoUsuario: res['fecha_nacimiento_usuario'],
    //     direccionUsuario: res['direccion_usuario'],
    //     telefonoUsuario: res['telefono_usuario'],
    //     emailUsuario: res['email_usuario'],
    //     numeroSocioUsuario: res['numero_socio_usuario'],
    //     username: res['username'],
    //     password: res['password'],
    //     tokenUsuario: res['token_usuario'],
    //   );
    //   return usuario;
    // } else {
    //   return res;
    // }
  }
}
