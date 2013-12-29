
class Status{
  int player_x,player_y;
  int at, df, cr;
  int hp, mp;
  int maxhp, maxmp;
  
  Status(){
    at=0; df=0; cr=0; hp=0; mp=0; maxhp=0; maxmp=0;
  }
  Status(int px,int py,int a0, int d0, int c0, int mh0, int mm0){
    player_x=px;player_y=py;at=a0; df=d0; cr=c0; hp=mh0; mp=mm0; maxhp=mh0; maxmp=mm0;
  }
  Status copy(){
    return new Status(at, df, cr, hp, mp, maxhp, maxmp);
  }
}


class Player{
  Status status;
  ArrayList items;
  ArrayList weapons;
  
  int px=100,
    py=100,
    a0=90000000,
    d0=5000,
    c0=0,
    mh0,
    mm0;
  
  Player(){
    items = new ArrayList();
    status= new Status(px,py,a0,d0,c0,mh0,mm0);
  }
  
  void move(int px,int py){
    status.player_x=px;
    status.player_y=py;
  }
  
  
}
