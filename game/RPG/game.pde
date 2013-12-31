class Game{
  Display display;
  Data data;
  State state;
  Key key_state;
  
  Game(){
    println("system log///class of display loading");
    display = new Display();
    println("system log///class of data loading");
    data = new Data();
    println("system log///class of state loading");
    state = new State(this);
    println("system log///class of key loading");
    key_state = new Key();

    // ファイルに書かれたデータを読み込む
    data.load_all(this);
    
    // 状態の初期化
    state.init(this);
    
    println("game start");
  }
  
  void update(){
    state.update(this);
    //println("game_state="+state.game_state);
    display.draw(this);

  }
  
}

