class Ball{
  float x, y;
  float vx, vy;
  
  Ball(){
    x = random(0, width);
    y = random(0, height);
    vx = random(-2, 2);
    vy = random(-2, 2);
  }
  
  void move(){
    x += vx;
    y += vy;
    if(x<0&&vx<0) vx = -vx;
    if(x>width&&vx>0) vx = -vx;
    if(y<0&&vy<0) vy = -vy;
    if(y>height&&vy>0) vy = -vy;
  }
  
  int touch(float px, float py){
    if(dist(x, y, px, py)<30){
      return 1;
    }else{
      return 0;
    }
  }
  
  void draw(float px, float py){
    if(touch(px, py)==1){
      fill(255, 0, 0, 100);
    }else{
      fill(0, 0, 255, 100);
    }
    ellipse(x, y, 60, 60);
  }
}
    
