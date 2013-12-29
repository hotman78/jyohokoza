// マップに関するファイルのデータを読み込んだもの
// 管轄はdata

class Map{
  PImage background, mask;
  Trans[] map_transition;
  ArrayList map_enemy;
  ArrayList map_item;
  
  Map(){
    map_transition = new Trans[1];
    map_enemy=new ArrayList();
    map_item = new ArrayList();
  }
  
  Map(int debug,Game g){
    map_transition = new Trans[1];
    if(debug==0){
      background = loadImage("./data/image/maps/map_1_bg.png");
//      event_list[0] = new Event(0);
      map_transition[0] = new Trans(0);
    }else{
      background = loadImage("./data/image/maps/map_2_bg.png");
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
  
  void load_file(int filename, Game g){
    XML x = loadXML("./data/map/map.xml");
    XML[] xml=x.getChildren("map");
    background = loadImage("./data/image/maps/"+xml[filename].getChild("img_bg").getContent());
    mask = loadImage("./data/image/maps/"+xml[filename].getChild("img_mask").getContent());
//    mask = loadImage("./data/image/"+xml.getChild("img_mask").getContent());
    
    map_transition = new Trans[1];
    XML[] xml_tr = xml[filename].getChildren("trans");
    for(int i=0; i<xml_tr.length; i++){
      map_transition[i] = new Trans(xml_tr[i].getInt("next"),
                                    xml_tr[i].getInt("x"),
                                    xml_tr[i].getInt("y"),
                                    xml_tr[i].getInt("px"),
                                    xml_tr[i].getInt("py"));
    }
    
    map_enemy=new ArrayList();
    XML[] xml_enemies = xml[filename].getChildren("enemy");
    for(int i=0; i<xml_enemies.length; i++){
      Enemy en = g.data.o_enemies[xml_enemies[i].getInt("id")].copy();
      en.x = xml_enemies[i].getInt("x");
      en.y = xml_enemies[i].getInt("y");
      map_enemy.add(en);
    }
    
    map_item=new ArrayList();
    XML[] xml_items = xml[filename].getChildren("item");
    for(int i=0; i<xml_items.length; i++){
      Item it = g.data.items[xml_items[i].getInt("id")].copy();
      it.pos = new Position(xml_items[i].getInt("x"), xml_items[i].getInt("y"));
      map_item.add(it);
    }
    
//    map_item=new ArrayList();
    xml_items = xml[filename].getChildren("weapon");
    for(int i=0; i<xml_items.length; i++){
      Item it = g.data.items[xml_items[i].getInt("id") + g.data.N_items].copy();
      it.pos = new Position(xml_items[i].getInt("x"), xml_items[i].getInt("y"));
      map_item.add(it);
    }
  }
  
  void draw(Game g){
    int mx=-1,my=-1;
    int px=g.state.player_x;
    int py=g.state.player_y;
    if(px<width/2)mx=0;
    else if(px>background.width-width/2)mx=width-background.width;
    if(py<height/2)my=0;
    else if(py>background.height-height/2)my=height-background.height;
    
    if(mx==-1)mx=width/2-px;    
    if(my==-1)my=height/2-py;
    
    imageMode(CORNERS);
    image(background, mx, my);
    for(int i=0; i<g.data.maps[g.state.map_id].map_transition.length; i++){
      g.data.maps[g.state.map_id].map_transition[i].draw(g,mx,my);
    }
    for(int i=0; i<g.state.enemy.size(); i++){
      ((Enemy)g.state.enemy.get(i)).draw(g,mx,my);
    }
    for(int i=0; i<g.state.items.size(); i++){
      ((Item)g.state.items.get(i)).draw(g, mx, my);
    }
  }
  
}
