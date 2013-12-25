float x, y;
float vx, vy;
int f;
int s;
int cnt;

void setup(){
  x = 0;
  y = 50;
  f = 0;
  cnt = 0;
  s = 0;
  vx = random(3, 5);
  vy = random(-5, 0);
  size(200, 200);
  frameRate(50);
}

void draw(){
  background(255, 255, 255);
  x += vx;
  y += vy;
  vy += 0.2;
  
  fill(255, 255, 255);
  ellipse(x, y, 20, 20);
  
  if(x>width || y < 0 || y > height){
    vx = random(3, 5);
    vy = random(-5, 0);
    x = 0;
    y = height/2 + random(-50, 50);
    f = 0;
    cnt++;
  }
  
  if(f==1){
    fill(255, 0, 0);
    ellipse(x, y, 20, 20);
  }
  
}

void mousePressed(){
  if(dist(x, y, mouseX, mouseY) < 10){
    f = 1;
    s++;
    println(s + "/" + (cnt+1));
  }
}
