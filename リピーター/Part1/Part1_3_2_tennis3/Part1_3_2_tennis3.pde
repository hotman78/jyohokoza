Ball b;
Player p;

void setup(){
  size(200, 300);
  b = new Ball();
  p = new Player();
}

void draw(){
  background(255);
  
  p.px = mouseX;
  b.move(p.px, p.py);
  p.draw();
  b.draw();
}


