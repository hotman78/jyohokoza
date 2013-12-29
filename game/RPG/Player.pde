
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
  PImage bianca;
  Status status;
  ArrayList items;
  ArrayList weapons;
  
  int cursor = 0;
  
  int a0=90000000,
    d0=5000,
    c0=0,
    mh0=30,
    mm0=0;
  
  Player(){
    bianca = loadImage("./data/image/LARGE_BIANCA.png");
    items = new ArrayList();
    status= new Status(a0,d0,c0,mh0,mm0);
  }
  
  void display_item_list(Game g){
  // display item list
    for(int i=0; i<g.state.player.items.size(); i++){
      Item it = (Item)(g.state.player.items.get(i));
      textFont(g.data.kishimoto);
      stroke(0, 0, 255);
      noFill();
      if(i==cursor){
        rectMode(CORNER);
        rect(20, (i-1)*30+50, 200, 30);
      }
      textSize(25);
      fill(255, 0, 0);
      text(it.name + "(" + it.num + ")", 20, i*30 + 50);
    }
  }
  
  void switch_next(){
    if(cursor<items.size()-1) cursor++;
  }
  
  void switch_prev(){
    if(cursor>0) cursor--;
  }
  
  
  void display_status(Game g){
    fill(200, 0, 0, 100);
    stroke(0);
    rectMode(CORNER);
    rect(30, 30, width-60, height-60);
    
    image(bianca, 300, 250);
    
    noStroke();
    fill(255, 100);
    rect(0, 0, width, height);
    
    fill(0, 0, 255);
    textSize(30);
    text("ステータス画面", 100, 70);
    
    pushMatrix();
    translate(50, 50);
    display_item_list(g);
    popMatrix();
    
    textSize(20);
    text("HP: "+status.hp + " / "+status.maxhp, 300, 100);
    text("MP: "+status.mp + " / "+status.maxmp, 300, 120);
    text("AT: "+status.at, 300, 140);
    text("DF: "+status.df, 300, 160);
    text("CR: "+status.cr, 300, 180);
    
  }
  
}


