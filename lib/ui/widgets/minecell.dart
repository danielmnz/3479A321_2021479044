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

    return Text(
      '${cell.index}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
    );
  }
}
