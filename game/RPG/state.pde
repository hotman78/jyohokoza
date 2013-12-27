class State{
  int game_state;  // タ イ ト ル 、 ゲ ー ム 内 、 エ ン デ ィ ン グ と か
  int menu_state;  // メ ニ ュ ー が 開 い て い る 時 1
  int kaiwa_state; // 会 話 が 起 き て い る 時 1
  
  int map_id;
  int player_x, player_y;
  Event[] event;
  
  Flag[] flag_state;
  
  State(){
    event = new Event[1];
  }
  
  void init(Game g){
    player_x = 100;
    player_y = 100;
    map_id = 0;
    event[0] = new Event(g.data.maps[0].map_transition[0].x,
      g.data.maps[0].map_transition[0].y, 
      0, 
      g.data.maps[0].map_transition[0].id);
  }
  
  void update(Game g){
    for(int i=0; i<event.length; i++){
      if(event[i].trigger(g)==1){
        if(event[i].type==0){
          map_id=event[i].update0(g,map_id);
        }
      }
    }
    
    
    if(g.key_state.key_up>=1){
      player_y -= 1;
    }
    if(g.key_state.key_down>=1){
      player_y += 1;
    }
    if(g.key_state.key_right>=1){
      player_x += 1;
    }
    if(g.key_state.key_left>=1){
      player_x -= 1;
    }
  }
}
