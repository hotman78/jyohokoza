// マップに関するファイルのデータを読み込んだもの
// 管轄はdata

class Map{
  PImage background, mask;
  Trans[] map_transition;
  Enemy[] map_enemy;
  
  Map(){
    map_transition = new Trans[1];
    map_enemy=new Enemy[1];
  }
  
  Map(int debug){
    map_transition = new Trans[1];
    if(debug==0){
      background = loadImage("./data/image/map_1_bg.png");
//      event_list[0] = new Event(0);
      map_transition[0] = new Trans(0);
    }else{
      background = loadImage("./data/image/map_2_bg.png");
      map_transition[0] = new Trans(1);
    }
    
    map_enemy=new Enemy[1];
    if(debug==0){
      map_enemy[0]=new Enemy(0);
    }else{
      map_enemy[0]=new Enemy(1);
    }
  }
  
  void load_file(){
    
  }
  
  void draw(Game g){
    imageMode(CORNERS);
    image(background, 0, 0);
  }
  
}
