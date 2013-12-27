int[][] a;

void setup(){
  size(200, 200);
  a = new int[10][10];
  for(int i=0; i<10; i++){
    for(int j=0; j<10; j++){
      a[i][j] = 1;
    }
  }
}

void draw(){
  background(255, 255, 255);
  for(int i=0; i<10; i++){
    for(int j=0; j<10; j++){
      if(a[i][j]==1){
        fill(255, 0, 0, 100);
      }else{
        fill(0, 0, 255, 100);
      }
      rect(i*20, j*20, 20, 20);
    }
  }
}

void mousePressed(){
  int i = mouseX/20;
  int j = mouseY/20;
  a[i][j] *= -1;
  if(i>0) a[i-1][j] *= -1;
  if(i<9) a[i+1][j] *= -1;
  if(j>0) a[i][j-1] *= -1;
  if(j<9) a[i][j+1] *= -1;
}

