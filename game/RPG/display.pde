class Display{
  PImage player_img,title_img,end_img;
  Window window;
  
  Display(){
    player_img = loadImage("./data/image/characters/BIANCA_0_small.png");
    title_img=loadImage("./data/image/title.png");
    end_img=loadImage("./data/image/end.png");
    
    window = new Window(0, height/4*3, width, height/4);
  }
  
  void draw(Game g){
    background(255);
    
    if(g.state.game_state==0){//main
      draw_map(g);
      draw_event(g);
      draw_player(g);
    }else if(g.state.game_state==1){//op
        draw_title(g);
    }else if(g.state.game_state==2){//ed
        draw_ending(g);
    }else if(g.state.game_state==3){
      if(g.state.disp_dict=='a'){
        g.state.dict_item.display(g);
      }
      if(g.state.disp_dict=='s'){
        g.state.dict_enemy.display(g);
      }
      if(g.state.disp_dict=='d'){
        g.state.dict_character.display(g);
      }
    }
     // window.draw(g);
     // draw_menu(g);
      
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
 if(g.key_state.key_z%80<30||g.key_state.key_z%80>50){
                        ellipse(mx+10*cos(-QUARTER_PI-g.state.player_muki*HALF_PI),my+10*sin(-QUARTER_PI-g.state.player_muki*HALF_PI),50,50);
 }

      
  // display item list
    for(int i=0; i<g.state.player.items.size(); i++){
      Item it = (Item)(g.state.player.items.get(i));
      textFont(g.data.kishimoto);
      textSize(25);
      fill(255, 0, 0);
      text(it.name, 20, i*30 + 50);
    }
  }
  
  void draw_window(Game g){
    window.draw(g);
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
