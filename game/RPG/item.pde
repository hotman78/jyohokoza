// アイテムのデータを読み込んだもの
// 管轄はdata

class Status{
  int at, df, cr;
  int hp, mp;
  int maxhp, maxmp;
  
  Status(){
    at=0; df=0; cr=0; hp=0; mp=0; maxhp=0; maxmp=0;
  }
  Status(int a0, int d0, int c0, int h0, int m0, int mh0, int mm0){
    at=a0; df=d0; cr=c0; hp=h0; mp=m0; maxhp=mh0; maxmp=mm0;
  }
  Status copy(){
    return new Status(at, df, cr, hp, mp, maxhp, maxmp);
  }
}

class Position{
  float x, y;    // xy
  float vx, vy;  // sokudo
  float t, vt;   // kakudo, kaiten_sokudo
  Position(){
    x=0; y=0; vx=0; vy=0; t=0; vt=0;
  }
  Position(float x0, float y0){
    x=x0; y=y0; vx=0; vy=0; t=0; vt=0;
  }
  Position(float x0, float y0, float vx0, float vy0, float t0, float vt0){
    x=x0; y=y0; vx=vx0; vy=vy0; t=t0; vt=vt0;
  }
  
  void move(){
    x += vx;
    y += vy;
    t += vt;
  }
}

class Item{
  int id;
  String name;
  PImage img;
  
  int type;
  // 0: kusuri
  // 1: nageru_mono
  // 2: weapon
  // -1: flying now
  
  Status status;
  Position pos;
  
  int value;
  int num=0;
  
  Item(int id0, String name0, PImage img0, int type0, Status s0){
    name = name0;
    img = img0;
    id = id0;
    type = type0;
    status = s0;
    pos = new Position();
  }
  
  Item copy(){
    return new Item(id, name, img, type, status);
  }
  Item copy2(){
    Item it = new Item(id, name, img, type, status);
    it.pos = new Position(pos.x, pos.y);
    it.value = 0;
    it.num = 0;
    return it;
  }
  
  void move(){
    if(type==-1){
      pos.move();
    }
  }
  
  void draw(Game g, int mx, int my){
    pushMatrix();
    translate(pos.x+mx, pos.y+my);
    rotate(pos.t);
    imageMode(CENTER);
    if(img==null){
      rectMode(CENTER);
      fill(0, 0, 255, 100);
      rect(0, 0, 60, 60);
    }
    else image(img, 0, 0, 60, 60);
    popMatrix();
  }
  
}
