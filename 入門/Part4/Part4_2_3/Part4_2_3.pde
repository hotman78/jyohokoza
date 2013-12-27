float[] x, y, vx, vy;

void setup(){
  size(300, 300);
  x = new float[2];
  y = new float[2];
  vx = new float[2];
  vy = new float[2];
  x[0] = random(0, width);
  y[0] = random(0, height);
  x[1] = random(0, width);
  y[1] = random(0, height);
  vx[0] = random(-1, 1);
  vy[0] = random(-1, 1);
  vx[1] = random(-1, 1);
  vy[1] = random(-1, 1);
}

void draw(){
  ellipse(x[0], y[0], 10, 10);
  ellipse(x[1], y[1], 10, 10);
  x[0] += vx[0];
  y[0] += vy[0];
  x[1] += vx[1];
  y[1] += vy[1];
}

