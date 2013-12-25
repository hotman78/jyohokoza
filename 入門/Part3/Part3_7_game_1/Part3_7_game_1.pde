float x, y;
float vx, vy;

void setup(){
  vx = random(3, 5);
  vy = random(3, 5);
  size(200, 200);
  frameRate(50);
}

void draw(){
  background(255, 255, 255);
  
  x += vx;
  y += vy;
  
  if(x<0 || x>width){
    vx = -vx;
  }
  if(y<0){
    vy = -vy;
  }
//  if(y>170 && y<180 && x>mouseX-20 && x<mouseX+20 && vy>0){
//    vy = -vy;
//  }
  if(y>170 && y<180 && vy>0){
    vy = -vy;
  }
  
  ellipse(x, y, 10, 10);
  
//  rect(mouseX-20, 180, 40, 10);
  rect(x-20, 180, 40, 10);
}
