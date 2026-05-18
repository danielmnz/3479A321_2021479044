import 'package:flutter/material.dart';
import 'package:probando_flutter_lab1/core/services/storage_service.dart';
import 'package:probando_flutter_lab1/models/settings_model.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var username = StorageService.getUsername(); //me sirve para el proyecto

    final settings = context.watch<SettingsViewModel>();
    final difficulty = context.watch<SettingsViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Menú")),
      body: Center(
        child: Column(
          children: [

            //
            Text(
              "Pantalla de menú, Bienvenido ${settings.username}! \n Dificultad actual: ${settings.difficulty}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, "/settings");
              },
              child: const Text("Ir a Ajustes"),
            ),
            //

            SizedBox(height: 19),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Test -> Ir a Historial'),
            ),

            SizedBox(height: 9),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/game',
                arguments: {'difficulty' : 'Facil', 'gridSize': 8},
              ),
              child: const Text('IR AL JUEGO'),
            ),
          ],
        ),
      ),
    );
  }
}
