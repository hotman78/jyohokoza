class Data{
  PFont kishimoto;
  // arraylistでもいい
  Map[] maps;
  //ArrayList enemies;
  Enemy[] o_enemies; 
  Item[] items;
  TData[] talks;
//  Item[] weapons;
  XML map   = loadXML("./data/map/map.xml");
  XML enemy   = loadXML("./data/event/enemy.xml");
  XML item   = loadXML("./data/item.xml");
  XML weapon   = loadXML("./data/weapon.xml");
  XML talk = loadXML("./data/event/talk1.xml");
  int N_maps;
  int N_enemies;
  int N_items;
  int N_weapons;
  int N_talks;
  
  Data(){
    N_maps=map.getInt("num");
    N_enemies=enemy.getInt("num");
    N_items=item.getInt("num");
    N_weapons=weapon.getInt("num");
    kishimoto = loadFont("HGPKisimotoKaishotai-25.vlw");
    maps    = new Map[N_maps];
    //enemies = new ArrayList();
    o_enemies = new Enemy[N_enemies];
    items = new Item[N_items + N_weapons];
//    println(N_items, N_weapons);
//    weapons = new Weapon[N_weapons];
//    talks = new TData[talk.getChildren("talk").length];
  }
  
  void load_all(Game g){
    set_enemy();
    set_items();
    set_weapons();
//    set_talks();
//    maps[0] = new Map(0,g);
//    maps[1] = new Map(1,g);
    for(int i=0; i<N_maps; i++){
      maps[i] = new Map();
      maps[i].load_file(i, g);
    }
  }
 /* void make_enemies(int id,int x, int y){
      Enemy en = o_enemies[id];
      en.x = x;
      en.y = y;
      enemies.add(en);
 
  }*/
  void set_enemy(){
    print("system log///enemy data loading");
    XML children[] = enemy.getChildren("enemy");
    String name, text;
    int AI_id,weapon_id,hp,mp,at,df;
    PImage img;
    for(int i=0; i<children.length; i++){
      name       = children[i].getChild("name").getContent();
      img        = loadImage("./data/image/enemies/"+children[i].getChild("img").getContent());
      AI_id      = children[i].getChild("AI").getInt("id");
      weapon_id  = children[i].getChild("weapon").getInt("id");
      hp         = children[i].getChild("state").getInt("hp");
      mp         = children[i].getChild("state").getInt("mp");
      at         = children[i].getChild("state").getInt("at");
      df         = children[i].getChild("state").getInt("df");  
      text       = children[i].getChild("text").getContent();  
      
//      println(i);
      o_enemies[i]=new Enemy(name,img,AI_id,weapon_id,hp,mp,at,df,text);
    }
    println("");
  }
  
  void set_items(){
    //XML item   = loadXML("./data/item.xml");
    print("system log///item data loading");
    XML children[] = item.getChildren("item");
    String name;
    String text;
    int id;
    PImage img;
    int type_str;
    int type = 0;
    int val;
    Status stat = null;
    
    for(int i=0; i<N_items; i++){
      id         = children[i].getInt("id");
      name       = children[i].getChild("name").getContent();
      img        = loadImage("./data/image/items/"+children[i].getChild("img").getContent());
      type_str   = children[i].getChild("use").getInt("type");
      val        = children[i].getChild("use").getInt("value");
      text       = children[i].getChild("text").getContent();
      if(type_str==0){
        type = 0;
        stat = new Status(0, 0, 0, val, 0, 0, 0);
      }else if(type_str==1){
        type = 0;
        stat = new Status(0, 0, 0, 0, val, 0, 0);
      }else if(type_str==2){
        type = 1;
        stat = new Status(val, 0, 0, 0, 0, 0, 0);
      }
      items[i] = new Item(id, name, img, type, stat,text);
    }
    println("");
  }
  
  void set_weapons(){
    //XML weapon   = loadXML("./data/weapon.xml");
    print("system log///weapon data loading");
    XML children[] = weapon.getChildren("weapon");
    String name;
    String text;
    int id;
    PImage img;
    int at, df, cr;
    
    for(int i=0; i<children.length; i++){
      id         = children[i].getInt("id");
      name       = children[i].getChild("name").getContent();
      text       = children[i].getChild("text").getContent();
      at         = children[i].getChild("state").getInt("at");
      df         = children[i].getChild("state").getInt("df");
      cr         = children[i].getChild("state").getInt("cr");
      img        = loadImage("./data/image/weapons/"+children[i].getChild("img").getContent());
      
//      println("set_weapons: "+(N_items+i));
      items[N_items+i] = new Item(id, name, img, 2, new Status(at, df, cr, 0, 0, 0, 0),text);
    }
    println("");
  }
  

  void set_talks(){
    print("system log///NPC data loading");
    XML children[] = talk.getChildren("talk");
    String id;
    ArrayList<String> text = new ArrayList<String>();
    IntDict name = new IntDict();
    IntDict img = new IntDict();
    
    for(int i=0;i<children.length;i++){
      id = children[i].getString("id");
      XML[] cld = children[i].getChildren();
      for(int j=0;j<cld.length;j++){
        if(cld[j].getName().equals("text")){
          text.add(cld[j].getContent());
        }else if(cld[j].getName().equals("name")){
          name.set(cld[j].getContent(), text.size());
        }else if(cld[j].getName().equals("img")){
          img.set("./data/image/"+cld[j].getContent(), text.size());
        }
      }
      
      talks[i] = new TData(id+"", text, name, img);
      
    }
    println("");
    
  }
  
}

