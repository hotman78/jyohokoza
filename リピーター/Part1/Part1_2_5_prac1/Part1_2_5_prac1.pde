

void setup(){
  size(300, 300);
  hello();
  println(r1());
  nhello(3);
  noLoop();
}

void draw(){
}

int r1(){
  return 1;
}

void hello(){
  println("Hello!");
}

void nhello(int n){
  for(int i=0; i<n; i++){
    hello();  // 命令の中で他の命令を呼び出しても良い
  }
}


