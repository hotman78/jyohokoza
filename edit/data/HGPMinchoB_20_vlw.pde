int b=0;
int c=0;
int mousex=0;
int mousey=0;
PImage bottom;
/*PImage up;
PImage down;
PImage left;
PImage right;
PImage left_up;
PImage left_down;
PImage right_up;
PImage right_down;*/
PImage editmap;
import java.awt.event.*;


void mouseWheel(int delta){ 
    c+=delta;
    if(c>0){c=0;}
    if(c<0-editmap.height){c=0;}
}
void gui(String a,int x,int y){
  b =a.length();
  fill(0);
  bottom = loadImage("btn057_10.png");
  image(bottom,x,y,10*b,20);
  text(a,x,y+12);
 }
 
 void edit(){
 image(editmap,450,c*10);
 }
 /*void window(int x,int y,int ax, int ay){
   up = loadImage("up.png");
   down = loadImage("down.png");
   left = loadImage("left.png");
   right = loadImage("right.png");
   left_up = loadImage("left_up.png");
   right_up = loadImage("right_up.png");
   left_down = loadImage("left_down.png");
   right_down = loadImage("right_down.png");
   image(up,x+6,y,ax-6,27);
   image(down,x+6,y+ay-6,ax-27,6);
   image(left,x,y+27,6,ay-27);
   image(right,x+ax-25,y+27,25,ay-27);
   image(left_up,x,y);
   image(right_up,x+ax-25,y);
   image(left_down,x,y+ay-6);
   image(right_down,x+ax-25,y+ay-6);
 }*/
void setup(){
   editmap = loadImage("base.png");
   PFont font = loadFont("HGPMinchoB-20.vlw");
   
   addMouseWheelListener(new MouseWheelListener() { 
   public void mouseWheelMoved(MouseWheelEvent mwe){ 
     mouseWheel(mwe.getWheelRotation());
  }}); 
  
  background( 0 );
  size(600,400);
  gui("new",0,0);
}
void draw(){
  background( 0 );
   edit();
    /* window(100,100,300,300);*/
     gui("new",0,0);
     fill(0,204,255,100);
     rect(mousex-mousex%16,mousey-(mousey-c*10)%16,16,16);
}
void mousePressed(){
      mousex=mouseX;
      mousey=mouseY;
}
