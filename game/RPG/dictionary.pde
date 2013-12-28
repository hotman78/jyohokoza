class Dict_weapon{
  int cursor;
  
  Dict_weapon(){
    cursor = 0;
  }
}

class Dict_item{
  int cursor;
  
  Dict_item(){
    cursor = 0;
  }
  
}

class Dict_enemy{
  int cursor;
  
  Dict_enemy(){
    cursor = 0;
  }
}

class Dict_character{
  int cursor;
  int N = 6;
  String[] names = {"ビアンカ", "ナターシャ×ビアンカ", "やるお", "サタン", "キリスト?", "使徒?"};
  String[] files = {"BIANCA_n.png", "players.fpg", "front.png", "satan2.jpeg", "tenshi2.jpeg"};
  
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
    fill(200, 200, 200, 200);
    stroke(0);
    rect(30, 30, width-60, height-60);
    for(int i=0; i<N; i++){
      if(i==cursor) fill(255, 0, 0);
      else fill(50);
      textFont(g.data.kishimoto);
      textSize(25);
      text(names[i], i*30+60, 60);
    }
    image(img, 100, 50);
    fill(255);
    rect(30, height-100, width-60, 70);
    text("キャラクター説明的な", 40, height-60);
  }
}
