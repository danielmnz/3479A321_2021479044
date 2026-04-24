import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla About")),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Esta es la pantalla About",
              style: TextStyle(fontSize: 32),
            ),

            //"espacio" entre texto y el botón
            const SizedBox(height: 30),

            //botón para volver a la pantalla anterior
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Volver atrás"),
            ),
          ],
        ),
      ),
    );
  }
}
