// 台本ファイルのデータを読み込んだもの
// 管轄はdata

class TPos extends Talk{
  int x, y;
  int num;
  
  TPos(int x,int y){
    this.x = x;
    this.y = y;
    this.num = 0;
    this.text = new ArrayList<String>();
    this.name = new IntDict();
    this.img = new IntDict();
  }
  
  TPos(TData talk,int x,int y){
    this.x = x;
    this.y = y;
    this.num = 0;
    copyText(talk.text);
    copyName(talk.name);
    copyImg(talk.img);
    
  }
  
  boolean trigger(Game g){
    return (dist(x, y, g.state.player_x, g.state.player_y) < 50);
  }
  
  void update(Game g){
    if(done()){
      g.display.window.inter(text.get(num));
      num++;
    }else {
      g.display.window.disp=false;
      g.state.game_state=0;
    }
  }
  
  boolean done(){
    return (num<text.size());
  }
  
} 

class TData extends Talk{
  String id;
  ArrayList<String> text;
  IntDict name;
  IntDict img;
  
  TData(String id){
    this.id = id;
    this.text = new ArrayList<String>();
    this.name = new IntDict();
    this.img = new IntDict();
  }
  
  TData(String id,ArrayList<String> text,IntDict name,IntDict img){
    this.id = id;
    copyText(text);
    copyName(name);
    copyImg(img);
  }
  
}

class Talk{
  ArrayList<String> text;
  IntDict name;
  IntDict img;
  
  Talk(){
    this.text = new ArrayList<String>();
    this.name = new IntDict();
    this.img = new IntDict();
  }
  
  Talk(Talk talk){
    copyText(talk.text);
    copyName(talk.name);
    copyImg(talk.img);
    
  }
  
  Talk(ArrayList<String> text,IntDict name,IntDict img){
    copyText(text);
    copyName(name);
    copyImg(img);
  }
  
  void setText(String atext,int i){
    if(i<text.size())text.set(i, atext);
  }
  
  void setName(String aname,int i){
    name.set(aname,i);
  }
  
  void setImg(String aimg,int i){
    img.set(aimg,i);
  }
  
  void addText(String atext){
    text.add(atext);
  }
  
  void addName(String aname){
    name.set(aname,text.size());
  }
  
  void addImg(String aimg,int i){
    img.set(aimg,text.size());
  }
  
  void InsertText(String atext,int i){
    text.add(i, atext);
  }
  
  void copyText(ArrayList<String> text){
    text = new ArrayList<String>();
    
    for(int i=0;i<text.size();i++){
      text.add(text.get(i));
    }
    
  }
  
  void copyName(IntDict name){
    name = new IntDict();
    
    for(String k : name.keys()){
      name.set(k, name.get(k));
    }
  }
  
  void copyImg(IntDict img){
    img = new IntDict();
    
    for(String k : img.keys()){
      img.set(k, img.get(k));
    }
  }
  
}

