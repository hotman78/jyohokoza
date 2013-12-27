

void setup(){
  size(300, 300);
}

void draw(){
  int m = saikoro();
  println(m);
}

int saikoro(){
  return (int)random(1, 7);
}

int sqx(int x){
  return x*x;
}

int mx(int x, int y){
  if(x>y){
    return x;
  }else{
    return y;
  }
}



