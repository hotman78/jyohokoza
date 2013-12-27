class Data{
  // arraylistでもいい
  Map[] maps;
  Enemy[] enemies;
  Talk[] talks;
  Item[] items;
  Weapon[] weapons;
  
  Data(){
    maps = new Map[2];
  }
  
  
  void load_all(){
    maps[0] = new Map(0);
    maps[1] = new Map(1);
  }
}

