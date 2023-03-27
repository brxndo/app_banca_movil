import 'dart:convert';

import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/cuenta_vista.dart';
import 'package:app_banca_virtual_movil_2/domain/models/transferencia/cuenta_destino.dart';
import 'package:app_banca_virtual_movil_2/domain/models/transferencia/gateway/transferencia_gateway.dart';
import 'package:app_banca_virtual_movil_2/domain/models/transferencia/transferencia.dart';
import 'package:http/http.dart' as http;

class TransferenciaAdapterApi extends TransferenciaGateway {
  @override
  Future<Transferencia> transferir(Transferencia transferencia) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.13:3000/transferencia/insertar'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(transferencia.toJson()),
    );
    print(response.body);
    return transferencia;
  }

  @override
  Future<List<CuentaVista>> obtenerCuentasVista() async {
    Uri url = Uri.parse('http://192.168.1.13:3000/cuenta-vista/cuentaVista/1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<CuentaVista> cuentasVista = [];

      if (response.body.isNotEmpty) {
        final List<dynamic> decodedResp = json.decode(response.body);
        for (var item in decodedResp) {
          cuentasVista.add(CuentaVista.fromJson(item));
        }
      } else {
        cuentasVista = [];
      }
      return cuentasVista;
    } else {
      throw Exception('Error al obtener el dato');
    }
  }

  @override
  Future<List<CuentaDestino>> obtenerCuentasDestino() async {
    Uri url =
        Uri.parse('http://192.168.1.13:3000/cuenta-destino/cuenta_destino/1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<CuentaDestino> cuentasDestino = [];

      if (response.body.isNotEmpty) {
        final List<dynamic> decodedResp = json.decode(response.body);
        for (var item in decodedResp) {
          cuentasDestino.add(CuentaDestino.fromJson(item));
        }
      } else {
        cuentasDestino = [];
      }
      return cuentasDestino;
    } else {
      throw Exception('Error al obtener el dato');
    }
  }
}
