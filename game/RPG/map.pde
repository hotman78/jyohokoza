// マップに関するファイルのデータを読み込んだもの
// 管轄はdata

class Map{
  PImage background, mask;
  Event[] event_list;
  Trans[] map_transition;
  
  Map(){
    event_list = new Event[0];
    map_transition = new Trans[1];
  }
  
  Map(int debug){
    event_list = new Event[0];
    map_transition = new Trans[1];
    if(debug==0){
      background = loadImage("./data/image/map_1_bg.png");
//      event_list[0] = new Event(0);
      map_transition[0] = new Trans(0);
    }else{
      background = loadImage("./data/image/map_2_bg.png");
      map_transition[0] = new Trans(1);
    }
  }
  
  void load_file(){
    
  }
  
  void draw(Game g){
    image(background, 0, 0);
    for(int i=0; i<event_list.length; i++){
//      event_list[i].draw(g);
    }
    for(int i=0; i<map_transition.length; i++){
      map_transition[i].draw(g);
    }
  }
  
}
