// ファイルから読み込んだ敵に関するデータ
// dataで管理

class Enemy{
  int x,y;
  int img_id,AI_id,w_id,hp,mp,at,df;
  String name;
  Weapon w;
  Enemy(String _name,int _img_id,int _AI_id,int _w_id, int _hp, int _mp, int _at, int _df){
    name = _name;
    img_id = _img_id;
    AI_id = _AI_id;
    w_id = _w_id;
    hp = _hp;
    mp = _mp;
    at = _at;
    df = _df;
  }
  
  void load_file(int id){

    
  }
  
}
