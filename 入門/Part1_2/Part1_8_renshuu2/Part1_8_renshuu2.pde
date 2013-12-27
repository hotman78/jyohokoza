size(300, 300);

for(float i=10; i<15; i+=0.5){
  println(i);
}

background(255);
noFill();
for(int i=0; i<255; i++){
  stroke(i, i, i);
  line(i+10, 10, i+10, 110);
}

