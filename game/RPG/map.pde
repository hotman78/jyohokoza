// マップに関するファイルのデータを読み込んだもの
// 管轄はdata

class Map{
  PImage background, mask;
  Trans[] map_transition;
  ArrayList map_enemy;
  
  Map(){
    map_transition = new Trans[1];
    map_enemy=new ArrayList();
  }
  
  Map(int debug,Game g){
    map_transition = new Trans[1];
    if(debug==0){
      background = loadImage("./data/image/map_1_bg.png");
//      event_list[0] = new Event(0);
      map_transition[0] = new Trans(0);
    }else{
      background = loadImage("./data/image/map_2_bg.png");
      map_transition[0] = new Trans(1);
    }
    
    map_enemy=new ArrayList();
    if(debug==0){
      Enemy en = g.data.o_enemies[0].copy();
      en.x = 300;
      en.y = 100;
      map_enemy.add(en);
    }else{
      Enemy en = g.data.o_enemies[1].copy();
      en.x = 300;
      en.y = 100;
      map_enemy.add(en);
    }
  }
  
  void load_file(String filename, Game g){
    XML xml = loadXML("./data/map/" + filename);
    background = loadImage("./data/image/"+xml.getChild("img_bg").getContent());
//    mask = loadImage("./data/image/"+xml.getChild("img_mask").getContent());
    
    map_transition = new Trans[1];
    XML[] xml_tr = xml.getChildren("trans");
    for(int i=0; i<xml_tr.length; i++){
      map_transition[i] = new Trans(xml_tr[i].getInt("next"),
                                    xml_tr[i].getInt("x"),
                                    xml_tr[i].getInt("y"),
                                    xml_tr[i].getInt("px"),
                                    xml_tr[i].getInt("py"));
    }
    
    map_enemy=new ArrayList();
    XML[] xml_enemies = xml.getChildren("enemy");
    for(int i=0; i<xml_enemies.length; i++){
      Enemy en = g.data.o_enemies[xml_enemies[i].getInt("id")].copy();
      en.x = xml_enemies[i].getInt("x");
      en.y = xml_enemies[i].getInt("y");
      map_enemy.add(en);
    }
  }
  
  void draw(Game g){
    imageMode(CORNERS);
    image(background, 0, 0);

  }
  
}
