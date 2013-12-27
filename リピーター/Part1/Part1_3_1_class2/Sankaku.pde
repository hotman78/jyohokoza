
class Sankaku{
  float x0, y0, x1, y1, x2, y2;
  
  Sankaku(){
    x0 = random(0, width);
    y0 = random(0, height);
    x1 = random(0, width);
    y1 = random(0, height);
    x2 = random(0, width);
    y2 = random(0, height);
  }
  
  void draw(){
    line(x0, y0, x1, y1);
    line(x1, y1, x2, y2);
    line(x2, y2, x0, y0);
  }
}
  
