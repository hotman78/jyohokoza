float x;
int mode;

void setup(){
  size(200, 200);
  frameRate(30);
  x = 0;
  mode = 0;
}

void draw(){
  background(255, 255, 255);
  ellipse(x, 100, 10, 10);
  
  if(mode==0){
    x += 3;
  }else{
    x -= 3;
  }
  
  if(x > 200){
    mode = 1;
  }
  
  if(x < 0){
    mode = 0;
  }
}


