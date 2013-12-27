

void setup(){
  size(300, 300);
  println(mx3(3, 1, 4));
  rcirc(100);
  println(pw(2, 10));
  noLoop();
}

void draw(){
}

int mx2(int x, int y){
  if(x>y) return x;
  else return y;
}

int mx3(int x, int y, int z){
  return mx2(x, mx2(y, z));
}

void rcirc(int n){
  for(int i=0; i<n; i++){
    ellipse(random(0, width), random(0, height), 10, 10);
  }
}

int pw(int x, int y){
  int ret = 1;
  for(int i=0; i<y; i++){
    ret *= x;
  }
  return ret;
}

