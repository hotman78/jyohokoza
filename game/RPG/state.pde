class State{
  int game_state=1;  // タイトル、ゲーム内、エンディングとか
  int menu_state;  // メニューが開いている時 1
  int kaiwa_state; // 会話が起きている時 1
  
  int map_id;
  int player_x, player_y;
  Trans[] trans;
  Enemy[] enemy;

  
  Flag[] flag_state;
  
  State(){
    trans = new Trans[1];
    enemy=new Enemy[1];
  }
  
  void init(Game g){
    player_x = 100;
    player_y = 100;
    map_id = 0;
    for(int i=0;i<enemy.length;i++){
      Enemy en = (Enemy)g.data.maps[map_id].map_enemy.get(i);
      enemy[i]=en.copy2();
    }
  }
  
  void update(Game g){
    if(game_state==0){
      Trans[] t=g.data.maps[map_id].map_transition;
      for(int i=0; i<t.length; i++){
        if(t[0].trigger(g)==1){
          // map transition
          map_id = t[0].next_map;
          player_x=t[0].px;
          player_y=t[0].py;
          enemy = new Enemy[1];        
          for(int j=0;j<enemy.length;j++){
            Enemy en = (Enemy)g.data.maps[map_id].map_enemy.get(i);
            enemy[i]=en.copy2();
          }
        }
      }
      
      for(int i=0;i<enemy.length;i++){
        int vx,vy;
        vx=(int)random(-5,5);
        vy=(int)random(-5,5);
        if(dist(player_x, player_y, enemy[i].x+vx, enemy[i].y+vy)<dist(player_x, player_y, enemy[i].x, enemy[i].y)){
          enemy[i].x+=vx;
          enemy[i].y+=vy;
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
    else if(game_state==1){
      if(g.key_state.key_c>=1){
        game_state=0;
        println("a");
      }
    }
  }
}
