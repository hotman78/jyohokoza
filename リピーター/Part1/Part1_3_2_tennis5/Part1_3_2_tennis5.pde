Ball[] bs;
Player p;

void setup(){
  size(200, 300);
  bs = new Ball[100];
  for(int i=0; i<100; i++){
    bs[i] = new Ball();
  }
  p = new Player();
}

void draw(){
  background(255);
  
  p.px = mouseX;
  for(int i=0; i<100; i++){
    bs[i].move(p.px, p.py);
  }
  p.draw();
  for(int i=0; i<100; i++){
    bs[i].draw();
  }
}


