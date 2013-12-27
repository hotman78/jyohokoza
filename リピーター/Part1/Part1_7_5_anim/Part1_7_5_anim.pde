
PImage img;
PImage[] anim;
float x, y;

void setup(){
  size(300, 300);
  img = loadImage("../animation_fire002.png");
  anim = new PImage[25];
  
  for(int i=0; i<5; i++){
    for(int j=0; j<5; j++){
      anim[i*5+j] = img_at(img, j, i);
    }
  }
}

int step = 0;
void draw(){
  background(0);
  image(anim[step%25], 0, 0);
  step++;
}

PImage img_at(PImage img, int x, int y){
  int xx = 192 * x;
  int yy = 192 * y;
  PImage ret = createImage(192, 192, ARGB);
  img.loadPixels();
  ret.loadPixels();
  for(int i=0; i<192; i++){
    for(int j=0; j<192; j++){
      int id = (yy+i)*960 + (xx+j);
      ret.pixels[i*192+j] = img.pixels[id];
    }
  }
  ret.updatePixels();
  return ret;
}





