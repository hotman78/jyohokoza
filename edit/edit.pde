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

BackgroundProgram backgroundProgram;
Gui gui;
Depict depict;
LayerSize layerSize;
MapLayer mapLayer;

import java.awt.event.*;
import java.awt.*;
import javax.swing.*;

void setup(){
  size(580,600);
  backgroundProgram = new BackgroundProgram();
  gui= new Gui();
  depict = new Depict();
  layerSize = new LayerSize();
  mapLayer = new MapLayer();
  layerSizeX=34;
  layerSizeY=25;
  background( 0 );
  size(720,500);
  backgroundProgram.load();
  layerSize.layer();
  rayer1= createImage(layerSizeX*16,layerSizeY*16, 255);
  rayer2= createImage(layerSizeX*16,layerSizeY*16, 255);
  rayer3= createImage(layerSizeX*16,layerSizeY*16, 255);
}

void draw(){
  background( 0 );
  if(W==1)hidariY-=16;
  else if(A==1)hidariX-=16;
  else if(S==1)hidariY+=16;
  else if(D==1)hidariX+=16;
  if(C==1)&&
  mapLayer.saveray.Save();
  if(layerNow==1){
    mapLayer.layer1.edit();
  }
  if(layerNow==2){
    mapLayer.layer2.edit();
  }
  if(layerNow==3){
    mapLayer.layer3.edit();
  }
  depict.byousya ();
}

void mousePressed(){
  b=0;
  mouseDrag=1;
    if(mouseX>width-160){
      mousex=mouseX;mousey=mouseY;
      paint = (mousex/16)+(8*(mousey/16-a)-34);
      println(paint);
      copy = editmap.get((paint%8-1)*16,(paint/8)*16,16,16);
      
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
}
void mouseReleased(){
    mouseDrag=0;
}
void mouseWheel(int delta){
  if(mouseX>width-160){a-=delta;b-=delta;}
  if(a>0){a=0;b=0;}
  if(a<0-editmap.height){a=0;}
}

void keyPressed(){
  if(key=='w')W=1;
  else if(key=='a')A=1;
  else if(key=='s')S=1;
  else if(key=='d')D=1;
  else if(keyCode==CONTROL)C=1;
}
void keyReleased(){
  if(key=='w')W=0;
  else if(key=='a')A=0;
  else if(key=='s')S=0;
  else if(key=='d')D=0;
  else if(keyCode==CONTROL)C=0;
}




