// ファイルから読み込んだ敵に関するデータ
// dataで管理

class Enemy{
  int AI_id,w_id,hp,mp,at,df;
  int x,y;
  String name;
  PImage img;
//  Weapon w;
  
  Enemy(int debug){
    if(debug==0){
      img = loadImage("./data/image/enemy.png");
      AI_id=4;
      w_id=2;
      hp=200;
      mp=50;
      at=7;
      df=12;
      x=400;
      y=200;
//      w=new Weapon(w_id);
    }
    if(debug==1){
      img = loadImage("./data/image/enemy.png");
      AI_id=2;
      w_id=1;
      hp=200;
      mp=50;
      at=7;
      df=12;
      x=500;
      y=300;
//      w=new Weapon(w_id);
    }
  }
  
  void draw(Game g){
    imageMode(CENTER);
    image(img, x, y);
  }
  
  void load_file(){
    
  }
  
}
