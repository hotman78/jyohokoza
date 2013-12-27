float[] x = new float[10000];
float[] y = new float[10000];
float[] vx = new float[10000];
float[] vy = new float[10000];
float[] h = new float[10000];
float[] b = new float[10000];
int N = 0;
float k = 0.5;

void setup(){
  smooth();
  size(500, 500);
  colorMode(HSB, 100, 100, 100);
  fill(0, 0, 0);  // 黒
  rect(-1, -1, 501, 501);  //画面全体を覆う
  frameRate(30);
}

void draw(){
  fill(0, 0, 0, 20);  // 黒
  rect(-1, -1, 501, 501);
  
  loadPixels();
  for(int i=0; i<N; i++){  //変数iを0から99まで動かす
//    fill(h[i], 100, b[i]);
//    noStroke();
    color cl = color(h[i], 100, 100);
    colorMode(RGB, 100);
    for(int ix=-5; ix<=5; ix++){
      for(int iy=-5; iy<=5; iy++){
        if(x[i]+ix>=0&&x[i]+ix<width&&y[i]+iy>=0&&y[i]+iy<height){
          float d = dist(x[i], y[i], x[i]+ix, y[i]+iy) + 0.1;
          color c2 = pixels[(int)(y[i]+iy)*width+(int)(x[i]+ix)];
          pixels[(int)(y[i]+iy)*width+(int)(x[i]+ix)] = color(red(c2)+k*(3+red(cl))/d/d, green(c2)+k*(2+green(cl))/d/d, blue(c2)+k*(1+blue(cl))/d/d);
        }
      }
    }
    colorMode(HSB, 100);
//    ellipse(x[i], y[i], 2, 2);  //i番目の○を描く
    x[i] += vx[i];
    y[i] += vy[i];
    vy[i] += 0.02;
    vx[i] *= 0.97;
    vy[i] *= 0.97;
    b[i] -= 1;
  }
  updatePixels();
  
  for(int i=0; i<N; i++){
    if(b[i]<50){
      h[i] = h[N-1];
      x[i] = x[N-1];
      y[i] = y[N-1];
      vy[i] = vy[N-1];
      vx[i] = vx[N-1];
      b[i] = b[N-1];
      N--;
    }
  }
  
  if(random(0, 1)<0.03) {
    newHanabi();
  }
}

void newHanabi(){
  if(N<500){
  float hu = random(0, 100);
  float rx = random(width/4, 3*width/4);
  float ry = random(height/7, 3*height/5);
  for(int i=0; i<160; i++){
    x[N] = rx;
    y[N] = ry;
    float v = random(0.0, 4.0);
    float th = random(0, 2*PI);
    vx[N] = v*sin(th);
    vy[N] = v*cos(th);
    h[N] = hu;
    b[N] = 150;
    N++;
  }
  color c0 = color(hu, 100, 100);
  colorMode(RGB, 100);
  loadPixels();
  for(int i=0; i<width; i++){
    for(int j=0; j<height; j++){
      float d = dist(i, j, rx, ry);
      color c = pixels[j*width+i];
      pixels[j*width+i] = color(red(c)+1000*red(c0)/d/d, green(c)+1000*green(c0)/d/d, blue(c)+1000*blue(c0)/d/d);
    }
  }
  updatePixels();
  colorMode(HSB, 100);
  }
}

void mousePressed(){
  float hu = random(0, 100);
  for(int i=0; i<100; i++){
    x[N] = mouseX;
    y[N] = mouseY;
    float v = random(0.0, 4.0);
    float th = random(0, 2*PI);
    vx[N] = v*sin(th);
    vy[N] = v*cos(th);
    h[N] = hu;
    b[N] = 150;
    N++;
  }
}



