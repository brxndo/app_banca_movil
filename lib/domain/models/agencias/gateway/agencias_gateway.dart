import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AgenciasGateway {
  Future<void> abrirUrl(String url);
  Future<void> loadMapStyle();
  Future<void> setMapStyle(Completer<GoogleMapController> _controller);
}
