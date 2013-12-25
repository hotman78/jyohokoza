int[][] a;
int N = 8;
int mode;

void setup(){
  size(160, 160);
  a = new int[N][N];
  for(int i=0; i<N; i++){
    for(int j=0; j<N; j++){
      a[i][j] = 0;
    }
  }
  a[3][3] = 1;
  a[3][4] = -1;
  a[4][3] = -1;
  a[4][4] = 1;
  mode = 0;
}

void draw(){
  background(255, 255, 255);
  for(int i=0; i<N; i++){
    for(int j=0; j<N; j++){
      fill(255, 255, 255);
      rect(i*20, j*20, 20, 20);
      if(a[i][j] == 1){
        fill(0, 0, 0);
        ellipse(i*20+10, j*20+10, 17, 17);
      }else if(a[i][j]==-1){
        fill(255, 255, 255);
        ellipse(i*20+10, j*20+10, 17, 17);
      }
    }
  }
}

int[] dx = { 1, 1, 0,-1,-1,-1, 0, 1};
int[] dy = { 0, 1, 1, 1, 0,-1,-1,-1};

void mousePressed(){
  int i = mouseX/20;
  int j = mouseY/20;
  if(a[i][j]==0){
    if(mode==0){
      int f = 0;
      
      for(int k=0; k<8; k++){
        int ti = i+dx[k];
        int tj = j+dy[k];
        for(;;){
          if(ti<0 || ti>7 || tj<0 || tj>7) break;
          if(a[ti][tj]!=-1){
            if(a[ti][tj]==1){
              int i2 = i+dx[k];
              int j2 = j+dy[k];
              for(;;){
                if(i2==ti && j2==tj) break;
                a[i2][j2] = 1;
                i2 += dx[k];
                j2 += dy[k];
                f = 1;
              }
            }
            break;
          }
          ti += dx[k];
          tj += dy[k];
        }
      }
      if(f!=0) a[i][j] = 1;
      else mode = (mode+1)%2;
        
    }else{
      int f = 0;
      
      for(int k=0; k<8; k++){
        int ti = i+dx[k];
        int tj = j+dy[k];
        for(;;){
          if(ti<0 || ti>7 || tj<0 || tj>7) break;
          if(a[ti][tj]!=1){
            if(a[ti][tj]==-1){
              int i2 = i+dx[k];
              int j2 = j+dy[k];
              for(;;){
                if(i2==ti && j2==tj) break;
                a[i2][j2] = -1;
                i2 += dx[k];
                j2 += dy[k];
                f++;
              }
            }
            break;
          }
          ti += dx[k];
          tj += dy[k];
        }
      }
      
      if(f!=0) a[i][j] = -1;
      else mode = (mode+1)%2;
    }
    mode++;
  }
  
  mode%=2;
  
}

