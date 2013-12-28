class Ball{
  float x, y, vx, vy;
  
  Ball(){
    x = random(0, width);
    y = random(0, 150);
    vx = random(2, 4);
    vy = random(2, 4);
  }
  
  void move(float px, float py){
    x += vx;
    y += vy;
    if(x<0 && vx<0) vx = -vx;
    if(x>width && vx>0) vx = -vx;
    if(y<0 && vy<0) vy = -vy;
    if(y>py && y<height && x>px-30 && x<px+30 && vy>0) vy = -vy;
  }
  
  void draw(){
    ellipse(x, y, 10, 10);
  }
}
