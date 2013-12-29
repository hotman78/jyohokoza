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
    if(state.game_state==0&&state.player.status.hp<=0){
      if(key_state.key_x>=1){
        println("aaaaa");
        //g.data=new Data();
        data.load_all(this);
        state=new State(this);
        state.init(this);
        state.game_state=1;
      }
    }
    display.draw(this);

  }
  
}

