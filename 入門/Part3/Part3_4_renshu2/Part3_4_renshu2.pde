float x1;
float y1;
float x2;
float y2;
int modex1, modey1;
int modex2, modey2;

void setup(){
  size(200, 200);
  frameRate(30);
  x1 = random(0, 200);
  y1 = random(0, 200);
  x2 = random(0, 200);
  y2 = random(0, 200);
}

void draw(){
//  background(255, 255, 255);
//  ellipse(x1, y1, 10, 10);
//  ellipse(x2, y2, 10, 10);
  line(x1, y1, x2, y2);
  
  if(modex1==0){
    x1 += 5;
  }else{
    x1 -= 5;
  }
  if(modex2==0){
    x2 += 3;
  }else{
    x2 -= 3;
  }
  
  if(modey1==0){
    y1 += 2;
  }else{
    y1 -= 2;
  }
  if(modey2==0){
    y2 += 3;
  }else{
    y2 -= 3;
  }
  
  if(x1 > 200){
    modex1 = 1;
  }
  if(x2 > 200){
    modex2 = 1;
  }
  if(y1 > 200){
    modey1 = 1;
  }
  if(y2 > 200){
    modey2 = 1;
  }
  
  if(x1 < 0){
    modex1 = 0;
  }
  if(x2 < 0){
    modex2 = 0;
  }
  if(y1 < 0){
    modey1 = 0;
  }
  if(y2 < 0){
    modey2 = 0;
  }
}


