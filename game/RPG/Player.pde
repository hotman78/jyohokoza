
class Status{
  int at, df, cr;
  int hp, mp;
  int maxhp, maxmp;
  
  Status(){
    at=0; df=0; cr=0; hp=0; mp=0; maxhp=0; maxmp=0;
  }
  Status(int a0, int d0, int c0, int mh0, int mm0){
    at=a0; df=d0; cr=c0; hp=mh0; mp=mm0; maxhp=mh0; maxmp=mm0;
  }
  Status(int a0, int d0, int c0,int h0,int m0, int mh0, int mm0){
    at=a0; df=d0; cr=c0; hp=h0; mp=m0; maxhp=mh0; maxmp=mm0;
  }
  Status copy(){
    return new Status(at, df, cr, maxhp, maxmp);
  }
}


class Player{
  Status status;
  ArrayList items;
  ArrayList weapons;
  
  int a0=90000000,
    d0=5000,
    c0=0,
    mh0,
    mm0;
  
  Player(){
    items = new ArrayList();
    status= new Status(a0,d0,c0,mh0,mm0);
  }

  
  
}
