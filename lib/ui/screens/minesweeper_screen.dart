import 'package:flutter/material.dart';
//import 'package:logger/logger.dart';
//import 'package:probando_flutter_lab1/models/cell_model.dart';
import 'package:probando_flutter_lab1/ui/screens/history_screen.dart';
import 'package:probando_flutter_lab1/ui/screens/menu_screen.dart';
import 'package:probando_flutter_lab1/ui/widgets/minecell.dart';
import 'package:probando_flutter_lab1/ui/screens/about.dart';
import 'package:probando_flutter_lab1/models/game_view.dart';
import 'package:provider/provider.dart';

class MinesweeperScreen extends StatefulWidget {
  const MinesweeperScreen({Key? key}) : super(key: key);

  @override
  State<MinesweeperScreen> createState() => _MinesweeperScreenState();
}

class _MinesweeperScreenState extends State<MinesweeperScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String difficulty = args?['difficulty'] ?? 'Desconocida';
    final int gridSize = args?['gridSize'] ?? 8;

    final viewModel = context.watch<GameViewModel>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buscaminas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        //dentro de propieades de appbar, usar actions
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            onPressed: () {
              //navegar a la otra pantalla
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 80,
      ),

      body: SafeArea(
        child: Column(
          children: [
            //area de status
            Container(
              height: 60,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  "Dificultad: $difficulty | Grid: ${gridSize}x$gridSize",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            const Divider(height: 1),
            //area de juego
            Expanded(
              //child: Text("Tablero de Juego", style: TextStyle(fontSize: 24, color: Colors.grey)),
              child: _gameBoard(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameBoard(GameViewModel viewModel) {
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
              return MineCell(
                cell: viewModel.cells[index],
                onTap: () => viewModel.revealCell(index),
              ); //clase widget del container
            },
          ),
        ),
      ),
    );
  }
}