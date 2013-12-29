class MapLayer{
 Layer1 layer1;
 Layer2 layer2;
 Layer3 layer3;
 Saveray saveray;
 Frag frag;
  MapLayer(){
    layer1 = new Layer1();
    layer2 = new Layer2();
    layer3 = new Layer3();
    saveray = new Saveray();
    frag = new Frag();
  }
  class Layer1{
      void edit(){
       fill(255);
       rect(0,79,546,402);
       image(rayer1.get(hidariX,hidariY,544,400),0,80);
       fill(255);
       image(editmap,width-160,a*16);
       fill(0,204,255,100);
       rect(mousex-mousex%16,mousey-mousey%16+b*16,16,16);
       if(mouseDrag==1){
         rayer1.loadPixels();
         copy.loadPixels();
         if(mouseX<width-160){
           int x=mouseX/16*16;
           int y=mouseY/16*16;
            for(int i=0;i<16;i++){
              for(int j=0;j<16;j++){
                if((layerSizeX*16>y+j-80+hidariY)&&(0<y+j-80+hidariY)&&(layerSizeY*16>x+i+hidariX)&&(0<x+i+hidariX)){
                  rayer1.pixels[(y+j-80+hidariY)*rayer1.width+(x+i+hidariX)]=copy.pixels[j*copy.width+i];
                }
              }
            }
          rayer1.updatePixels();
        }
        if((mouseX<350)&&(mouseX>320)&&(mouseY>50)&&(mouseY<70)){
          rayer1.loadPixels();
          copy.loadPixels();
          for(int i=0;i<layerSizeX;i++){
            for(int j=0;j<layerSizeY;j++){
              for(int k=0;k<16;k++){
                for(int l=0;l<16;l++){
                  rayer1.pixels[(j*16+l)*rayer1.width+(i*16+k)]=copy.pixels[l*copy.width+k];
                }
              }
            }
          }
          rayer1.updatePixels();
        }
      }
    }
  }
  class Layer2{
      void edit(){
        
       fill(255);
       rect(0,79,546,402);
       image(rayer1.get(hidariX,hidariY,544,400),0,80);
       image(rayer2.get(hidariX,hidariY,544,400),0,80);
       
       fill(255);
       image(editmap,width-160,a*16);
       fill(0,204,255,100);
       rect(mousex-mousex%16,mousey-mousey%16+b*16,16,16);
       
       if(mouseDrag==1){
         rayer2.loadPixels();
         copy.loadPixels();
         if(mouseX<width-160){
           int x=mouseX/16*16;
           int y=mouseY/16*16;
            for(int i=0;i<16;i++){
              for(int j=0;j<16;j++){
                if((layerSizeX*16>y+j-80+hidariY)&&(0<y+j-80+hidariY)&&(layerSizeY*16>x+i+hidariX)&&(0<x+i+hidariX)){
                  rayer2.pixels[(y+j-80+hidariY)*rayer2.width+(x+i+hidariX)]=copy.pixels[j*copy.width+i];
                }
              }
            }
          rayer2.updatePixels();
        }
        if((mouseX<350)&&(mouseX>320)&&(mouseY>50)&&(mouseY<70)){
          rayer2.loadPixels();
          copy.loadPixels();
          for(int i=0;i<layerSizeX;i++){
            for(int j=0;j<layerSizeY;j++){
              for(int k=0;k<16;k++){
                for(int l=0;l<16;l++){
                  rayer2.pixels[(j*16+l)*rayer2.width+(i*16+k)]=copy.pixels[l*copy.width+k];
                }
              }
            }
          }
          rayer2.updatePixels();
        }
      }
    }
  }
  class Layer3{
      void edit(){
        
       fill(255);
       rect(0,79,546,402);
       image(rayer1.get(hidariX,hidariY,544,400),0,80);
       image(rayer2.get(hidariX,hidariY,544,400),0,80);
       image(rayer3.get(hidariX,hidariY,544,400),0,80);
       
       fill(255);
       image(editmap,width-160,a*16);
       fill(0,204,255,100);
       rect(mousex-mousex%16,mousey-mousey%16+b*16,16,16);
       
       if(mouseDrag==1){
         rayer3.loadPixels();
         copy.loadPixels();
         if(mouseX<width-160){
           int x=mouseX/16*16;
           int y=mouseY/16*16;
            for(int i=0;i<16;i++){
              for(int j=0;j<16;j++){
                if((layerSizeX*16>y+j-80+hidariY)&&(0<y+j-80+hidariY)&&(layerSizeY*16>x+i+hidariX)&&(0<x+i+hidariX)){
                  rayer3.pixels[(y+j-80+hidariY)*rayer3.width+(x+i+hidariX)]=copy.pixels[j*copy.width+i];
                }
              }
            }
          rayer3.updatePixels();
        }
        if((mouseX<350)&&(mouseX>320)&&(mouseY>50)&&(mouseY<70)){
          rayer3.loadPixels();
          copy.loadPixels();
          for(int i=0;i<layerSizeX;i++){
            for(int j=0;j<layerSizeY;j++){
              for(int k=0;k<16;k++){
                for(int l=0;l<16;l++){
                  rayer3.pixels[(j*16+l)*rayer3.width+(i*16+k)]=copy.pixels[l*copy.width+k];
                }
              }
            }
          }
          rayer3.updatePixels();
        }
      }
    }
  }
    class Frag{
      void edit(){
        
       fill(255);
       rect(0,79,546,402);
       image(rayer1.get(hidariX,hidariY,544,400),0,80);
       image(rayer2.get(hidariX,hidariY,544,400),0,80);
       image(rayer3.get(hidariX,hidariY,544,400),0,80);
       image(fragw.get(hidariX,hidariY,544,400),0,80);
       
       fill(255);
       image(editmap,width-160,a*16);
       fill(0,204,255,100);
       rect(mousex-mousex%16,mousey-mousey%16+b*16,16,16);
       
       if(mouseDrag==1){
         fragw.loadPixels();
         copy.loadPixels();
         if(mouseX<width-160){
           int x=mouseX/16*16;
           int y=mouseY/16*16;
            for(int i=0;i<16;i++){
              for(int j=0;j<16;j++){
                if((layerSizeX*16>y+j-80+hidariY)&&(0<y+j-80+hidariY)&&(layerSizeY*16>x+i+hidariX)&&(0<x+i+hidariX)){
                  fragw.pixels[(y+j-80+hidariY)*fragw.width+(x+i+hidariX)]=copy.pixels[j*copy.width+i];
                  if(paint<=8){
                    fragww.pixels[(y+j-80+hidariY)*fragww.width+(x+i+hidariX)]=color(0);
                  }
                  if(paint>8){
                    fragww.pixels[(y+j-80+hidariY)*fragww.width+(x+i+hidariX)]=color(255);
                  }
                  
                }
              }
           }
        }
    }
  }
}




  class Saveray{
    void Save(){
      rayer.loadPixels();
      rayer1.loadPixels();
      rayer2.loadPixels();
      rayer3.loadPixels();
      fragw.loadPixels();
      for(int i=0;i<layerSizeX*16;i++){
        for(int j=0;j<layerSizeY*16;j++){
          color cl1=rayer1.pixels[j*rayer1.width+i];
          color cl2=rayer2.pixels[j*rayer2.width+i];
          color cl3=rayer3.pixels[j*rayer3.width+i];
          color clf=fragw.pixels[j*fragw.width+i];
        if(alpha(cl1)==255){
          rayer.pixels[j*rayer.width+i]=rayer1.pixels[j*rayer1.width+i];
        }
        if(alpha(cl2)==255){
          rayer.pixels[j*rayer.width+i]=rayer2.pixels[j*rayer2.width+i];
        }
        if(alpha(cl3)==255){
          rayer.pixels[j*rayer.width+i]=rayer3.pixels[j*rayer3.width+i];
        }
    }
  }
    rayer.save("rayer.png");
    fragww.save("mask.png");
    fragw.save("mask.png");
}
  }
  }
