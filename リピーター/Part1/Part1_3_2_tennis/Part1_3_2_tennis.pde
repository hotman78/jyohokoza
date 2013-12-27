
float x, y, vx, vy;
float px, py;

void setup(){
  size(200, 300);
  x = random(0, width);
  y = random(0, 150);
  vx = random(2, 4);
  vy = random(2, 4);
}

void draw(){
  background(255);
  
  x += vx;
  y += vy;
  px = mouseX;
  py = 280;
  
  if(x<0 && vx<0) vx = -vx;       // 左端
  if(x>width && vx>0) vx = -vx;   // 右端
  if(y<0 && vy<0) vy = -vy;       // 上端
  if(y>py-10 && y<height && x>px-30 && x<px+30 && vy>0) vy = -vy; // バー
  
  ellipse(x, y, 10, 10);
  rect(px-30, py, 60, 10);
}



