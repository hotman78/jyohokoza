class State{
  int game_state=1;  // タイトル、ゲーム内、エンディングとか
  int menu_state;  // メニューが開いている時 1
  int kaiwa_state; // 会話が起きている時 1
  
  int map_id;
  int player_x, player_y;
  int player_muki;//0up 1down 2 right 3 left
  int time,trans_num;
  Trans[] trans;
  ArrayList enemy;

  
  Flag[] flag_state;
  
  State(){
    trans = new Trans[1];
    enemy=new ArrayList();
  }
  
  void init(Game g){
    player_x = 100;
    player_y = 100;
    map_id = 0;
    for(int i=0;i<g.data.maps[map_id].map_enemy.size();i++){
      Enemy en = (Enemy)g.data.maps[map_id].map_enemy.get(i);
      enemy.add(en.copy2());
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
          trans_num++;
          if(trans_num>=5)game_state=2;
          enemy = new ArrayList();        
          for(int j=0;j<g.data.maps[map_id].map_enemy.size();j++){
            Enemy en = (Enemy)g.data.maps[map_id].map_enemy.get(i);
            enemy.add(en.copy2());
          }
        }
      }
      
      for(int i=0;i<g.data.maps[map_id].map_enemy.size();i++){
        int vx,vy;
        vx=(int)random(-5,5);
        vy=(int)random(-5,5);
        if(dist(player_x, player_y, ((Enemy)enemy.get(i)).x+vx, ((Enemy)enemy.get(i)).y+vy)<dist(player_x, player_y, ((Enemy)enemy.get(i)).x, ((Enemy)enemy.get(i)).y)){
          ((Enemy)enemy.get(i)).x+=vx;
          ((Enemy)enemy.get(i)).y+=vy;
        }
      }
    
    
      if(g.key_state.key_up>=1){
        player_y -= 1; 
        player_muki = 0;
      }
      if(g.key_state.key_down>=1){
        player_y += 1;
        player_muki = 1;
      }
      if(g.key_state.key_right>=1){
        player_x += 1;
        player_muki = 2;
      }
      if(g.key_state.key_left>=1){
        player_x -= 1;
        player_muki = 3;
      }
      println(g.key_state.key_z);
      if(g.key_state.key_z%80<30){
      }else if((g.key_state.key_z%80>=30&&g.key_state.key_z%80<40)||(g.key_state.key_z%80>50&&g.key_state.key_z%80<80)){
      }else if(g.key_state.key_z%80==40){
        //println(player_muki);
        switch(player_muki){
          case 0:
            for(int i=0;i<g.data.maps[map_id].map_enemy.size();i++){     
              if(((Enemy)enemy.get(i)).x-player_x<30&& ((Enemy)enemy.get(i)).x-player_x>-30&& ((Enemy)enemy.get(i)).y-player_y<=0&& ((Enemy)enemy.get(i)).y-player_y>-60){
                ((Enemy)enemy.get(i)).hp-=90000000;
              }
            }
            break;
          case 1:
            for(int i=0;i<g.data.maps[map_id].map_enemy.size();i++){     
              if(((Enemy)enemy.get(i)).x-player_x<30&& ((Enemy)enemy.get(i)).x-player_x>-30&& ((Enemy)enemy.get(i)).y-player_y>=0&& ((Enemy)enemy.get(i)).y-player_y<60){
                ((Enemy)enemy.get(i)).hp-=90000000;
              }
            }
            break;
          case 2:
             for(int i=0;i<g.data.maps[map_id].map_enemy.size();i++){     
              if(((Enemy)enemy.get(i)).x-player_x<60&& ((Enemy)enemy.get(i)).x-player_x>=0&& ((Enemy)enemy.get(i)).y-player_y>-30&& ((Enemy)enemy.get(i)).y-player_y<30){
                ((Enemy)enemy.get(i)).hp-=90000000;
              }
            }
            break; 
          case 3:
              for(int i=0;i<g.data.maps[map_id].map_enemy.size();i++){     
              if(((Enemy)enemy.get(i)).x-player_x<-60&& ((Enemy)enemy.get(i)).x-player_x<=0&& ((Enemy)enemy.get(i)).y-player_y>-30&& ((Enemy)enemy.get(i)).y-player_y<30){
                ((Enemy)enemy.get(i)).hp-=90000000;
              }
            }
            break; 
        }
      }else if(g.key_state.key_z%80>40&&g.key_state.key_z%80<50){
      }else if(g.key_state.key_z%80==0){
        g.key_state.key_z=1;
      }
    }
    else if(game_state==1){
      if(g.key_state.key_c>=1){
        game_state=0;
        println("a");
      }
    }
    else if(game_state==2){
      time++;
      if(time>200){
        exit();
      }
    }
  }
}
