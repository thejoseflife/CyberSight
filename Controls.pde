void keyPressed() {
  if(key == ' ' && !solving) {
    solving = true;
  }
  
  if(!solving && !moving) {
    applyMove(key);
  }
}

void applyMove(char move) {
  switch (move) {
  case 'f': 
    currentMove = allMoves[8];
    moveSequence.add(allMoves[8]);
    currentMove.start();
    break;
  case 'F': 
    currentMove = allMoves[9];
    moveSequence.add(allMoves[9]);
    currentMove.start();
    break;  
  case 'b': 
    currentMove = allMoves[10];
    moveSequence.add(allMoves[10]);
    currentMove.start();
    break;
  case 'B': 
    currentMove = allMoves[11];
    moveSequence.add(allMoves[11]);
    currentMove.start();
    break;
  case 'u': 
    currentMove = allMoves[2];
    moveSequence.add(allMoves[2]);
    currentMove.start();
    break;
  case 'U': 
    currentMove = allMoves[3];
    moveSequence.add(allMoves[3]);
    currentMove.start();
    break;
  case 'D': 
    currentMove = allMoves[0];
    moveSequence.add(allMoves[0]);
    currentMove.start();
    break;
  case 'd': 
    currentMove = allMoves[1];
    moveSequence.add(allMoves[1]);
    currentMove.start();
    break;
  case 'l': 
    currentMove = allMoves[6];
    moveSequence.add(allMoves[6]);
    currentMove.start();
    break;
  case 'L': 
    currentMove = allMoves[7];
    moveSequence.add(allMoves[7]);
    currentMove.start();
    break;
  case 'r': 
    currentMove = allMoves[4];
    moveSequence.add(allMoves[4]);
    currentMove.start();
    
    break;
  case 'R': 
    currentMove = allMoves[5];
    moveSequence.add(allMoves[5]);
    currentMove.start();
    break;
  }
  
}
