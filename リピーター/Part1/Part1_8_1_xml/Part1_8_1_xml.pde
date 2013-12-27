
XML xml;
XML[] children;
PFont font;

void setup(){
  size(400, 400);
  xml = loadXML("../cities.xml");
  font = loadFont("HGMaruGothicMPRO-20.vlw");
  textFont(font);
}

void draw(){
  String name;
  float x, y;
  
  children = xml.getChildren("city");
  for(int i=0; i<children.length; i++){
    name = children[i].getChild("name").getContent();
    x = children[i].getChild("place").getFloat("toukei");
    y = children[i].getChild("place").getFloat("hokui");
    
    fill(0);
    text(name, 30*(x-130), height-30*(y-33));
  }
}



