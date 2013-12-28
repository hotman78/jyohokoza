class Data{
  PFont kishimoto;
  // arraylistでもいい
  Map[] maps;
  //ArrayList enemies;
  Enemy[] o_enemies; 
  Talk[] talks;
  Item[] items;
  Weapon[] weapons;
  XML map   = loadXML("./data/map/map.xml");
  XML enemy   = loadXML("./data/event/enemy.xml");
  XML item   = loadXML("./data/item.xml");
  XML weapon   = loadXML("./data/weapon.xml");
  
  int N_maps;
  int N_enemies;
  int N_items;
  int N_weapons;

  
  Data(){
    N_maps=enemy.getInt("num");
    N_enemies=enemy.getInt("num");
    N_items=enemy.getInt("num");
    N_weapons=enemy.getInt("num");
    kishimoto = loadFont("HGPKisimotoKaishotai-25.vlw");
    maps    = new Map[N_maps];
    //enemies = new ArrayList();
    o_enemies = new Enemy[N_enemies];
    items = new Item[N_items];
    weapons = new Weapon[N_weapons];
  }
  
  void load_all(Game g){
    set_enemy();
    set_items();
//    maps[0] = new Map(0,g);
//    maps[1] = new Map(1,g);
    maps[0] = new Map();
    maps[1] = new Map();
    maps[0].load_file(0, g);
    maps[1].load_file(1, g);
  }
 /* void make_enemies(int id,int x, int y){
      Enemy en = o_enemies[id];
      en.x = x;
      en.y = y;
      enemies.add(en);
 
  }*/
  void set_enemy(){
    XML children[] = enemy.getChildren("enemy");
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
//      println(i);
      o_enemies[i]=new Enemy(name,img,AI_id,weapon_id,hp,mp,at,df);
    }
  }
  
  void set_items(){
    XML item   = loadXML("./data/item.xml");
    XML children[] = item.getChildren("item");
    String name;
    int id;
    PImage img;
    
    for(int i=0; i<min(N_items, children.length); i++){
      id         = children[i].getInt("id");
      name       = children[i].getChild("name").getContent();
      img        = loadImage("./data/image/"+children[i].getChild("img").getContent());
      items[i] = new Item(name, img, id);
    }
  }
  
  void set_weapons(){
    XML weapon   = loadXML("./data/weapon.xml");
    XML children[] = weapon.getChildren("weapon");
    String name;
    int id;
    PImage img;
    int at, df, cr;
    
    for(int i=0; i<children.length; i++){
      id         = children[i].getInt("id");
      name       = children[i].getChild("name").getContent();
      at         = children[i].getChild("state").getInt("at");
      df         = children[i].getChild("state").getInt("df");
      cr         = children[i].getChild("state").getInt("cr");
      
      weapons[i] = new Weapon(id, name, at, df, cr);
    }
  }
}

