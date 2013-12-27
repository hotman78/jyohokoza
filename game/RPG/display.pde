class Display{
  PImage player_img,title_img;
  Display(){
    player_img = loadImage("./data/image/BIANCA_0_small.png");
    title_img=loadImage("./data/image/title.png");
  }
  
  void draw(Game g){
    background(255);
    
    if(g.state.game_state==0){
      draw_map(g);
      draw_event(g);
      draw_player(g);
      if(g.state.kaiwa_state==1){
        draw_kaiwa(g);
      }
      if(g.state.menu_state==1){
        draw_menu(g);
      }
    }else if(g.state.game_state==1){
        draw_title(g);
    }else if(g.state.game_state==2){
        draw_ending(g);
    }
  }
  
  void draw_map(Game g){
    g.data.maps[g.state.map_id].draw(g);
  }
  
  void draw_event(Game g){
    for(int i=0; i<g.data.maps[g.state.map_id].map_transition.length; i++){
      g.data.maps[g.state.map_id].map_transition[i].draw(g);
    }
    for(int i=0; i<g.state.enemy.length; i++){
      g.state.enemy[i].draw(g);
    }
  }
  
  void draw_player(Game g){
    image(player_img, g.state.player_x, g.state.player_y, 60, 60);
//    ellipse(g.state.player_x, g.state.player_y, 20, 20);
  }
  
  void draw_kaiwa(Game g){
    
  }
  
  void draw_menu(Game g){
  }
  
  void draw_title(Game g){
    image(title_img,0,0,600,500);
  }
  
  void draw_ending(Game g){
    
  }
  
}
