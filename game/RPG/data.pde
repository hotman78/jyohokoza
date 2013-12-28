class Data{
  // arraylistでもいい
  Map[] maps;
  //ArrayList enemies;
  Enemy[] o_enemies; 
  Talk[] talks;
  Item[] items;
  Weapon[] weapons;
  XML  enemy;
  
  Data(){
    maps    = new Map[2];
    //enemies = new ArrayList();
    o_enemies = new Enemy[3];
  }
  
  void load_all(Game g){
    set_enemy();
//    maps[0] = new Map(0,g);
//    maps[1] = new Map(1,g);
    maps[0] = new Map();
    maps[1] = new Map();
    maps[0].load_file("map_1.xml", g);
    maps[1].load_file("map_2.xml", g);
  }
 /* void make_enemies(int id,int x, int y){
      Enemy en = o_enemies[id];
      en.x = x;
      en.y = y;
      enemies.add(en);
 
  }*/
  void set_enemy(){
    enemy   = loadXML("./data/event/enemy.xml");
    XML children[] = enemy.getChild("enemys").getChildren("enemy");
    String name;
    int AI_id,weapon_id,hp,mp,at,df;
    PImage img;
    for(int i=0; i<children.length; i++){
      name       = children[i].getChild("name").getContent();
      img        = loadImage("./data/image/"+children[i].getChild("img").getContent());
      AI_id      = children[i].getChild("AI").getInt("id");
      weapon_id  = children[i].getChild("weapon").getInt("id");
      hp         = children[i].getChild("state").getInt("hp");
      mp         = children[i].getChild("state").getInt("mp");
      at         = children[i].getChild("state").getInt("at");
      df         = children[i].getChild("state").getInt("df");  
      println(i);
      o_enemies[i]=new Enemy(name,img,AI_id,weapon_id,hp,mp,at,df);
    }
  }
}

