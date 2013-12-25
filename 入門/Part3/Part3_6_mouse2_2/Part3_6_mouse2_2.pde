float x;

void setup(){
  size(200, 200);
  background(255);
  x = 0;
}

void draw(){
  ellipse(x, 100, 20, 20);
}


void mousePressed(){
  x += 10;
}


