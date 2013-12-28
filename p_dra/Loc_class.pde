
class Pos {
  int x,y;
  
  Pos(int x,int y){
    this.x = x;
    this.y = y;
    
  }
  
  boolean equals(Pos pos2){
    return (this.x==pos2.x && this.y==pos2.y);
  }
  
}

class Loc {
  ArrayList<Pos> pos;
  IntList type;
  IntList times;
  
  Loc(int x1,int y1){
    pos = new ArrayList<Pos>();
    type = new IntList();
    times = new IntList();
    
    pos.add(new Pos(x1, y1));
    type.append(b[x1][y1]);
    
  }
  
  int size(){
    return times.size();
  }
  
  Pos getP(int i){
    return pos.get(i);
  }
  
  int getTP(int i){
    return type.get(i);
  }
  
  int getTM(int i){
    return times.get(i);
  }
  
  void add(int x1,int y1){
    pos.add(new Pos(x1, y1));
    type.append(b[x1][y1]);
    times.append(1);
    
    a[getP(size()).x][getP(size()).y]=UDF;
    a[getP(size()-1).x][getP(size()-1).y]=UDF;
    
    b[getP(size()).x][getP(size()).y] = getTP(0);
    b[getP(size()-1).x][getP(size()-1).y] = getTP(size());
    
  }
  
  void draw(){
    int i=0;
    while(i<size()){
      int frm = 10;
      
      float px, py;
      int ct;
      
      px = dvd(getTM(i),frm-getTM(i),getP(i+1).x,getP(i).x);
      py = dvd(getTM(i),frm-getTM(i),getP(i+1).y,getP(i).y);
      ct = getTP(i+1);
      C_color(ct);
      if(ct==PINK)rect(fx+(px+(1-bxs)/2)*bs, fy+(py+(1-bxs)/2)*bs, bs*bxs, bs*bxs);
      else ellipse(fx+(px+0.5)*bs, fy+(py+0.5)*bs, bs*bls, bs*bls);
      
      px = dvd(getTM(i),frm-getTM(i),getP(i).x,getP(i+1).x);
      py = dvd(getTM(i),frm-getTM(i),getP(i).y,getP(i+1).y);
      ct = getTP(0);
      C_color(ct);
      if(ct==PINK)rect(fx+(px+(1-bxs)/2)*bs, fy+(py+(1-bxs)/2)*bs, bs*bxs, bs*bxs);
      else ellipse(fx+(px+0.5)*bs, fy+(py+0.5)*bs, bs*bls, bs*bls);
      
      if(!(getTM(i)<frm)){
        boolean sco = true;
        for(int j=i+1;j<size();j++){
          if(getP(i).equals(getP(j))){
            sco=false;
            break;
          }
        }
        if(sco)a[getP(i).x][getP(i).y] = b[getP(i).x][getP(i).y];
        
        pos.remove(i);
        type.remove(i+1);
        times.remove(i);
        
        if(size()<1)
        a[getP(0).x][getP(0).y] = b[getP(0).x][getP(0).y];
        
      }else {
        times.add(i,1);//times.set(i,times.get(i)+1);
        i++;
      }
      
    }
  }
    
}



