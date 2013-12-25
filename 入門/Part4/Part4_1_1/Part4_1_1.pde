
float y;

void setup(){
  size(300, 300);
}

void draw(){
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  for(int i=0; i<10; i++){
    noStroke();
    fill(255, 255, 0);
    ellipse(i*30+10, y, 10, 10);
  }
  y+=1;
}
