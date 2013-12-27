float[] x, y, vx, vy;
int[] a;

void  setup(){
  size(300, 300);
  x = new float[200];
  y = new float[200];
  vx = new float[200];
  vy = new float[200];
  a = new int[200];
  
  for(int i=0; i<200; i++){
    x[i] = width/2;
    y[i] = height/2;
    float t = random(0, 2*PI);
    float v = random(0.0, 1);
    vx[i] = v*cos(t);
    vy[i] = v*sin(t);
    a[i] = 100;
  }
}

void draw(){
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  noStroke();
  fill(255, 255, 0);
  for(int i=0; i<200; i++){
    if(a[i]<100){
      ellipse(x[i], y[i], 2, 2);
      x[i] += vx[i];
      y[i] += vy[i];
      a[i]++;
    }
  }
  /*
  for(int i=0; i<200; i++){
    if(x[i]<0 || x[i]>width || y[i]<0 || y[i]>height){
      x[i] = width/2;
      y[i] = height/2;
    }
  }
  */
}

void mousePressed(){
  for(int i=0; i<200; i++){
    x[i] = mouseX;
    y[i] = mouseY;
    a[i] = 0;
  }
}
