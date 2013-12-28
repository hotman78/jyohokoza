// アイテムのデータを読み込んだもの
// 管轄はdata

class Item{
  
  String name;
  PImage img;
  int type;
  int id;
  int x, y;
  
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
    return it;
  }
  
  void draw(Game g, int mx, int my){
    imageMode(CENTER);
    image(img, x+mx, y+my, 60, 60);
  }
  
}
