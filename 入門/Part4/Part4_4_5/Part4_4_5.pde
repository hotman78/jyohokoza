float[] a;
a = new float[100];

for(int i=0; i<100; i++){
  a[i] = random(0, 100);
}

for(int i=99; i>=0; i--){
  for(int j=0; j<i; j++){
    if(a[j] > a[j+1]){
      float tmp = a[j];
      a[j] = a[j+1];
      a[j+1] = tmp;
    }
  }
}

for(int i=0; i<100; i++){
  println(a[i]);
}



