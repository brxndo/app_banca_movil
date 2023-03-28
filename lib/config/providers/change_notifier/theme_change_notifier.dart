import 'package:app_banca_virtual_movil_2/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeChangeNotifier extends ChangeNotifier {
  ThemeData _themeData = AppTheme.theme;

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}
