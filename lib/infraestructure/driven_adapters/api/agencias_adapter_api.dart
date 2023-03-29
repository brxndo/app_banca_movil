import 'dart:async';

import 'package:app_banca_virtual_movil_2/ui/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/models/agencias/gateway/agencias_gateway.dart';

class AgenciasAdapterApi extends AgenciasGateway {
  late String darkMapStyle;
  late String lightMapStyle;

  @override
  Future<void> abrirUrl(String url) async {
    Uri newUrl = Uri.parse(url);

    try {
      if (!await launchUrl(newUrl, mode: LaunchMode.externalApplication)) {
        throw Exception('No se puede abrir $newUrl');
      }
    } catch (e) {
      newUrl = Uri.parse('https://www.facebook.com/coopdaquilema');
      await launchUrl(newUrl);
    }
  }

  @override
  Future<void> loadMapStyle() async {
    darkMapStyle = await rootBundle.loadString('assets/map_styles/dark.json');
    lightMapStyle = await rootBundle.loadString('assets/map_styles/light.json');
  }

  @override
  Future<void> setMapStyle(Completer<GoogleMapController> _controller) async {
    final controller = await _controller.future;
    if (globalIsDarkSelected) {
      controller.setMapStyle(darkMapStyle);
    } else {
      controller.setMapStyle(lightMapStyle);
    }
  }
}
