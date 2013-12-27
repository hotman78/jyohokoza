Ball b1, b2;
Player p;

void setup(){
  size(200, 300);
  b1 = new Ball();
  b2 = new Ball();
  p = new Player();
}

void draw(){
  background(255);
  
  p.px = mouseX;
  b1.move(p.px, p.py);
  b2.move(p.px, p.py);
  p.draw();
  b1.draw();
  b2.draw();
}


