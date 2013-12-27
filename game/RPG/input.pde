
class Input {
  IntDict keys; //examle:up down left right z x c etc...
  int rls;//キーが押されてない状態(-1フレーム目)、外にだしてもいい
  int mouse_pt;//マウス用
  
  Input(){
    
    keys = new IntDict();
    rls = -1;
    
    mouse_pt = rls;
    
  }
  
  void keyPressed(){//キーが押された時の処理
    int subs = frameCount;
    if(key==CODED){
      switch(keyCode){
        case UP:keys.set("up",subs);break;
        case DOWN:keys.set("down",subs);break;
        case LEFT:keys.set("left",subs);break;
        case RIGHT:keys.set("right",subs);break;
      }
    }else {
      keys.set(""+key,subs);
    }
  }
  
  void keyReleased(){//キーが離された時の処理
    int subs = rls;
    if(key==CODED){
      switch(keyCode){
        case UP:keys.set("up",subs);break;
        case DOWN:keys.set("down",subs);break;
        case LEFT:keys.set("left",subs);break;
        case RIGHT:keys.set("right",subs);break;
      }
    }else {
      keys.set(""+key,subs);
    }
  }
  
  boolean Pressed(String str){//特定のキーが押されてるか
    return (keys.hasKey(str)?(keys.get(str)>rls):false);
  }
  boolean Pressed(char chr){//引数がcharの時用。
    return (Pressed(""+chr));
  }
  
  int get(String str){//特定のキーが押され始めてから何フレーム目か、離れてるときは-1
    return (keys.hasKey(str)&&keys.get(str)>rls?frameCount-keys.get(str):rls);
  }
  int get(char chr){//char用
    return (get(""+chr));
  }
  
  void mousePressed(){//マウス(のボタン)が押された時の処理
    mouse_pt=frameCount;
  }
  void mouseReleased(){//マウスが離された時の処理
    mouse_pt=rls;
  }
  
  boolean mPressed(){//マウスが押されてるか
    return mouse_pt>rls;
  }
  int getMouse(){//マウスが押され始めて何フレーム目か
    return (mouse_pt>rls?frameCount-mouse_pt:rls);
  }
  
}

