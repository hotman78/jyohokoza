int step;

void setup(){
  size(200, 200);
  step = 0;
  frameRate(1000);
}

void draw(){
  background(255, 255, 255);
  ellipse(random(0, 200), random(0, 200), 20, 20);
  step++;
  println(step);
}


