
class Window {
  int px, py;
  int n_hei;
  int wid, hei;
  String name;
  String inter;
  PImage pct;
  boolean disp;
  
  Window(int px,int py,int wid,int hei,int n_hei){
    this.px = px;
    this.py = py;
    this.wid = wid;
    this.hei = hei;
    this.n_hei = n_hei;
    this.name = "篠笛禁断症状L5";
    this.inter = "みwなwぎwっwてwきwたwww";
    this.pct = loadImage("./data/image/characters/BIANCA_1.png");
    disp = false;
  }
  
  void name(String str){
    name = str;
  }
  
  void inter(String str){
    inter = str;
  }
  
  void pct(String str){
    pct = loadImage(str);
  }
  
  void draw(Game g){
    if(disp){
      pushMatrix();
      translate(75,0);
      imageMode(CORNERS);
      image(pct,width-pct.width,height-pct.height,width,height);
      popMatrix();
      rectMode(CORNER);
      stroke(0);fill(255,128);
      rect(px, py, px+wid, py+n_hei+hei, 10);
      stroke(0);fill(0);
      text(name, px, py, px+wid, py+n_hei);
      text(inter, px, py+n_hei, px+wid, py+hei);
    }
  }
  
  boolean inside(int mx,int my){
    return ((px<mx && mx<px+wid) && (py<my && my<py+hei));
  }
  
}

