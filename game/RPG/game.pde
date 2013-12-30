class Game{
  Display display;
  Data data;
  State state;
  Key key_state;
  
  Game(){
    display = new Display();
    data = new Data();
    state = new State(this);
    key_state = new Key();

    // ファイルに書かれたデータを読み込む
    data.load_all(this);
    
    // 状態の初期化
    state.init(this);
    display.window.disp = true;
    
  }
  
  void update(){
    state.update(this);
    //println("game_state="+state.game_state);
    display.draw(this);

  }
  
}

