
float rx, ry, rr;
float rvx, rvy;
float tx0, ty0, tx1, ty1, tx2, ty2;

void setup(){
  size(300, 300);
  rx = 100;
  ry = 200;
  rvx = random(-5, 5);
  rvy = random(-5, 5);
  rr = 0;
  tx0 = random(0, width);
  ty0 = random(0, height); 
  tx1 = random(0, width);
  ty1 = random(0, height); 
  tx2 = random(0, width);
  ty2 = random(0, height); 
}

void draw(){
  ellipse(rx, ry, rr, rr);
  rx += rvx;
  ry += rvy;
  rr += 2;
  line(tx0, ty0, tx1, ty1);
  line(tx1, ty1, tx2, ty2);
  line(tx2, ty2, tx0, ty0);
}


  
