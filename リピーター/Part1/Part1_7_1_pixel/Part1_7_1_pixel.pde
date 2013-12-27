
PImage img;

void setup(){
  size(300, 300);
  img = loadImage("tekitou.png");
}

void draw(){
  imageMode(CORNERS);
  image(img, 0, 0);
}

void mousePressed(){
  img.loadPixels();
  
  // 画像imgの(mouseX, mouseY)の位置の色を取得
  color c = img.pixels[mouseY * img.width + mouseX];
  
  // その色の明るさ(brightness)を出力
  println(brightness(c));
  
  // その場所の色をランダムに変更
  img.pixels[mouseY * img.width + mouseX]
     = color(random(0, 255), random(0, 255), random(0, 255));
     
  // 変更を反映させる
  img.updatePixels();
}







