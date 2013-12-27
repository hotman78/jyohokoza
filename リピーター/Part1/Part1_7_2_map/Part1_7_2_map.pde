
PImage img;
float x, y;

void setup(){
  size(300, 300);
  img = loadImage("land.png");
  
  x = width/2;
  y = height/2;
}

void draw(){
  imageMode(CORNERS);
  image(img, 0, 0);
  
  img.loadPixels();
  if(green(img.pixels[mouseY * img.width + mouseX]) > 100){
    x = mouseX;
    y = mouseY;
  }
  ellipse(x, y, 10, 10);
}





