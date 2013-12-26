class enemy{
  int img_id,AI_id,w_id,hp,mp,at,df;
  String name;
  weapon w;
  enemy(int id){
    img_id="3";
    AI_id="4";
    w_id="2";
    hp="200";
    mp="50";
    at="7";
    df="12";
    w=new weapon(w_id);
  }
}
