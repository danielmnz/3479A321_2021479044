import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscaminas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MinesweeperScreen(), // Apuntamos a nuestra nueva pantalla
    );
  }
}
//shift+alt+f
//ordenar todo


 
 //ordenar el código, el override está fuera de una clase, revisar despues
class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscaminas')),
      body: SafeArea(
        child: Column(
          children: [
            //area de status
            Container(
              height: 60,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  "STATUS: 349 segundos | Minas : 10 | Cuadros: 56",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                  ),
                ),
              ),
            const Divider(height: 1),
            //area de juego
            Expanded(
              //child: Text("Tablero de Juego", style: TextStyle(fontSize: 24, color: Colors.grey)),
              child: _gameBoard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameBoard() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(), //bloquea scroll
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, //8 columnas
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 64, //8x8 = 64 celdas
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  border: Border.all(color: Colors.grey[600]!, width: 1.5),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  
}