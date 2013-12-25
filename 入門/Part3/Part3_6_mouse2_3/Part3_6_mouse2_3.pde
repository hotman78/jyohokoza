int mode;

void setup(){
  size(200, 200);
  mode = 0;
}

void draw(){
  if(mode==0){
    background(255, 0, 0);
  }else{
    background(0, 0, 255);
  }
}


void mousePressed(){
  if(mode==0){
    mode = 1;
  }else{
    mode = 0;
  }
}


