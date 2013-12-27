Game game;

void setup(){
  size(600, 500);
  game = new Game();
}

void draw(){
  game.update();
  game.key_state.timePassed();
}

void keyPressed(){
  game.key_state.keyPressed();
}

void keyReleased(){
  game.key_state.keyReleased();
}

void mousePressed(){
  game.key_state.mousePressed();
}

void mouseReleased(){
  game.key_state.mouseReleased();
}
