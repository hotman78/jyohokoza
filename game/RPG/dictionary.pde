class Dict_item{
  int cursor;
  int N;
  
  Dict_item(Game g){
    cursor = 0;
    N = g.data.N_items + g.data.N_weapons;
  }
  
  void switch_next(){
    if(cursor<N-1) cursor++;
  }
  
  void switch_prev(){
    if(cursor>0) cursor--;
  }
  
  void display(Game g){
    fill(200, 0, 0, 100);
    stroke(0);
    rectMode(CORNER);
    rect(30, 30, width-60, height-60);
    for(int i=0; i<N; i++){
//      println("item: "+i);
      if(i==cursor) fill(255, 0, 0);
      else fill(50);
      textFont(g.data.kishimoto);
      textSize(15);
      text(g.data.items[i].name, 60, i*20+60);
    }
    textSize(25);
    text(g.data.items[cursor].name, width/2, 60);
    imageMode(CORNER);
    if(g.data.items[cursor].img==null) rect(250, 150, 200, 200);
    else image(g.data.items[cursor].img, 250, 150, 200, 200);
    fill(255);
    rect(30, height-100, width-60, 70);
    fill(0);
    textSize(15);
    text("アイテム説明的な", 40, height-60);
    if(g.data.items[cursor].type==0) text("type: 回復", 250, 360);
    if(g.data.items[cursor].type==1) text("type: 投擲", 250, 360);
    if(g.data.items[cursor].type==2) text("type: 武器", 250, 360);
    text("at  df  cr  hp  mp mhp mmp", 250, 380);
    text(g.data.items[cursor].status.at + " " + 
         g.data.items[cursor].status.df + " " + 
         g.data.items[cursor].status.cr + " " + 
         g.data.items[cursor].status.hp + " " + 
         g.data.items[cursor].status.mp + " " + 
         g.data.items[cursor].status.maxhp + " " + 
         g.data.items[cursor].status.maxmp + " "
    , 250, 400);
  }
  
}

class Dict_enemy{
  int cursor;
  int N;
  
  Dict_enemy(Game g){
    cursor = 0;
    N = g.data.N_enemies;
  }
  
  void switch_next(){
    if(cursor<N-1) cursor++;
  }
  
  void switch_prev(){
    if(cursor>0) cursor--;
  }
  
  void display(Game g){
    fill(0, 200, 0, 100);
    stroke(0);
    rectMode(CORNER);
    rect(30, 30, width-60, height-60);
    for(int i=0; i<N; i++){
//      println("item: "+i);
      if(i==cursor) fill(255, 0, 0);
      else fill(50);
      textFont(g.data.kishimoto);
      textSize(15);
      text(g.data.o_enemies[i].name, 60, i*20+60);
    }
    textSize(25);
    text(g.data.o_enemies[cursor].name, width/2, 60);
    imageMode(CORNER);
    if(g.data.o_enemies[cursor].img==null) rect(250, 150, 200, 200);
    else image(g.data.o_enemies[cursor].img, 250, 150, 200, 200);
    fill(255);
    rect(30, height-100, width-60, 70);
    fill(0);
    textSize(15);
    text(g.data.o_enemies[cursor].text, 40, height-60);
    text("hp: "+g.data.o_enemies[cursor].hp+"  mp: "+g.data.o_enemies[cursor].mp+"  at: "+g.data.o_enemies[cursor].at+"  df: "+g.data.o_enemies[cursor].df, 40, height-40);
  }
}

class Dict_character{
  int cursor;
  int N = 6;
  String[] names = {"ビアンカ", "ナターシャ×ビアンカ", "やるお", "サタン", "キリスト?", "使徒?"};
  String[] files = {"BIANCA.png", "players.jpg", "front.png", "satan2.jpeg", "kirisuto.jpeg", "tenshi2.jpeg"};
  
  PImage img;
  
  Dict_character(){
    cursor = 0;
    img = loadImage("./data/image/characters/"+files[0]);
  }
  
  void switch_next(){
    if(cursor<N-1) cursor++;
    img = loadImage("./data/image/characters/"+files[cursor]);
  }
  
  void switch_prev(){
    if(cursor>0) cursor--;
    img = loadImage("./data/image/characters/"+files[cursor]);
  }
  
  void display(Game g){
    fill(0, 0, 200, 100);
    stroke(0);
    rectMode(CORNER);
    rect(30, 30, width-60, height-60);
    for(int i=0; i<N; i++){
      if(i==cursor) fill(255, 0, 0);
      else fill(50);
      textFont(g.data.kishimoto);
      textSize(15);
      text(names[i], 60, i*20+60);
    }
    imageMode(CORNER);
    image(img, 200, 50, 400, 400);
    fill(255);
    rect(30, height-100, width-60, 70);
    fill(0);
    text("キャラクター説明的な", 40, height-60);
  }
}
