import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menú")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Test -> Ir a Historial'),
            ),

            SizedBox(height: 9),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/game'),
              child: const Text('IR AL JUEGO'),
            ),
          ],
        ),
      ),
    );
  }
}
