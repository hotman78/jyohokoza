float[] x, y;

void setup(){
  size(300, 300);
  x = new float[2];
  y = new float[2];
  x[0] = random(0, width);
  y[0] = random(0, height);
  x[1] = random(0, width);
  y[1] = random(0, height);
}

void draw(){
  ellipse(x[0], y[0], 10, 10);
  ellipse(x[1], y[1], 10, 10);
  x[0] += 3;
  y[0] += 1;
  x[1] += -4;
  y[1] += 1;
}


