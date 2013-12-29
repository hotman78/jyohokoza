// マップ遷移のデータ
// mapに附属

class Trans{
  int id,map_id;
  int next_map;
  int x,px;
  int y,py;
  PImage img;
  
  Trans(){
    
  }
  
  Trans(int n0, int x0, int y0, int px0, int py0){
    img = loadImage("./data/image/transition2.png");
    next_map = n0;
    x = x0;
    y = y0;
    px = px0;
    py = py0;
  }
  
  Trans(int debug){
    if(debug==0){

      next_map = 1;
      img = loadImage("./data/image/transition2.png");
      x = 314;
      y = 159;
      px=100;
      py=200;
    }else if(debug==1){
      next_map = 0;
      img = loadImage("./data/image/transition2.png");
      x = 265;
      y = 358;
      px=200;
      py=100;
    }
  }
    
  int trigger(Game g){
    if(dist(x, y, g.state.player_x, g.state.player_y) < 50){
      return 1;
    }
    return 0;
  }

  Trans(int x0, int y0, int map_id0, int id0){
    x = x0;
    y = y0;
    map_id=map_id0;
    id = id0;
  }
  
  void draw(Game g,int mx,int my){
    imageMode(CENTER);
    image(img, x+mx, y+my);
  }
}
