
PImage img;

void setup(){
  size(600, 600);
  
  img = loadImage("tekitou.png");
  
  noLoop();
}

void draw(){
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
  imageMode(CENTER);
  image(img, width/2, height/2);
}





