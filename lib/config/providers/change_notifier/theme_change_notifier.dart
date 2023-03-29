import 'package:app_banca_virtual_movil_2/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeChangeNotifier extends ChangeNotifier {
  ThemeData _themeData = AppTheme.theme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
