import 'dart:convert';

import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/gateway/posicion_consolidada_gateway.dart';
import 'package:app_banca_virtual_movil_2/domain/models/posicion_consolidada/posicion_consolidada.dart';
import 'package:http/http.dart' as http;

import '../../../domain/models/posicion_consolidada/cuenta_credito.dart';
import '../../../domain/models/posicion_consolidada/cuenta_inversion.dart';
import '../../../domain/models/posicion_consolidada/cuenta_vista.dart';

class PosicionConsolidadaAdapterApi extends PosicionConsolidadaGateway {
  @override
  Future<PosicionConsolidada> consultarSaldo(int id) async {
    Uri url =
        Uri.parse('http://192.168.1.13:3000/usuario/posicion_consolidada/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      PosicionConsolidada posicion = PosicionConsolidada(
        cuentasVista: [],
        cuentasCredito: [],
        cuentasInversion: [],
      );
      if (response.body.isNotEmpty) {
        final Map<String, dynamic> decodedResp = json.decode(response.body);
        if (decodedResp.containsKey('cuentas_vista')) {
          List<dynamic> ahorros = decodedResp['cuentas_vista'];
          List<dynamic> creditos = decodedResp['cuentas_credito'];
          List<dynamic> inversiones = decodedResp['cuentas_inversion'];
          List<CuentaVista> listaAhorros = [];
          List<CuentasCredito> listaCreditos = [];
          List<CuentasInversion> listaInversion = [];
          for (var item in ahorros) {
            listaAhorros.add(CuentaVista.fromJson(item));
          }

          for (var item in creditos) {
            listaCreditos.add(CuentasCredito.fromJson(item));
          }

          for (var item in inversiones) {
            listaInversion.add(CuentasInversion.fromJson(item));
          }

          posicion = PosicionConsolidada(
              cuentasVista: listaAhorros,
              cuentasCredito: listaCreditos,
              cuentasInversion: listaInversion);
        }
      }
      return posicion;
    } else {
      throw Exception('Error al obtener el dato del día');
    }
  }
}
