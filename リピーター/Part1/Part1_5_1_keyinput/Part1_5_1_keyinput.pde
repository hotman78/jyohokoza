
float x, y;

void setup(){
  size(300, 300);
  x = width/2;
  y = height/2;
}

void draw(){
  background(255);
  ellipse(x, y, 10, 10);
}

void keyPressed(){
  if(key=='a'){
    x -= 5;
  }else if(key=='d'){
    x += 5;
  }else if(key=='w'){
    y -= 5;
  }else if(key=='s'){
    y += 5;
  }
}



