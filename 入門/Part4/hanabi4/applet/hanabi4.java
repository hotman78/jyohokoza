import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class hanabi4 extends PApplet {

float[] x = new float[10000];
float[] y = new float[10000];
float[] vx = new float[10000];
float[] vy = new float[10000];
float[] h = new float[10000];
float[] b = new float[10000];
int N = 0;

public void setup(){
  smooth();
  size(500, 500);
  colorMode(HSB, 100, 100, 100);
  fill(0, 0, 0);  //\u767d
  rect(-1, -1, 501, 501);  //\u753b\u9762\u5168\u4f53\u3092\u767d\u3044\u56db\u89d2\u5f62\u3067\u8986\u3046
}

public void draw(){
  fill(0, 0, 0, 20);  //\u767d
  rect(-1, -1, 501, 501);  //\u753b\u9762\u5168\u4f53\u3092\u767d\u3044\u56db\u89d2\u5f62\u3067\u8986\u3063\u3066\u6b8b\u50cf\u3092\u6d88\u3059
  
  for(int i=0; i<N; i++){  //\u5909\u6570i\u30920\u304b\u308999\u307e\u3067\u52d5\u304b\u3059
    fill(h[i], 100, b[i]);
    noStroke();
    ellipse(x[i], y[i], 2, 2);  //i\u756a\u76ee\u306e\u25cb\u3092\u63cf\u304f
    x[i] += vx[i];
    y[i] += vy[i];
    vy[i] += 0.02f;
    vx[i] *= 0.97f;
    vy[i] *= 0.97f;
    b[i] -= 1;
  }
}

public void mousePressed(){
  float hu = random(0, 100);
  for(int i=0; i<100; i++){
    x[N] = mouseX;
    y[N] = mouseY;
    float v = random(0.0f, 4.0f);
    float th = random(0, 2*PI);
    vx[N] = v*sin(th);
    vy[N] = v*cos(th);
    h[N] = hu;
    b[N] = 150;
    N++;
  }
}



  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#D4D0C8", "hanabi4" });
  }
}
