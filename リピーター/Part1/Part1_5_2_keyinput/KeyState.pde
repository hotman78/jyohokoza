

class KeyState{
  int up;
  int left;
  
  KeyState(){
    up = 0;
    left = 0;
  }
  
  void pressed(){
    if(key==CODED){
      if(keyCode==UP) up = 1;
      else if(keyCode==LEFT) left = 1;
    }
  }
  
  void released(){
    if(key==CODED){
      if(keyCode==UP) up = 0;
      else if(keyCode==LEFT) left = 0;
    }
  }
}


