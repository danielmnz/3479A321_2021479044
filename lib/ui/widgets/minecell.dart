import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {

  final int index;
  const  MineCell({ 
    Key? key, 
    required  this .index,  // Parámetro obligatorio  en el constructor 
  }) :  super (key: key); 

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); //llamando al theme

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        border: Border.all(color: Colors.grey[600]!, width: 1.5),
      ),

      child: Center(
        child: Icon(
          Icons.flag, size: 30, color: theme.colorScheme.primary, //llamamos al scheme
        ),
      ),
    );
  }
}