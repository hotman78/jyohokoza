
float x, y;
KeyState ks;

void setup(){
  ks = new KeyState();
  size(300, 300);
  x = width/2;
  y = height/2;
}

void draw(){
  background(255);
  
  if(ks.left==1) x-=5;
  if(ks.up==1) y-=5;
  
  ellipse(x, y, 10, 10);
}

void keyPressed(){
  ks.pressed();
}

void keyReleased(){
  ks.released();
}




