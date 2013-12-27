float x;
float y;
float vy;
int mode;

void setup(){
  size(200, 200);
  frameRate(30);
  x = 0;
  y = 50;
  mode = 0;
  vy = 0;
}

void draw(){
  background(255, 255, 255);
  for(int i=0; i<10; i++){
    ellipse(x, y, 10, 10);
  }
  y += vy;
  vy += 0.2;
  x += 1;
  
  if(y>200){
    vy = -vy;
  }
}


