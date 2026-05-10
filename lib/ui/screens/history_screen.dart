import 'package:flutter/material.dart';
import 'package:probando_flutter_lab1/models/game_result.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final GameResult game = GameResult(
    date: '10 mayo',
    timeSpent: '01:30',
    isVictory: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial"),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Fecha: ${game.date}'),
                Text('Tiempo: ${game.timeSpent}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}