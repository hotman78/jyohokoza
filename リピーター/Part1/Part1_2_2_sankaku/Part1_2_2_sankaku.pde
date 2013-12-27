

void setup(){
  size(300, 300);
}

void draw(){
  maru(mouseX, mouseY);
  sankaku(10, 20, 30, 40, 50, 60);
}


void maru(float x, float y){
  ellipse(x, y, 10, 10);
}

void sankaku(float x0, float y0, float x1, float y1, float x2, float y2){
  line(x0, y0, x1, y1);
  line(x1, y1, x2, y2);
  line(x2, y2, x0, y0);
}
