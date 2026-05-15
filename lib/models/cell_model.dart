class CellModel { 
 final int index; 
 bool isBomb; 
 bool isRevealed; 
 bool isFlagged; 

 //lab 6
 int adjacentMines;
 
 CellModel({ 
   required this.index, 
   this.isBomb = false, 
   this.isRevealed = false, 
   this.isFlagged = false,
   this.adjacentMines = 0,
 }); 
}