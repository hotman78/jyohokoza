// マップ遷移のデータ
// mapに附属

class Trans{
  int id;
  int next_map;
  int x;
  int y;
  PImage img;
  
  Trans(){
    
  }
  
  Trans(int debug){
    if(debug==0){
      id = 0;
      next_map = 1;
      img = loadImage("./data/image/transition.png");
      x = 314;
      y = 159;
    }else if(debug==1){
      id = 1;
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
