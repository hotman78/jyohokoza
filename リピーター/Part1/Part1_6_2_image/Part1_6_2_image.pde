
PImage img;

void setup(){
  size(400, 400);
  
  img = loadImage("tekitou2.png");
  
  noLoop();
}

void draw(){
  for(int i=0; i<30; i++)
    image(img, random(-200, width), random(-200, height));
}





