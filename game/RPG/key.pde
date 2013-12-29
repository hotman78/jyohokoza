class Key{
  int key_up, key_down, key_left, key_right, key_z, key_x, key_c;
  int key_a, key_s, key_d, key_f;
  int attack;
  int mouse_left;
  
  Key(){
    key_up = 0;
    key_down = 0;
    key_left = 0;
    key_right = 0;
    key_z = 0;
    key_x = 0;
    key_c = 0;
    key_a = 0;
    key_s = 0;
    key_d = 0;
    
    attack = 80;
    
    mouse_left = 0;
  }
  
  void timePassed(){
    if(key_up>=1) key_up++;
    if(key_down>=1) key_down++;
    if(key_right>=1) key_right++;
    if(key_left>=1) key_left++;
    if(key_z>=1) key_z++;
    if(key_x>=1) key_x++;
    if(key_c>=1) key_c++;
    if(key_a>=1) key_a++;
    if(key_s>=1) key_s++;
    if(key_d>=1) key_d++;
    if(key_f>=1) key_f++;
    if(attack>=1) attack++;
    if(mouse_left>=1) mouse_left++;
    println(attack);
    if(attack>80&&key_z>=1) attack=1;
  }
  
  void keyPressed(){
    if(key==CODED){
      if(keyCode==UP&&key_up==0) key_up = 1;
      if(keyCode==DOWN&&key_down==0) key_down = 1;
      if(keyCode==LEFT&&key_left==0) key_left = 1;
      if(keyCode==RIGHT&&key_right==0) key_right = 1;
    }else{
      if(key=='z'&&key_z==0) key_z = 1;
      if(key=='x'&&key_z==0) key_x = 1;
      if(key=='c'&&key_c==0) key_c = 1;
      if(key=='a'&&key_a==0) key_a = 1;
      if(key=='s'&&key_s==0) key_s = 1;
      if(key=='d'&&key_d==0) key_d = 1;
      if(key=='f'&&key_f==0) key_f = 1;
    }
  }
  
  void keyReleased(){
    if(key==CODED){
      if(keyCode==UP) key_up = 0;
      if(keyCode==DOWN) key_down = 0;
      if(keyCode==LEFT) key_left = 0;
      if(keyCode==RIGHT) key_right = 0;
    }else{
      if(key=='z') key_z = 0;
      if(key=='x') key_x = 0;
      if(key=='c') key_c = 0;
      if(key=='a') key_a = 0;
      if(key=='s') key_s = 0;
      if(key=='d') key_d = 0;
      if(key=='f') key_f = 0;
    }
  }
  
  void mousePressed(){
    mouse_left = 1;
  }
  
  void mouseReleased(){
    mouse_left = 0;
  }
}
