class Gui{
  void bottom(String a,int x,int y){
    int b =a.length();
    fill(0);
    bottom = loadImage("btn057_10.png");
    image(bottom,x,y,10*b,20);
    text(a,x+b,y+12);
  }
  void Scrollbar(int x,int y,int widthScrollbar,float part){
     fill(50,50,50);
     
     fill(0);
     triangle(x+4,y+2,x+12,y+2,x+8,y+(sqrt(3)*5)+2);
     triangle(x+4,y+widthScrollbar-2,x+12,y+widthScrollbar-2,x+8,y-(sqrt(3)*5)+widthScrollbar-2);
  } 
}
