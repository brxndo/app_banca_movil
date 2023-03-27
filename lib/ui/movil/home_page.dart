import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../infraestructure/helpers/auth_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arquitectura Limpia'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('transferencia'),
              child: const Text(
                'Transferir',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                const storage = FlutterSecureStorage();
                bool tokenExists =
                    await AuthHelper(secureStorage: storage).isUserLoggedIn();

                String idUsuario =
                    await AuthHelper(secureStorage: storage).getIdUsuario() ??
                        '';

                if (tokenExists && idUsuario != '') {
                  Navigator.of(context)
                      .pushReplacementNamed('posicionconsolidada');
                  return;
                }

                Navigator.of(context).pushNamed('login');
              },
              child: const Text(
                'Login',
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('simulador'),
              child: const Text(
                'Simulador',
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('agencias'),
              child: const Text(
                'Agencias',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
