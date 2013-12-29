int a=0;
int b=0;
int mousex=110;
int mousey=110;
int paint=0 ;
int layerSizeX;
int layerSizeY;
int mouseDrag=0;
int layerNow=1;
int hidariX=0;
int hidariY=0;
int W;
int A;
int S;
int D;
PImage rayer1Draw;
PImage bottom;
PImage editmap;
PImage copy=createImage(16,16, 255);
PImage rayer1;
PImage rayer2;
PImage rayer3;
PImage rayer;
PImage fragw;
PImage fragww;

BackgroundProgram backgroundProgram;
Gui gui;
Depict depict;
LayerSize layerSize;
MapLayer mapLayer;

import java.awt.event.*;
import java.awt.*;
import javax.swing.*;

void setup(){
  backgroundProgram = new BackgroundProgram();
  gui= new Gui();
  depict = new Depict();
  layerSize = new LayerSize();
  mapLayer = new MapLayer();
  layerSizeX=50;
  layerSizeY=50;
  background( 0 );
  size(720,500);
  backgroundProgram.load();
  layerSize.layer();
  rayer1= createImage(layerSizeX*16,layerSizeY*16,255);
  rayer2= createImage(layerSizeX*16,layerSizeY*16,255);
  rayer3= createImage(layerSizeX*16,layerSizeY*16,255);
  rayer= createImage(layerSizeX*16,layerSizeY*16,255);
  fragw= createImage(layerSizeX*16,layerSizeY*16,255);
  fragww= createImage(layerSizeX*16,layerSizeY*16,255);
  fragww.loadPixels();for(int i=0;i<fragww.pixels.length;i++){fragww.pixels[i]=color(255);}
  fragww.updatePixels();
}

void draw(){
  background( 0 );
  if(W==1)hidariY-=16;
  else if(A==1)hidariX-=16;
  else if(S==1)hidariY+=16;
  else if(D==1)hidariX+=16;
  if(layerNow==1){
    mapLayer.layer1.edit();
  }
  if(layerNow==2){
    mapLayer.layer2.edit();
  }
  if(layerNow==3){
    mapLayer.layer3.edit();
  }
  if(layerNow==4){
    mapLayer.frag.edit();
  }
  depict.byousya ();
  fill(255);
     text(((mouseX/16*16+hidariX)/16+1)+
    "X"
    +((mouseY/16*16-80+hidariY)/16+1),350,50);
}

void mousePressed(){
  b=0;
  mouseDrag=1;
    if(mouseX>width-160){
      mousex=mouseX;mousey=mouseY;
      paint = (mousex/16)+(8*(mousey/16-a)-35);
      println(paint);
      copy = editmap.get((paint%8)*16,(paint/8)*16,16,16);
      
    }
    if((mouseX>0)&&(mouseX<60)&&(mouseY>30)&&(mouseY<50)){
      layerNow=1;
    }
    if((mouseX>60)&&(mouseX<120)&&(mouseY>30)&&(mouseY<50)){
      layerNow=2;
    }
    if((mouseX>120)&&(mouseX<180)&&(mouseY>30)&&(mouseY<50)){
      layerNow=3;
    }
    if((mouseX>180)&&(mouseX<220)&&(mouseY>30)&&(mouseY<50)){
      mapLayer.saveray.Save();
    }
        if((mouseX>220)&&(mouseX<260)&&(mouseY>30)&&(mouseY<50)){
     layerNow=4;
    }
        if((mouseX>260)&&(mouseX<320)&&(mouseY>30)&&(mouseY<50)){
     rayer1=loadImage("rayer.png");
     fragww=loadImage("mask.png");
    }
}
void mouseReleased(){
    mouseDrag=0;
}
void mouseWheel(int delta){
  if(mouseX>width-160){a-=delta*16;b-=delta*16;}
  if(a>0){a=0;b=0;}
  if(a<0-editmap.height){a=0;}
}

void keyPressed(){
  if(key=='w')W=1;
  else if(key=='a')A=1;
  else if(key=='s')S=1;
  else if(key=='d')D=1;
}
void keyReleased(){
  if(key=='w')W=0;
  else if(key=='a')A=0;
  else if(key=='s')S=0;  
  else if(key=='d')D=0;
}




