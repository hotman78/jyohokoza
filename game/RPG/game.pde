class Game{
  Display display;
  State state;
  Key key_state;
  Data data;
  
  Game(){
    display = new Display();
    state = new State();
    event = new Event();
    data = new Data();

    // ファイルに書かれたデータを読み込む
    data.load_all();
    
    // 状態の初期化
    state.init(this);
    
  }
  
  void update(){
    state.update(this);
    display.draw(this);
  }
  
}

