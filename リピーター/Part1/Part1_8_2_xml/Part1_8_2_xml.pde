
XML xml;
XML[] children;

void setup(){
  size(500, 500);
  xml = loadXML("../figure.xml");
}

void draw(){
  String name;
  float x, y;
  
  children = xml.getChildren("zukei");
  for(int i=0; i<children.length; i++){
    XML[] ps = children[i].getChildren("point");
    for(int j=0; j<ps.length; j++){
      int j2 = (j+1)%ps.length;
      int x1, y1, x2, y2;
      x1 = ps[j].getInt("x");
      y1 = ps[j].getInt("y");
      x2 = ps[j2].getInt("x");
      y2 = ps[j2].getInt("y");
      line(x1, y1, x2, y2);
    }
  }
}



