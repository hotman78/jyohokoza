class State{
  int game_state;  // タイトル、ゲーム内、エンディングとか
  int menu_state;  // メニューが開いている時 1
  int kaiwa_state; // 会話が起きている時 1
  
  int map_id;
  int player_x, player_y;
  Event[] event;
  
  Flag[] flag_state;
  
  State(){
  }
  
  void init(Game g){
    player_x = 100;
    player_y = 100;
  }
  
  void update(Game g){
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
