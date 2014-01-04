// ファイルから読み込んだ敵に関するデータ
// dataで管理

class Enemy{
  int AI_id,w_id,hp,mp,at,df;
  float x,y;
  float vx,vy;
  float targetX,targetY;
  String name,text;
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
  
  void draw(Game g,int mx,int my){
    imageMode(CENTER);
    if(hp>0)image(img, mx+x, my+y);
    fill(255,0,0);
    ellipse(mx+x,my+y,10,10);
    fill(0,255,0);
    textSize(20);
    text(str(AI_id),mx+x-8,my+y+5);
  }
  
 // void load_file(){

  Enemy(String _name,PImage _img,int _AI_id,int _w_id, int _hp, int _mp, int _at, int _df,String _text){
    name = _name;
    img = _img;
    AI_id = _AI_id;
    w_id = _w_id;
    hp = _hp;
    mp = _mp;
    at = _at;
    df = _df;
    text = _text;
  }
  
  Enemy copy(){
    return new Enemy(name,img,AI_id,w_id,hp,mp,at,df,text);
  }
  
  Enemy copy2(){
    Enemy e;
    e= new Enemy(name,img,AI_id,w_id,hp,mp,at,df,text);
    e.x=x;
    e.y=y;
    return e;
  }
    
  
  
}
