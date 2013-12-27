
XML xml;
XML[] children;

void setup(){
  size(500, 500);
  xml = loadXML("test.xml");
  children = xml.getChildren("point");
}

int step = 0;
void draw(){
  for(int i=0; i<children.length; i++){
    if(children[i].getInt("step")==step){
      ellipse(children[i].getInt("x"), children[i].getInt("y"), 10, 10);
    }
  }
  step++;
}


