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
  background(0, 0, 0);
}

void draw(){
  rect(0, 0, 0, 20);
  for(int i=10; i>0; i--){
    noStroke();
    fill(255-i*25, 0, 0);
    ellipse(x, y, i*6, i*6);
  }
  y += vy;
  vy += 0.2;
  x += 1;
  
  if(y>200){
    vy = -vy;
  }
}


