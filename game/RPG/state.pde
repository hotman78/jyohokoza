class State{
  int game_state;  // タイトル、ゲーム内、エンディングとか
  int menu_state;  // メニューが開いている時 1
  int kaiwa_state; // 会話が起きている時 1
  
  int map_id;
  int player_x, player_y;
  Trans[] trans;
  
  Flag[] flag_state;
  
  State(){
    trans = new Trans[1];
  }
  
  void init(Game g){
    player_x = 100;
    player_y = 100;
    map_id = 0;
/*    trans[0] = new Trans(g.data.maps[0].map_transition[0].px,
      g.data.maps[0].map_transition[0].py, 
      g.data.maps[0].map_transition[0].y, 
      g.data.maps[0].map_transition[0].id);*/
  }
  
  void update(Game g){
    Trans[] t=g.data.maps[map_id].map_transition;
    for(int i=0; i<t.length; i++){
      if(t[0].trigger(g)==1){
        // map transition
        map_id = t[0].next_map;
        player_x=t[0].px;
        player_y=t[0].py;
      /*    trans[0] = new Trans(g.data.maps[map_id].map_transition[0].px,
            g.data.maps[map_id].map_transition[0].py, 
            g.data.maps[map_id].map_transition[0].map_id, 
            g.data.maps[map_id].map_transition[0].id);*/
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
