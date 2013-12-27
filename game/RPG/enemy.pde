// ファイルから読み込んだ敵に関するデータ
// dataで管理

class Enemy{
  int img_id,AI_id,w_id,hp,mp,at,df;
  String name;
  Weapon w;
  
  Enemy(int id){
    img_id=3;
    AI_id=4;
    w_id=2;
    hp=200;
    mp=50;
    at=7;
    df=12;
    w=new Weapon(w_id);
  }
  
  void load_file(){
    
  }
  
}
