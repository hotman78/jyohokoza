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
  ArrayList<TPos> talk;
  int talk_num;
  Player player;
  
  PImage[] b;
  PImage[] m;
  
  PImage bg;
  PImage mg;
  
  int z=0;
  
  Dict_character dict_c;
  
  Flag[] flag_state;
  
  State(Game g){
  }
  
  void init(Game g){
    b = new PImage[g.data.N_maps];
    m = new PImage[g.data.N_maps];
    trans = new ArrayList();
    enemy = new ArrayList();
    items = new ArrayList();
    talk = new ArrayList<TPos>();
    talk_num=-1;
    player = new Player();
    dict_c = new Dict_character();
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
      //println(i);
      b[i]=createImage(g.data.maps[i].background.width,g.data.maps[i].background.height,RGB);
      m[i]=createImage(g.data.maps[i].mask.width,g.data.maps[i].mask.height,RGB);
      b[i].copy(g.data.maps[i].background,0,0,g.data.maps[i].background.width,g.data.maps[i].background.height,0,0,g.data.maps[i].background.width,g.data.maps[i].background.height);
      m[i].copy(g.data.maps[i].mask,0,0,g.data.maps[i].mask.width,g.data.maps[i].mask.height,0,0,g.data.maps[i].mask.width,g.data.maps[i].mask.height);
    }
    
  }
  
  private boolean han(Game g,PImage pg,int x,int y,int vx,int vy){
//    PImage pg=g.display.player_img;
    if(x+vx-pg.width/2>=0&&
      y+vy-pg.height/2>=0&&
      x+vx-bg.width+pg.height/2<=0&&
      y+vy-bg.height+pg.height/2<=0);
    else return false;
    mg.loadPixels();
    int s=0;
    for(int i=0;i<pg.width;i++){
      for(int j=0;j<pg.height;j++){
        color c=mg.pixels[(y+vy-pg.height/2+j)*bg.width+x+vx-pg.width/2+i];
//        println(red(c)+" " +blue(c)+" "+green(c));
        if(brightness(c)<=1){
          return false;
        }
      }
    }
    return true;
  
  }
  private int area(float px,float py,float ex,float ey){    //Ai(c:193s)
    if(px > ex){
      if(py > ey)
        return 1;
      else if(py < ey)
        return 4;
      else
        return 8;
    }else if(px < ex){
      if(py > ey)
        return 2;
      else if(py < ey)
        return 3;
      else
        return 6;
    }else{
      if(py < ey)
        return 7;
      else if(py > ey)
        return 5;
      else
        return 0;
    }
  }
  
  void update(Game g){
    int mx=-1,my=-1;
    int px=g.state.player_x;
    int py=g.state.player_y;
    if(px<width/2)mx = 0;
    else if(px>bg.width-width/2)mx = width-bg.width;
    if(py<height/2)my = 0;
    else if(py>bg.height-height/2)my = height-bg.height;
    
    if(mx==-1)mx=width/2-px;    
    if(my==-1)my=height/2-py;
    

    // main
    if(game_state==0){
      bg=b[map_id];
      mg=m[map_id];
      
      if(z==1){
        player.status.hp-=10;
        z=0;
      }
      
      ArrayList t = g.data.maps[map_id].map_transition;
      for(int i=0; i<t.size(); i++){
        // map transition
        if(((Trans)t.get(i)).trigger(g)==1){
          map_id = ((Trans)t.get(i)).next_map;
          player_x=((Trans)t.get(i)).px;
          player_y=((Trans)t.get(i)).py;
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
          // set talk data for the new map
          talk = new ArrayList();
          for(int j=0; j<g.data.maps[map_id].map_talk.size(); j++){
            TPos it = (TPos)g.data.maps[map_id].map_talk.get(j);
            talk.add(it);
          }
        }
      }
      
      ArrayList<TPos> tl = g.data.maps[map_id].map_talk;
      for(int i=0;i<tl.size();i++){
         println(tl.get(i).text);
        if(tl.get(i).trigger(g) && tl.get(i).done()){
          println("talk id: "+i);
          talk_num = i;
          g.display.window.disp = true;
          game_state=4;
          break;
        }
      }
      
      // get item and move item
      for(int i=0; i<items.size(); i++){
        if(dist(((Item)items.get(i)).pos.x, ((Item)items.get(i)).pos.y, player_x, player_y) < 20){
          Item it = ((Item)(items.get(i))).copy();
          println("item get:"+it.name+"×"+it.num);
          player.items.add(it);
          ((Item)items.get(i)).num = -1;
        }else{
          ((Item)items.get(i)).move();
          
          if(((Item)items.get(i)).type==-1){
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
                ((Enemy)enemy.get(j)).hp-=1;
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
          Item it = ((Item)(player.items.get((player.items.size()-1))));
          if(it.num<=1) player.items.remove((player.items.size()-1));
          else{
            it.num--;
          }
          println("item throw:"+it.name);
          it = it.copy();
          float theta = atan2(mouseY-(player_y+my), mouseX-(player_x+mx));
          float vel = 5.0;
          it.pos = new Position(player_x+50*cos(theta), player_y+50*sin(theta), vel*cos(theta), vel*sin(theta), 0, random(-0.1, 0.1));
          it.type = -1;
          items.add(it);
          z=1;
        }
      }
      
      // enemy move (Ai):193s
      for(int i=0;i<enemy.size();i++){
        float vx = ((Enemy)enemy.get(i)).vx;
        float vy = ((Enemy)enemy.get(i)).vy;
        float x = ((Enemy)enemy.get(i)).x;
        float y = ((Enemy)enemy.get(i)).y;
        float angle = 0;
        int id = ((Enemy)enemy.get(i)).AI_id;
        float tpx = ((Enemy)enemy.get(i)).targetX;
        float tpy = ((Enemy)enemy.get(i)).targetY;
        PImage img = ((Enemy)enemy.get(i)).img;
        float far = dist(player_x,player_y,x,y);
        
        switch(id){
          case 0:
            float angles = random(TWO_PI);
            float size = random(50);
            if(frameCount%50 == 0){
              tpx = player_x+size*cos(angles);
              tpy = player_y+size*sin(angles);
            }
            vx = 5*(tpx-x)/dist(tpx,tpy,x,y);
            vy = 5*(tpy-y)/dist(tpx,tpy,x,y);
            break;
          case 1:
            if(frameCount %26 == 0){
              vx = (player_x-x)/far;
              vy = (player_y-y)/far;
            }
            break;
          case 2:
            if(frameCount %15 == 0){
              if(far < 300){
                if(far > 10){
                if(true){
                    int xm = 0,ym = 0;
                    switch(area(player_x,player_y,x,y)){
                      case 1:angle = random(HALF_PI);break;
                      case 2:angle = random(HALF_PI,PI);break;
                      case 3:angle = random(PI,PI+HALF_PI);break;
                      case 4:angle = random(PI+HALF_PI,TWO_PI);break;
                      case 5:xm = 1;break;
                      case 6:ym = -1;break;
                      case 7:xm = -1;break;
                      case 8:ym = 1;break;
                    }
                  if(xm == 0 && ym == 0){
                      vx = 2*cos(angle);
                      vy = 2*sin(angle);
                  }else if(xm == 0)
                      vy = ym*2;
                  else if(ym == 0)
                    vx = xm*2;
                  }
                }else{
                  angle = atan2(player_y-y,player_x-x);
                  x = player_x;
                  y = player_y;
                  vx = 0;
                  vy = 0;
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
        
          //if(dist(player_x, player_y, x+vx, y+vy)<dist(player_x, player_y, x, y)){
          if(!han(g,img,(int)x,(int)y,(int)vx,(int)vy)){
            if(han(g,img,(int)x,(int)y,(int)vx,0))x+=vx;
            else if(han(g,img,(int)x,(int)y,0,(int)vy))y+=vy;
          }else{
            x += vx;
            y += vy;
          }
          //}
        
          ((Enemy)enemy.get(i)).x = x;
          ((Enemy)enemy.get(i)).y = y;
          ((Enemy)enemy.get(i)).vx = vx;
          ((Enemy)enemy.get(i)).vy = vy;
          ((Enemy)enemy.get(i)).targetX = tpx;
          ((Enemy)enemy.get(i)).targetY = tpy;
        }
    
      // player move
      int vx=0,vy=0;
      PImage img=g.display.muki_img;

      if(g.key_state.key_right>=1){
        vx += 2;
        player_muki = 3;
      }
      if(g.key_state.key_left>=1){
        vx -= 2;
        player_muki = 1;
      }
      if(g.key_state.key_up>=1){
        vy -= 2; 
        player_muki = 0;
        
      }
      if(g.key_state.key_down>=1){
        vy += 2;
        player_muki = 2;
      }
      if(!han(g,img,player_x,player_y,vx,vy)){
        if(han(g,img,player_x,player_y,vx,0))player_x+=vx;
        else if(han(g,img,player_x,player_y,0,vy))player_y+=vy;
      }else{
        player_x += vx;
        player_y += vy;
      }
      
      // remove dead enemy by blue
 //     println(g.key_state.key_z);
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
      
      if(player.status.hp<1){
        game_state = 2;
        println("player died");
      }
      
    }
    // title
    else if(game_state==1){
      if(g.key_state.key_c>0){
        //init(g);
        game_state=0;
      }
    }
    // ending
    else if(game_state==2){
      if(player.status.hp<1){
        if(g.key_state.key_x>0){
          println("player relive");
          //g.data=new Data();
          //g.data.load_all(g);
          //state=new State(this);
          init(g);
          game_state=1;
        }
      }else {
        time++;
        if(time>200){
          exit();
        }
      }
    }
    //dictionary page
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
    }
    else if(game_state==4){
      if(talk_num<0){
      }else {
        if(g.key_state.mouse_left%120==1){
          g.data.maps[map_id].map_talk.get(talk_num).update(g);
        }
      }
    }
    
  }
  
  
}
