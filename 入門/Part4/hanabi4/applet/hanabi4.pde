float[] x = new float[10000];
float[] y = new float[10000];
float[] vx = new float[10000];
float[] vy = new float[10000];
float[] h = new float[10000];
float[] b = new float[10000];
int N = 0;

void setup(){
  smooth();
  size(500, 500);
  colorMode(HSB, 100, 100, 100);
  fill(0, 0, 0);  //白
  rect(-1, -1, 501, 501);  //画面全体を白い四角形で覆う
}

void draw(){
  fill(0, 0, 0, 20);  //白
  rect(-1, -1, 501, 501);  //画面全体を白い四角形で覆って残像を消す
  
  for(int i=0; i<N; i++){  //変数iを0から99まで動かす
    fill(h[i], 100, b[i]);
    noStroke();
    ellipse(x[i], y[i], 2, 2);  //i番目の○を描く
    x[i] += vx[i];
    y[i] += vy[i];
    vy[i] += 0.02;
    vx[i] *= 0.97;
    vy[i] *= 0.97;
    b[i] -= 1;
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



