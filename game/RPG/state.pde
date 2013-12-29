class State{
  int game_state=1;  // タイトル、ゲーム内、エンディングとか
  Dict_item dict_item;
  Dict_enemy dict_enemy;
  Dict_character dict_character;
  
  int map_id;
  int player_x, player_y;
  int player_muki;//0up 1down 2 right 3 left
  int time,trans_num;
  int disp_dict;
  ArrayList trans;
  ArrayList items;
  ArrayList enemy;
  Player player;
  
  PImage[] b;
  PImage[] m;
  
  PImage bg;
  PImage mg;
  

  

  
  int z=0;
  
  Dict_character dict_c;

  
  Flag[] flag_state;
  
  State(Game g){
    b=new PImage[g.data.N_maps];
    m=new PImage[g.data.N_maps];
    trans = new ArrayList();
    enemy=new ArrayList();
    items = new ArrayList();
    player = new Player();
    dict_c = new Dict_character();
  }
  
  void init(Game g){
    player = new Player();
    player_x=110;
    player_y=120;
    map_id = 0;
    for(int i=0;i<g.data.maps[map_id].map_enemy.size();i++){
      Enemy en = (Enemy)g.data.maps[map_id].map_enemy.get(i);
      enemy.add(en.copy2());
    }
    for(int j=0; j<g.data.maps[map_id].map_item.size(); j++){
      Item it = (Item)g.data.maps[map_id].map_item.get(j);
      items.add(it.copy2());
    }
    for(int i=0;i<b.length;i++){
      b[i]=createImage(g.data.maps[i].background.width,g.data.maps[i].background.height,RGB);
      m[i]=createImage(g.data.maps[i].mask.width,g.data.maps[i].mask.height,RGB);
      b[i].copy(g.data.maps[i].background,0,0,g.data.maps[i].background.width,g.data.maps[i].background.height,0,0,g.data.maps[i].background.width,g.data.maps[i].background.height);
      m[i].copy(g.data.maps[i].mask,0,0,g.data.maps[i].mask.width,g.data.maps[i].mask.height,0,0,g.data.maps[i].mask.width,g.data.maps[i].mask.height);
    }
    
  }
  
  int han(Game g,PImage pg,int x,int y,int vx,int vy){
//    PImage pg=g.display.player_img;
    println(x);
    println("");
    if(x+vx-pg.width/2>=0&&
      y+vy-pg.height/2>=0&&
      x+vx-bg.width+pg.height/2<=0&&
      y+vy-bg.height+pg.height/2<=0);
    else return 0;
    mg.loadPixels();
    int s=0;
    for(int i=0;i<pg.width;i++){
      for(int j=0;j<pg.height;j++){
        color c=mg.pixels[(y+vy-pg.height/2+j)*bg.width+x+vx-pg.width/2+i];
//        println(red(c)+" " +blue(c)+" "+green(c));
        if(brightness(c)<=1){
          return 0;
        }
      }
    }
    return 1;
  
  }
  
  void update(Game g){
    int mx=-1,my=-1;
    int px=g.state.player_x;
    int py=g.state.player_y;
    if(px<width/2)mx=0;
    else if(px>bg.width-width/2)mx=width-bg.width;
    if(py<height/2)my=0;
    else if(py>bg.height-height/2)my=height-bg.height;
    
    if(mx==-1)mx=width/2-px;    
    if(my==-1)my=height/2-py;
//    if(game_state==3)game_state=0;
    
    // in game
    if(game_state==0&&player.status.hp>0){
      bg=b[map_id];
      mg=m[map_id];
      mg.loadPixels();
      println(mg.pixels[player_x+player_y*mg.width]);
      
        if(z==1){
          player.status.hp-=10;
          z=0;
        }
    //  player.status.hp+=(int)random(-10,9.9);
      ArrayList t=g.data.maps[map_id].map_transition;
      for(int i=0; i<t.size(); i++){
        // map transition
        if(((Trans)t.get(i)).trigger(g)==1){
          map_id = ((Trans)t.get(0)).next_map;
          player_x=((Trans)t.get(0)).px;
          player_y=((Trans)t.get(0)).py;
          trans_num++;
          if(trans_num>=5)game_state=2;
          // set enemy data for the new map
          enemy = new ArrayList();        
          for(int j=0;j<g.data.maps[map_id].map_enemy.size();j++){
            Enemy en = (Enemy)g.data.maps[map_id].map_enemy.get(j);
            enemy.add(en.copy2());
          }
          // set item data for the new map
          items = new ArrayList();
          for(int j=0; j<g.data.maps[map_id].map_item.size(); j++){
            Item it = (Item)g.data.maps[map_id].map_item.get(j);
            items.add(it.copy2());
          }
        }
      }
      
      // get item and move item
      for(int i=0; i<items.size(); i++){
        if(dist(((Item)items.get(i)).pos.x, ((Item)items.get(i)).pos.y, player_x, player_y) < 20){
//          println("aaaaaaaaaaaaaaaaaaaaaaaa");
          Item it = ((Item)(items.get(i))).copy();
          it.num = 100;
          player.items.add(it);
          ((Item)items.get(i)).num = -1;
        }else{
          ((Item)items.get(i)).move();
          
          if(((Item)items.get(i)).type==-1){
//          println("cccccccccccccccccccccccccccc");
          // item hit player
            if(dist(((Item)items.get(i)).pos.x, ((Item)items.get(i)).pos.y, player_x, player_y)<25){
              Player[] ahyo = new Player[3];
              //println(ahyo[0].hp);
              ((Item)items.get(i)).num = -1;
            }
            // item hit monster
            
            for(int j=0;j<enemy.size();j++){
              float ex = ((Enemy)enemy.get(j)).x;
              float ey = ((Enemy)enemy.get(j)).y;
              int itx = (int)(((Item)items.get(i)).pos.x);
              int ity = (int)(((Item)items.get(i)).pos.y);
              if(dist(ex, ey, itx, ity) < 30){
                ((Enemy)enemy.get(j)).hp-=90000000;
                bg.loadPixels();
                mg.loadPixels();
                int x = (int)(((Item)items.get(i)).pos.x);
                int y = (int)(((Item)items.get(i)).pos.y);
                if(x>=0 && x<bg.width && y>=0 && y<bg.height){
                  for(int ix=-50; ix<=50; ix++){
                    for(int iy=-50; iy<=50; iy++){
                      if(sq(ix)+sq(iy)<sq(50) && x+ix>=0 && x+ix<bg.width && y+iy>=0 && y+iy<bg.height){
                        bg.pixels[(x+ix)+bg.width*(y+iy)] = color(255, 0, 0);
                        mg.pixels[(x+ix)+mg.width*(y+iy)] = color(0, 0, 0);
                      }
                    }
                  }
                }
                bg.updatePixels();
                mg.updatePixels();
                ((Item)items.get(i)).num = -1;
              }
            }
            
            
            // item hit wall
            bg.loadPixels();
            mg.loadPixels();
            int x = (int)(((Item)items.get(i)).pos.x);
            int y = (int)(((Item)items.get(i)).pos.y);
            if(x>=0 && x<bg.width && y>=0 && y<bg.height){
              if(brightness(mg.pixels[(int)(((Item)items.get(i)).pos.x) + mg.width*(int)(((Item)items.get(i)).pos.y)])<=1){
                ((Item)items.get(i)).num = -1;
                for(int ix=-50; ix<=50; ix++){
                  for(int iy=-50; iy<=50; iy++){
                    if(sq(ix)+sq(iy)<sq(50) && x+ix>=0 && x+ix<bg.width && y+iy>=0 && y+iy<bg.height){
                      bg.pixels[(x+ix)+bg.width*(y+iy)] = color(255, 0, 0);
                      mg.pixels[(x+ix)+mg.width*(y+iy)] = color(255);
                    }
                  }
                }
              }
            }
            bg.updatePixels();
            mg.updatePixels();
          }
        }
      }
      
      // remove item from state.items (the item is now in player.items)
      for(int i=items.size()-1; i>=0; i--){
        if(((Item)items.get(i)).num == -1){
          items.remove(i);
        }
      }
      
      // throw items
      if(g.key_state.key_c==1){
        if(player.items.size()>0){
//          println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
          Item it = ((Item)(player.items.get((player.cursor))));
          if(it.num<=1) player.items.remove((player.cursor));
          else it.num--;
          it = it.copy();
          float theta = atan2(mouseY-(player_y+my), mouseX-(player_x+mx));
          float vel = 5.0;
          it.pos = new Position(player_x+50*cos(theta), player_y+50*sin(theta), vel*cos(theta), vel*sin(theta), 0, random(-0.1, 0.1));
          it.type = -1;
          items.add(it);
          z=1;
        }
      }
      
      // enemy move (AI)
      for(int i=0;i<enemy.size();i++){
        float vx = ((Enemy)enemy.get(i)).vx;
        float vy = ((Enemy)enemy.get(i)).vy;
        float x = ((Enemy)enemy.get(i)).x;
        float y = ((Enemy)enemy.get(i)).y;
        float angle;
        int id = ((Enemy)enemy.get(i)).AI_id;
        PImage img = ((Enemy)enemy.get(i)).img;
        switch(id){
          case 0:
          //float angle = atan2();
            angle = random(TWO_PI);
            vx = 3*cos(angle);
            vy = 3*sin(angle);
            break;
          case 1:
            if(frameCount %10 == 0){
              angle = random(TWO_PI);
              vx = 4*cos(angle);
              vy = 4*sin(angle);
            }
            break;
          case 2:
            if(frameCount %15 == 0){
              if(dist(player_x,player_y,x,y) < 300){
                if(frameCount %5 == 0){
                angle = random(TWO_PI);
                vx = 5*cos(angle);
                vy = 5*sin(angle);
                }
              }else{
                vx = 0;
                vy = 0;
              }
            }
            break;
          case 3:
            if(frameCount%45==0){
              vx = 0;
              vy = 0;
              Item it = ((Item)g.data.items[9]).copy();
              float theta = atan2(player_y - y, player_x - x);
              float vel = 5.0;
              it.pos = new Position(x+60*cos(theta), y+60*sin(theta), vel*cos(theta), vel*sin(theta), theta+PI, 0);
              it.type = -1;
              items.add(it);
            }
            break;
          default:
            if(frameCount %8 == 0){
                angle = random(TWO_PI);
                vx = 4*cos(angle);
                vy = 4*sin(angle);
            }
            break;
        }
        
        if(dist(player_x, player_y, x+vx, y+vy)<dist(player_x, player_y, x, y)){
          if(han(g,img,(int)x,(int)y,(int)vx,(int)vy)==0){
            if(han(g,img,(int)x,(int)y,(int)vx,0)==1)x+=vx;
            else if(han(g,img,(int)x,(int)y,0,(int)vy)==1)y+=vy;
          }else{
            x += vx;
            y += vy;
          }
        }
        
        ((Enemy)enemy.get(i)).x = x;
        ((Enemy)enemy.get(i)).y = y;
        ((Enemy)enemy.get(i)).vx = vx;
        ((Enemy)enemy.get(i)).vy = vy;
      }
    
      // player move
      int vx=0,vy=0;

      if(g.key_state.key_right>=1){
        if(han(g,g.display.right,player_x,player_y,2,0)==1)vx += 2;
        player_muki = 3;
      }
      if(g.key_state.key_left>=1){
        if(han(g,g.display.left,player_x,player_y,-2,0)==1)vx -= 2;
        player_muki = 1;
      }
      if(g.key_state.key_up>=1){
        if(han(g,g.display.back,player_x,player_y,0,-2)==1)vy -= 2; 
        player_muki = 0;
        
      }
      if(g.key_state.key_down>=1){
        if(han(g,g.display.front,player_x,player_y,0,2)==1)vy += 2;
        player_muki = 2;
      }
      if(vx!=0&&vy!=0&&han(g,g.display.front,player_x,player_y,vx,vy)==0);else{
        player_x+=vx;
        player_y+=vy;
      }
      
      // remove dead enemy by blue
      println(g.key_state.key_z);
      for(int i=0; i<enemy.size();i++){
        if(((Enemy)enemy.get(0)).hp>0){
          enemy.add(((Enemy)enemy.get(0)));
        }
        enemy.remove(0);
      }
      
      // player attack by blue
              if(g.state.player.status.hp>0){
       if(g.key_state.attack==10){
        // attack enemy
        
        //println(player_muki);

        switch(player_muki){
          case 0:
            for(int i=0;i<enemy.size();i++){     
              if(((Enemy)enemy.get(i)).x-player_x<16&& ((Enemy)enemy.get(i)).x-player_x>-16&& ((Enemy)enemy.get(i)).y-player_y<=0&& ((Enemy)enemy.get(i)).y-player_y>-60){
                ((Enemy)enemy.get(i)).hp-=90000000;
              }
            }
            break;
          case 1:
              for(int i=0;i<enemy.size();i++){     
              if(((Enemy)enemy.get(i)).x-player_x>-60&& ((Enemy)enemy.get(i)).x-player_x<=0&& ((Enemy)enemy.get(i)).y-player_y>-16&& ((Enemy)enemy.get(i)).y-player_y<16){
                ((Enemy)enemy.get(i)).hp-=90000000;
              }
            }
            break;           
            

          case 2:
          for(int i=0;i<enemy.size();i++){     
              if(((Enemy)enemy.get(i)).x-player_x<16&& ((Enemy)enemy.get(i)).x-player_x>-16&& ((Enemy)enemy.get(i)).y-player_y>=0&& ((Enemy)enemy.get(i)).y-player_y<60){
                ((Enemy)enemy.get(i)).hp-=90000000;
              }
            }
             
            break; 
          case 3:
            for(int i=0;i<enemy.size();i++){     
              if(((Enemy)enemy.get(i)).x-player_x<60&& ((Enemy)enemy.get(i)).x-player_x>=0&& ((Enemy)enemy.get(i)).y-player_y>-16&& ((Enemy)enemy.get(i)).y-player_y<16){
                ((Enemy)enemy.get(i)).hp-=90000000;
              }
            }
            break; 
        }
      }
       }
      if(g.key_state.key_a==1){
        game_state = 3;
        disp_dict='a';
        dict_item = new Dict_item(g);
      }
      if(g.key_state.key_s==1){
        game_state = 3;
        disp_dict='s';
        dict_enemy = new Dict_enemy(g);
      }
      if(g.key_state.key_d==1){
        game_state = 3;
        disp_dict='d';
        dict_character = new Dict_character();
      }
      if(g.key_state.key_f==1){
        game_state = 3;
        disp_dict='f';
      }
        
    }
    // title
    else if(game_state==1){
      if(g.key_state.key_c>=1){
        game_state=0;
        println("a");
      }
    }
    // ending
    else if(game_state==2){
      time++;
      if(time>200){
        exit();
      }
    }
    // kaiwa window
    else if(game_state==3){
      if(disp_dict=='a'){
        if(g.key_state.key_up==1) dict_item.switch_prev();
        if(g.key_state.key_down==1) dict_item.switch_next();
        if(g.key_state.key_x==1) game_state = 0;
      }
      if(disp_dict=='s'){
        if(g.key_state.key_up==1) dict_enemy.switch_prev();
        if(g.key_state.key_down==1) dict_enemy.switch_next();
        if(g.key_state.key_x==1) game_state = 0;
      }
      else if(disp_dict=='d'){
        if(g.key_state.key_up==1) dict_character.switch_prev();
        if(g.key_state.key_down==1) dict_character.switch_next();
        if(g.key_state.key_x==1) game_state = 0;
      }
      else if(disp_dict=='f'){
        if(g.key_state.key_up==1) player.switch_prev();
        if(g.key_state.key_down==1) player.switch_next();
        if(g.key_state.key_x==1) game_state = 0;
      }
    }
    else if(game_state==4){
      
    }
    
  }
  
  
}
