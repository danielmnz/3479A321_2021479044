import 'package:flutter/material.dart';
import 'package:probando_flutter_lab1/models/cell_model.dart';
import 'dart:math'; //para el random
import 'dart:async';
import 'package:audioplayers/audioplayers.dart'; //audio
import 'package:sensors_plus/sensors_plus.dart'; //sensor

class GameViewModel extends ChangeNotifier {
  //para crear las celdas dentro de generateboard
  late List<CellModel> _cells;
  List<CellModel> get cells => _cells;

  bool _isGameOver = false;
  bool get isGameOver => _isGameOver;

  //lab6, reloj
  Timer? _timer;
  int secondsElapsed = 0;
  bool _isFirstTrap = true;

  //audio
  final AudioPlayer _sfxPlayer = AudioPlayer();

  //sensores
  StreamSubscription? _accelerometerSuscription;

  final int gridSize;
  late int totalCells;

  //constructor
  GameViewModel({required this.gridSize}) {
    totalCells = gridSize * gridSize; //ej 10x10 = 100 celdas
    _generateBoard(); //generar tablero

    _initAccelerometer();
  }

  //revealAll
  void _revealAll() {
    for (var cell in _cells) {
      cell.isRevealed = true; //recorre todas las celdas
    }
  }

  void _generateBoard() {
    // 1. Creamos las x celdas vacías
    _cells = List.generate(totalCells, (i) => CellModel(index: i));
    //cambio de 64 por el totalCells que se irá cambiando en settings

    // 2. Sembrar 10 bombas aleatorias
    Random random = Random();
    int bombsPlanted = 0;
    while (bombsPlanted < 10) {
      int index = random.nextInt(totalCells);
      if (!_cells[index].isBomb) {
        _cells[index].isBomb = true;
        bombsPlanted++;
      }
    }

    _calculateAdjacentMines(); //llamar funcion
  }

  void _calculateAdjacentMines() {
    for (int i = 0; i < _cells.length; i++) {
      if (_cells[i].isBomb) continue;

      int row = i ~/ gridSize;
      int col = i % gridSize;
      int count = 0;

      for (int r = -1; r <= 1; r++) {
        for (int c = -1; c <= 1; c++) {
          if (r == 0 && c == 0) continue;
          int newRow = row + r;
          int newCol = col + c;

          if (newRow >= 0 &&
              newRow < gridSize &&
              newCol >= 0 &&
              newCol < gridSize) {
            int neighborIndex = (newRow * gridSize) + newCol;
            if (_cells[neighborIndex].isBomb) count++;
          }
        }
      }
      _cells[i].adjacentMines = count;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsElapsed++;
      notifyListeners();
    });
  }

  void _resetGame() {
    _timer?.cancel();
    secondsElapsed = 0;
    _isFirstTrap = true;
    _isGameOver = false;
    _generateBoard();
    notifyListeners();
  }

  void _initAccelerometer() {
    _accelerometerSuscription = accelerometerEventStream().listen((AccelerometerEvent event) {
      print(event.x.abs());

      //agitar fuerte para reiniciar
      if (_isGameOver && event.x.abs() > 15.0) {
        _resetGame();
      }
    });
  }

  //audio
  void _playSound(String fileName) async {
    await _sfxPlayer.release();
    await _sfxPlayer.play(AssetSource("audio/$fileName"));
  }

  void revealCell(int index) {
    if (_isGameOver || _cells[index].isRevealed) return;

    _cells[index].isRevealed = true;

    //timer
    if (_isFirstTrap) {
      _startTimer();
      _isFirstTrap = false;
    }

    // Si toca una bomba, el juego termina
    if (_cells[index].isBomb) {
      //audio bomba
      _playSound("explosion.mp3");      

      _isGameOver = true;
      _revealAll(); // Función para mostrar todo al morir.
    }else{
      _playSound("onTap.mp3");
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel(); //cancelar timer al gameover

    _sfxPlayer.dispose();
    
    _accelerometerSuscription?.cancel();

    super.dispose();
  }
}
