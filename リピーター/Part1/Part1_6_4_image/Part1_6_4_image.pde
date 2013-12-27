
PImage img;

void setup(){
  size(300, 300);
  
  img = loadImage("tekitou.png");
  
  noLoop();
}

void draw(){
  displayImage(img, 180, 120, PI/6, 0.6);
}

// (x, y)を中心とし、角度th回転し、s倍に相似拡大した画像imgを表示する
void displayImage(PImage img, float x, float y, float th, float s){
  pushMatrix();
  translate(x, y);
  rotate(th);
  scale(s);
  imageMode(CENTER);
  image(img, 0, 0);
  popMatrix();
}




