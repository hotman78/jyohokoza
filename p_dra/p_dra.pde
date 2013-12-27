
void setup(){
  size(bs*max(nx,ny)+2*sp, bs*max(nx,ny)+2*sp);
  
  fset();
  
}

void draw(){
  background(0);
  if(state==SRT){
    fill(255,0,0);textSize(20);textAlign(CENTER,CENTER);
    text("click to start", width/2, height/2);
    
    if(mReleased())state=SHW;
    
  }else if(state==SHW || state==DRG || state==DEL || state==FAL){
    for(int i=0;i<nx;i++){
      for(int j=0;j<ny;j++){
        stroke(255);noFill();rect(fx+i*bs,fy+j*bs,bs,bs);
        C_color(a[i][j]);
        if(a[i][j]==PINK)rect(fx+(i+(1-bxs)/2)*bs,fy+(j+(1-bxs)/2)*bs,bs*bxs,bs*bxs);
        else ellipse(fx+(i+0.5)*bs,fy+(j+0.5)*bs,bs*bls,bs*bls);
      }
    }
    
    change.draw();
    
    if(state==SHW){
      if(mReleased() && monbord() && change.size()<1){
        change = new Loc(getNX(mouseX),getNY(mouseY));
        mbt = b[getNX(mouseX)][getNY(mouseY)];
        state=DRG;
      }
    }else if(state==DRG){
      
      C_color(mbt,128);
      if(mbt==PINK)rect(mouseX-0.45*bs,mouseY-0.45*bs,bs*0.9,bs*0.9);
      else ellipse(mouseX,mouseY,bs*0.9,bs*0.9);
      
      if(monbord() && ponbord() && (getNX(pmouseX)!=getNX(mouseX) || 
      getNY(pmouseY)!=getNY(mouseY))){
        change.add(getNX(mouseX),getNY(mouseY));
      }
      if((mReleased() || !monbord()) && change.size()<1){
        mbt = UDF;
        set_wait(0);
        chk=0;
        state=DEL;
      }
    }else if(state==DEL){
      if(waited()){
      if(chk < nx*ny){
          boolean ans=b_del(chk%nx, chk/nx);
          //set_wait(10);
          for(int i=0;i<nx;i++){
            for(int j=0;j<ny;j++){
              if(b[i][j]==CHU)a[i][j]=UDF;
              b[i][j]=a[i][j];
            }
          }
          chk++;
      }else {
        chk=0;
        state=FAL;
      }
      }
    }else if(state==FAL){
      if(waited()){
        //state=SHW;
      }
    }
    
  }
  
  pMousePressed = mousePressed;
  
}



