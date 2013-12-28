
void fset(){
  a = new int[nx][ny];
  a_ = new int[nx][ny];
  b = new int[nx][ny];
  change = new Loc(0,0);
  
  for(int i=0;i<nx;i++){
    for(int j=0;j<ny;j++){
      a[i][j] = int(random(1,7))+1;
      a_[i][j] = int(random(1,7))+1;
      b[i][j] = a[i][j];
    }
  }
  
  fx=sp+bs*(max(nx,ny)-nx);
  fy=sp+bs*(max(nx,ny)-ny);
  
  state=SRT;
  
  pMousePressed=false;
  wframe=0;wtime=0;
  
  mbt = UDF;
  
  chk=0;
  
}

void C_color(int type){
  C_color(type,255);
}

void C_color(int type,int alp){
  noStroke();
  switch(type){
    case UDF:noFill();break;
    case RED:fill(255,0,0,alp);break;
    case GREEN:fill(0,255,0,alp);break;
    case BLUE:fill(0,0,255,alp);break;
    case YELLOW:fill(255,255,0,alp);break;
    case PURPLE:fill(128,0,255,alp);break;
    case PINK:fill(255,0,255,alp);break;
  }
}



int getNX(float px){
  float val = (px-fx)/bs;
  val = (val<0 ? val-1: val);
  return int(val);
}

int getNY(float py){
  float val = (py-fy)/bs;
  val = (val<0 ? val-1: val);
  return int(val);
}

boolean ponbord(){
  return onbord(getNX(pmouseX),getNY(pmouseY));
}

boolean monbord(){
  return onbord(getNX(mouseX),getNY(mouseY));
}

boolean onbord(int px,int py){
  return (inside(0,nx,px) && inside(0,ny,py));
}

boolean inside(int miv,int mav,int val){
  return ((miv<=val) && val<mav);
}



int va(int i,int j){
  return (onbord(i,j) ? a[i][j] : UDF);
}

int vb(int i,int j){
  return (onbord(i,j) ? b[i][j] : UDF);
}

boolean b_del(int i,int j){
  if(va(i,j)==UDF || vb(i,j)==CHK || vb(i,j)==CHU)return false;
  
  boolean ret=false;
  
  if(vb(i,j)==UDF)b[i][j]=CHU;
  else b[i][j]=CHK;
  
  if(va(i,j)==va(i-1,j) && va(i,j)==va(i+1,j)){
    b[i][j]=CHU;
    
    if(vb(i-1,j)==CHU){
    }else if(vb(i-1,j)==CHK)b[i-1][j]=CHU;
    else b[i-1][j]=UDF;
    
    if(vb(i+1,j)==CHU){
    }else if(vb(i+1,j)==CHK)b[i+1][j]=CHU;
    else b[i+1][j]=UDF;
    
    ret=true;
  }
  
  if(va(i,j)==va(i,j-1) && va(i,j)==va(i,j+1)){
    b[i][j]=CHU;
    
    if(vb(i,j-1)==CHU){
    }else if(vb(i,j-1)==CHK)b[i][j-1]=CHU;
    else b[i][j-1]=UDF;
    
    if(vb(i,j+1)==CHU){
    }else if(vb(i,j+1)==CHK)b[i][j+1]=CHU;
    else b[i][j+1]=UDF;
    
    ret=true;
  }
  
  if(va(i,j)==va(i-1,j))ret=(b_del(i-1,j)?true:ret);
  if(va(i,j)==va(i+1,j))ret=(b_del(i+1,j)?true:ret);
  if(va(i,j)==va(i,j-1))ret=(b_del(i,j-1)?true:ret);
  if(va(i,j)==va(i,j+1))ret=(b_del(i,j+1)?true:ret);
  
  return ret;
  
}



boolean mPushed(){
  return (!pMousePressed && mousePressed);
}

boolean mDraged(){
  return (pMousePressed && mousePressed);
}

boolean mReleased(){
  return (pMousePressed && !mousePressed);
}

void set_time(){
  wframe=frameCount;
}

void set_wtime(int times){
  wtime=times;
}

void set_wait(int times){
  set_time();
  set_wtime(times);
}

boolean waited(){
  return (frameCount>wframe+wtime);
}

int get_time(){
  return (frameCount-wframe);
}




float dvd(int n,int m,int p1,int p2){
  return (float(m*p1+n*p2)/(n+m));
}



