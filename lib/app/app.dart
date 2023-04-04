import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../config/providers/app_provider.dart';
import '../config/routes/app_router_movil.dart';
import '../config/routes/app_router_web.dart';
import '../controllers/NotificationsController.dart';

class AppArquitecturaLimpia2 extends ConsumerWidget {
  const AppArquitecturaLimpia2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: NotificationsController.messengerKey,
      routes: kIsWeb ? AppRouterWeb.getRoutes() : AppRouterMovil.getRoutes(),
      initialRoute:
          kIsWeb ? AppRouterWeb.initialRoute : AppRouterMovil.initialRoute,
      theme: theme.themeData,
    );
  }
}
