import 'package:flutter/material.dart';
import 'package:probando_flutter_lab1/core/services/storage_service.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var username = StorageService.getUsername(); //me sirve para el proyecto

    return Scaffold(
      appBar: AppBar(title: const Text("Menú")),
      body: Center(
        child: Column(
          children: [

            Text(
              "Pantalla de menú, Bienvenido! $username",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

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
