
class Maru{
  float x, y;
  float vx, vy;
  float r;
  
  Maru(float x0, float y0){
    x = x0;
    y = y0;
    r = 0;
    vx = random(-5, 5);
    vy = random(-5, 5);
  }
  
  void move(){
    x += vx;
    y += vy;
    r += 2;
  }
  
  void draw(){
    ellipse(x, y, r, r);
  }
}


