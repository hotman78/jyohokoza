class Data{
  // arraylistでもいい
  Map[] maps;
  //ArrayList enemies;
  Enemy[] o_enemies; 
  Talk[] talks;
  Item[] items;
  Weapon[] weapons;
  XML  enemy;
  
  int N_maps = 2;
  int N_enemies = 3;
  int N_items = 5;
  
  Data(){
    maps    = new Map[N_maps];
    //enemies = new ArrayList();
    o_enemies = new Enemy[N_enemies];
    items = new Item[N_items];
  }
  
  void load_all(Game g){
    set_enemy();
    set_items();
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
      println(i);
      o_enemies[i]=new Enemy(name,img,AI_id,weapon_id,hp,mp,at,df);
    }
  }
  
  void set_items(){
    item   = loadXML("./data/item.xml");
    XML children[] = item.getChildren("item");
    String name;
    int id;
    PImage img;
    
    for(int i=0; i<children.length; i++){
      id         = children[i].getInt("id");
      name       = children[i].getChild("name").getContent();
      img        = loadImage("./data/image/items/"+children[i].getChild("img").getContent());

      items[i] = new Item(name, img, id);
    }
  }
  
  void set_weapons(){
    weapon   = loadXML("./data/weapon.xml");
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

