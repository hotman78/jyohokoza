
XML xml;

void setup(){
  size(500, 500);
  xml = new XML("points");
}

void draw(){
  
}

void mousePressed(){
  XML ch = new XML("point");
  ch.setInt("x", mouseX);
  ch.setInt("y", mouseY);
  xml.addChild(ch);
  
  ellipse(mouseX, mouseY, 10, 10);
}

void keyPressed(){
  saveXML(xml, "test.xml");
}


