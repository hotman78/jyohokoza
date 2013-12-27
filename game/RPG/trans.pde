// マップ遷移のデータ
// mapに附属

class Trans{
  int next_map;
  int x;
  int y;
  PImage img;
  
  Trans(){
    
  }
  
  Trans(int map_id,int event_id){
    if(map_id==0){
      next_map = 1;
      img = loadImage("./data/image/transition.png");
      x = 314;
      y = 159;
    }else if(map_id==1){
      next_map = 0;
      img = loadImage("./data/image/transition.png");
      x = 265;
      y = 358;
    }
  }
  
  void draw(Game g){
    imageMode(CENTER);
    image(img, x, y);
  }
}
