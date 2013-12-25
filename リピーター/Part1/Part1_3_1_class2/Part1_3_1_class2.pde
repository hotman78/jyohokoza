

Maru maru;
Sankaku sankaku;

void setup(){
  size(300, 300);
  maru = new Maru(100, 200);
  sankaku = new Sankaku();
}

void draw(){
  maru.move();
  maru.draw();
  sankaku.draw();
}


  
