
import ddf.minim.*;

Game game;
AudioPlayer player;
Minim minim;

void setup(){
  size(600, 500);
  game = new Game();
  minim = new Minim(this);
  player = minim.loadFile("pi.mp3");
  player.play();
}
void stop(){
  player.close();
  minim.stop();
  super.stop();
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
