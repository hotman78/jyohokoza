size(200, 200);

for(int x=0; x<200; x+=20){
  for(int y=0; y<200; y+=20){
    if(((x/20)+(y/20))%2==0){
      fill(255, 0, 0);
    }else{
      fill(0, 0, 255);
    }
    rect(x+2, y+2, 15, 15);
  }
}

for(int i=0; i<10; i++){
  for(int j=0; j<10; j++){
    rect(i*20, j*20, 15, 15);
  }
}

/*
for(int x=0; x<255; x++){
  for(int y=0; y<255; y++){
    stroke(x, y, 255);
    point(x, y);
  }
}
*/
