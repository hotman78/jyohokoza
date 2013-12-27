float x;
float y;
float d;
float r, g, b;

void setup(){
  size(200, 200);
  d = 0;
  r=255;
  g=0;
  b=0;
  frameRate(10);
}

void draw(){
  background(r, g, b);
  r-=10;
  g+=0;
  b+=10;
//  background(255, 255, 255);
//  ellipse(100, 100, d, d);
//  d += 1;
}


