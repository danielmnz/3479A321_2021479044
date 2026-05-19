import 'package:flutter/material.dart';
import 'package:probando_flutter_lab1/models/cell_model.dart';

class MineCell extends StatelessWidget {
  //final int index;

  final CellModel cell;
  final VoidCallback onTap;

  const MineCell({Key? key, required this.cell, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); //llamando al theme

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          border: Border.all(color: Colors.grey[600]!, width: 1.5),
        ),

        child: Center(
          child: _buildCellContent(),
        ),
      ),
    );
  }

  Widget _buildCellContent() {
    if (!cell.isRevealed) {
      return const SizedBox.shrink();
    }

    if (cell.isBomb) {
      return Image.asset(
        'assets/icons/bomba.png',
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      );
    }

    //en caso de que no haya minas en la celda, que no muestre un 0
    if (cell.adjacentMines == 0) {
      return const SizedBox.shrink();
    }

    Color numberColor;

    switch (cell.adjacentMines) {
      case 1:
        numberColor = Colors.blue;
      break;

      case 2:
        numberColor = Colors.green;
      break;

      case 3:
        numberColor = Colors.red;
      break;

      case 4:
        numberColor = Colors.purple;
      break;

      case 5:
        numberColor = Colors.brown;
      break;

      default:
        numberColor = Colors.black;
      break;
    }

    return Text(
      '${cell.adjacentMines}',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: numberColor, //así, cambia el color del texto de cada celda
        fontSize: 16,
      ),
    );
    //añadir boton inferior derecha, reiniciar juego
  }
}
