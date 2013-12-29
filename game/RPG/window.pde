
class Window {
  int px, py;
  int wid, hei;
  String inter;
  boolean disp;
  
  Window(int px,int py,int wid,int hei){
    this.px = px;
    this.py = py;
    this.wid = wid;
    this.hei = hei;
    inter = "";
    disp = false;
  }
  
  void string(String str){
    inter = str;
  }
  
  void draw(Game g){
    if(disp){
      rectMode(CORNER);
      fill(255,0,0);
      rect(px, py, px+wid, py+hei);
      text(inter, px, py, px+wid, py+hei);
    }
  }
  
  boolean inside(int mx,int my){
    return ((px<mx && mx<px+wid) && (py<my && my<py+hei));
  }
  
}

