

int N = 0;       // 現在のボールの数
int Nmax = 100;  // ボールの最大数
Ball[] bs;

void setup(){
  size(300, 300);
  bs = new Ball[Nmax];
}

void draw(){
  background(255);
  
  // 移動
  for(int i=0; i<N; i++){
    bs[i].move();
  }
  
  // 描画
  for(int i=0; i<N; i++){
    bs[i].draw(mouseX, mouseY);
  }
  
  // 1/10の確率でボールを追加する
  if(random(0, 1)<0.1 && N<Nmax){
    bs[N] = new Ball();
    N++;
  }
}

void mousePressed(){
  for(int i=0; i<N; i++){
    // もしi番目のボールにマウスが触れていたらi番目のボールを消したい
    if(bs[i].touch(mouseX, mouseY) == 1){
      // 最後尾のボールをi番目に上書きしてしまう(元のi番目は消える)
      bs[i] = bs[N-1];
      // ボールの総数を1減らす
      N--;
      // 新しいi番目についてもチェックしないといけないので
      // iから1を引いてもう一度i番目が見られるようにする
      i--;
    }
  }
}
  
