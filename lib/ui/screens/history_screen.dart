import 'package:flutter/material.dart';
import 'package:probando_flutter_lab1/models/game_result.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final List<GameResult> listMaqueta = [
    GameResult(
      date: '10 mayo',
      timeSpent: '01:30',
      isVictory: true,
      difficulty: 'Fácil',
    ),
    GameResult(
      date: '11 mayo',
      timeSpent: '02:40',
      isVictory: false,
      difficulty: 'Dificil',
    ),
    GameResult(
      date: '12 mayo',
      timeSpent: '03:50',
      isVictory: true,
      difficulty: 'Media',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Historial",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 80,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final game = listMaqueta[index];
          return Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Fecha: ${game.date}'),
                  Text('Tiempo: ${game.timeSpent}'),
                  Text('Dificultad: ${game.difficulty}'),
                ],
              ),
            ),
          );
        },
        itemCount: listMaqueta.length,
      ),
    );
  }
}
