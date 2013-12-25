void setup(){
  size(255, 255);
  background(255);
}

void draw(){
  /*
  noStroke();
  fill(mouseX, mouseY, 255);
  ellipse(mouseX, mouseY, 20, 20);
  */
  
  background(255);
  /*
  ellipse(mouseX, mouseY, 20, 20);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
  */
  
  fill(0, 0, 255);
  if(mouseX > 50 && mouseX < 150){
    if(mouseY > 50 && mouseY < 150){
      fill(255, 0, 0);
    }
  }
  rect(50, 50, 100, 100);
}


