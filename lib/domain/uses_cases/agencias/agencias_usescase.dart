import 'dart:async';

import 'package:app_banca_virtual_movil_2/domain/models/agencias/gateway/agencias_gateway.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AgenciasUsescase {
  final AgenciasGateway agenciasGateway;

  AgenciasUsescase(this.agenciasGateway);

  Future<void> abrirUrl(String url) {
    return agenciasGateway.abrirUrl(url);
  }

  Future<void> loadMapStyle() {
    return agenciasGateway.loadMapStyle();
  }

  Future<void> setMapStyle(Completer<GoogleMapController> _controller) {
    return agenciasGateway.setMapStyle(_controller);
  }
}
