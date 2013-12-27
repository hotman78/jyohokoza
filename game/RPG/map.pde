// マ ッ プ に 関 す る フ ァ イ ル の デ ー タ を 読 み 込 ん だ も の
// 管 轄 は data

class Map{
  PImage background, mask;
  Event[] event_list;
  Trans[] map_transition;
  
  Map(){
    event_list = new Event[0];
    map_transition = new Trans[1];
  }
  
  Map(int map_id){
    event_list = new Event[1];
    for(int i=0;i<event_list.length;i++){
      event_list[i].debug0(this,map_id,i);
//      event_list[0]=new Event();
    }
  }
  
  void load_file(){
    
  }
  
  void draw(Game g){
    imageMode(CORNERS);
    image(background, 0, 0);
    for(int i=0; i<event_list.length; i++){
//      event_list[i].draw(g);
    }
    for(int i=0; i<map_transition.length; i++){
      map_transition[i].draw(g);
    }
  }
  
}
