class Display{
  PImage player_img,title_img,end_img;
  Display(){
    player_img = loadImage("./data/image/BIANCA_0_small.png");
    title_img=loadImage("./data/image/title.png");
    end_img=loadImage("./data/image/end.png");
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
    
  }
  
  void draw_player(Game g){
    int mx=-1,my=-1;
    int px=g.state.player_x;
    int py=g.state.player_y;
    int b_width=g.data.maps[g.state.map_id].background.width;
    int b_height=g.data.maps[g.state.map_id].background.height;    
    if(px<width/2)mx=px;
    else if(px>b_width-width/2)mx=width-b_width+px;
    if(py<height/2)my=py;
    else if(py>b_height-height/2)my=height-b_height+py;
    
    if(mx==-1)mx=width/2;    
    if(my==-1)my=height/2;  //スクロール処理　  by ookuwa
    
    image(player_img, mx, my, 60, 60);
//    ellipse(g.state.player_x, g.state.player_y, 20, 20);


    for(int i=0; i<g.state.player.items.size(); i++){
      Item it = (Item)(g.state.player.items.get(i));
      textFont(g.data.kishimoto);
      textSize(25);
      fill(255, 0, 0);
      text(it.name, 20, i*30 + 50);
    }
  }
  
  void draw_kaiwa(Game g){
    
  }
  
  void draw_menu(Game g){
  }
  
  void draw_title(Game g){
    imageMode(CORNERS);
    image(title_img,0,0,600,500);
  }
  
  void draw_ending(Game g){
    imageMode(CORNERS);
    image(end_img,0,0,600,500);
  }
  
}
