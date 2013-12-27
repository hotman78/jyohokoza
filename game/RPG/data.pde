class Data{
  // arraylistでもいい
  Map[] maps;
  ArrayList enemies;
  Enemy[] o_enemies; 
  Talk[] talks;
  Item[] items;
  Weapon[] weapons;
  XML  enemy;
  
  Data(){
    maps    = new Map[2];
    enemies = new ArrayList();
    o_enemies = new Enemy[3];
  }
  
  void load_all(){
    maps[0] = new Map(0);
    maps[1] = new Map(1);
    set_enemy();  
  }
  void make_enemies(int id,int x, int y){
      Enemy en = o_enemies[id];
      en.x = x;
      en.y = y;
      enemies.add(en);
 
  }
  void set_enemy(){
    enemy   = loadXML("./data/event/enemy.xml");
    XML children[] = enemy.getChildren("enemy");
    String name;
    int img_id,AI_id,weapon_id,hp,mp,at,df;
    for(int i=0; i<children.length; i++){
      name       = children[i].getChild("name").getContent();
      img_id     = children[i].getChild("img").getInt("id");
      AI_id      = children[i].getChild("AI").getInt("id");
      weapon_id  = children[i].getChild("weapon").getInt("id");
      hp         = children[i].getChild("state").getInt("hp");
      mp         = children[i].getChild("state").getInt("mp");
      at         = children[i].getChild("state").getInt("at");
      df         = children[i].getChild("state").getInt("df");  
      o_enemies[i]=new Enemy(name,img_id,AI_id,weapon_id,hp,mp,at,df);
    }
  }
}

