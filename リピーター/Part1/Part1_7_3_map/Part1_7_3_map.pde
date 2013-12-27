
PImage img, img_mask;
float x, y;

void setup(){
  size(300, 300);
  img = loadImage("hokkaidou_photo.png");
  img_mask = loadImage("hokkaidou_mask.png");
  
  x = width/2;
  y = height/2;
}

void draw(){
  imageMode(CORNERS);
  image(img, 0, 0);
  
  img_mask.loadPixels();
  if(green(img_mask.pixels[mouseY * img.width + mouseX]) > 100){
    x = mouseX;
    y = mouseY;
  }
  ellipse(x, y, 10, 10);
}





