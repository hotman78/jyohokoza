/*
size(200, 200);
background(0, 0, 0);
noStroke();

for(int i=0; i<100; i++){
  fill(random(0, 255), random(0, 255), random(0, 255), 100);
  ellipse(random(0, width), random(0, height), 50, 50);
}
*/
size(200, 200);
background(0, 0, 0);
stroke(255, 255, 255);
for(int i=0; i<200; i++){
  point(random(0, 200), random(0, 200));
}

