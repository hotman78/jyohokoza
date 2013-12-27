
XML xml;

void setup(){
  size(500, 500);
  xml = new XML("points");
}

int step = 0;
void draw(){
  step++;
}

void mousePressed(){
  XML ch = new XML("point");
  ch.setInt("x", mouseX);
  ch.setInt("y", mouseY);
  ch.setInt("step", step);
  xml.addChild(ch);
  
  ellipse(mouseX, mouseY, 10, 10);
}

void keyPressed(){
  saveXML(xml, "test.xml");
}


