import 'package:app_banca_virtual_movil_2/app/app.dart';
import 'package:app_banca_virtual_movil_2/ui/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? false;
      globalIsDarkSelected = darkModeOn;
      runApp(const ProviderScope(child: AppArquitecturaLimpia2()));
    });
  });
}
