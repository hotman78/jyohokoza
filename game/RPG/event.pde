// イベントデータ
// mapに附属

class Event{
  int x;
  int y;
  int type; // 0: trans 1:enemy
  int id;   //
  Trans[] map_transition;
  
  Event(int x0, int y0, int type0, int id0){
    x = x0;
    y = y0;
    type = type0;
    id = id0;
  }
  
  void debug(){
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
  
  int update0(Game g,int map_id){
    int next_map = g.data.maps[map_id].map_transition[0].next_map;
    return next_map;
/*    event[i] = new Event(g.data.maps[map_id].map_transition[0].x,
      g.data.maps[map_id].map_transition[0].y, 
      0, 
      g.data.maps[map_id].map_transition[0].id);*/
  }
  void update1(){
    if(type==1){
      x+=1;
    }
  }

  
  int trigger(Game g){
    if(type==0){
      if(dist(x, y, g.state.player_x, g.state.player_y) < 50){
        return 1;
      }  
      return 0;
    }
    if(type==1){
      return 1;
    }
    return 0;
  }
  
}
