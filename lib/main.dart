import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:probando_flutter_lab1/ui/screens/minesweeper_screen.dart';

//logger
var logger = Logger();

void main() {
  logger.d('Iniciando app buscaminas'); //debug
  logger.i('Iniciando app buscaminas'); //info
  logger.w('Iniciando app buscaminas'); //warning
  logger.e('Iniciando app buscaminas'); //error

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscaminas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MinesweeperScreen(),
    );
  }
}
//shift+alt+f
//ordenar todo