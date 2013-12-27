// イベントデータ
// mapに附属

class Event{
  int x;
  int y;
  int type; // 0: trans
  int id;   //
  
  Event(int x0, int y0, int type0, int id0){
    x = x0;
    y = y0;
    type = type0;
    id = id0;
  }
  
  int trigger(Game g){
    if(dist(x, y, g.state.player_x, g.state.player_y) < 50){
      return 1;
    }
    return 0;
  }
  
}
