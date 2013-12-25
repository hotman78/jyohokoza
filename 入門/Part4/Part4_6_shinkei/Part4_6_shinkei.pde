int[][] a;
int N = 4;
int mode;    // card ga mekurareteiru maisuu
int mi, mj;
int mi2, mj2;

void setup(){
  size(160, 160);
  a = new int[N][N];
  for(int i=0; i<N; i++){
    for(int j=0; j<N; j++){
      a[i][j] = (i*N+j)/2 + 1;
    }
  }
  for(int i=0; i<100; i++){
    int i1 = (int)random(0, N);
    int j1 = (int)random(0, N);
    int i2 = (int)random(0, N);
    int j2 = (int)random(0, N);
    int t = a[i1][j1];
    a[i1][j1] = a[i2][j2];
    a[i2][j2] = t;
  }
  mode = 0;
}

void draw(){
  background(255, 255, 255);
  for(int i=0; i<N; i++){
    for(int j=0; j<N; j++){
      if(a[i][j] == 0){
        fill(0, 0, 0);
      }else{
        fill(255, 255, 255);
      }
      rect(i*40, j*40, 40, 40);
      if(a[i][j]<0){
        fill(0, 0, 0);
        text(-a[i][j], i*40+15, j*40+25);
      }
    }
  }
  if(mode>=2 && mode<=100) mode++;
  if(mode>60){
    if(a[mi][mj] == a[mi2][mj2]){
      a[mi][mj] = 0;
      a[mi2][mj2] = 0;
    }
    a[mi][mj] *= -1;
    a[mi2][mj2] *= -1;
    mode = 0;
  }
}

void mousePressed(){
  int i = mouseX/40;
  int j = mouseY/40;
  if(mode==0){
    a[i][j] *= -1;
    mode++;
    mi = i;
    mj = j;
  }
  else if(mode==1){
    if(i!=mi || j!=mj){
      a[i][j] *= -1;
      mi2 = i;
      mj2 = j;
      mode++;
    }
  }
}

