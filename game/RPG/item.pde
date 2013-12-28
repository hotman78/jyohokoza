// アイテムのデータを読み込んだもの
// 管轄はdata

class Item{
  
  String name;
  PImage img;
  int type;
  int id;
  int x, y;
  int value;
  int num=0;
  
  Item(String name0, PImage img0, int id0){
    name = name0;
    img = img0;
    id = id0;
  }
  
  Item copy(){
    return new Item(name, img, id);
  }
  Item copy2(){
    Item it = new Item(name, img, id);
    it.x = x;
    it.y = y;
//    it.val = 0;
    it.num = 0;
    return it;
  }
  
  void draw(Game g, int mx, int my){
    imageMode(CENTER);
    if(img==null){
      rectMode(CENTER);
      fill(0, 0, 255, 100);
      rect(0, 0, 60, 60);
    }
    else image(img, 0, 0, 60, 60);
    popMatrix();
  }
  
}
