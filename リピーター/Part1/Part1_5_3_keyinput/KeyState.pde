

class KeyState{
  int up;
  int down;
  int left;
  int right;
  
  KeyState(){
    up = 0;
    down = 0;
    left = 0;
    right = 0;
  }
  
  void pressed(){
    if(key==CODED){
      if(keyCode==UP) up = 1;
      else if(keyCode==DOWN) down = 1;
      else if(keyCode==LEFT) left = 1;
      else if(keyCode==RIGHT) right = 1;
    }
  }
  
  void released(){
    if(key==CODED){
      if(keyCode==UP) up = 0;
      else if(keyCode==DOWN) down = 0;
      else if(keyCode==LEFT) left = 0;
      else if(keyCode==RIGHT) right = 0;
    }
  }
}


