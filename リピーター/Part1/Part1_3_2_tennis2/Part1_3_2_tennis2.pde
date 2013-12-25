Ball b;
float px, py;

void setup(){
  size(200, 300);
  b = new Ball();
}

void draw(){
  background(255);
  
  px = mouseX;
  py = 280;
  
  b.move(px, py);
  b.draw();
  
  rect(px-30, py, 60, 10);
}


