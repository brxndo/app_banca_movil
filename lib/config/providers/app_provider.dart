import 'package:app_banca_virtual_movil_2/config/providers/change_notifier/theme_change_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeChangeNotifier());
