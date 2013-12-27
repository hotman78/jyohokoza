class Player{
  float px, py;
  
  Player(){
    py = 280;
  }
  
  void draw(){
    rect(px-30, py, 60, 10);
  }
}
