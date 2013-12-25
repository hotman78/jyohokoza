float x;

void setup(){
  size(200, 200);
  frameRate(3);
  x = 0;
}

void draw(){
  background(255, 255, 255);
  ellipse(x, 100, 50, 50);
  if(x > 200){
    x = 0;
  }else{
    x += 10;
  }
}


