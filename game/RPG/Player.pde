
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
    mh0=300,
    mm0=0;
  
  Player(){
    items = new ArrayList();
    status= new Status(a0,d0,c0,mh0,mm0);
  }
  /*
  void display_status(Game g){
    fill(200, 0, 0, 100);
    stroke(0);
    rectMode(CORNER);
    rect(30, 30, width-60, height-60);
    for(int i=0; i<N; i++){
//      println("item: "+i);
      if(i==cursor) fill(255, 0, 0);
      else fill(50);
      textFont(g.data.kishimoto);
      textSize(15);
      text(g.data.items[i].name, 60, i*20+60);
    }
    textSize(25);
    text(g.data.items[cursor].name, width/2, 60);
    imageMode(CORNER);
    if(g.data.items[cursor].img==null) rect(250, 150, 200, 200);
    else image(g.data.items[cursor].img, 250, 150, 200, 200);
    fill(255);
    rect(30, height-100, width-60, 70);
    fill(0);
    textSize(15);
    text(g.data.items[cursor].text,50,450);
    if(g.data.items[cursor].type==0) text("type: 回復", 250, 360);
    if(g.data.items[cursor].type==1) text("type: 投擲", 250, 360);
    if(g.data.items[cursor].type==2) text("type: 武器", 250, 360);
    text("at  df  cr  hp  mp mhp mmp", 250, 380);
    text(g.data.items[cursor].status.at + " " + 
         g.data.items[cursor].status.df + " " + 
         g.data.items[cursor].status.cr + " " + 
         g.data.items[cursor].status.hp + " " + 
         g.data.items[cursor].status.mp + " " + 
         g.data.items[cursor].status.maxhp + " " + 
         g.data.items[cursor].status.maxmp + " "
    , 250, 400);
  }
  */
}


