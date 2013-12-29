class BackgroundProgram{
  void load(){
     editmap = loadImage("base.png");
   PFont font = loadFont("HGPMinchoB-20.vlw");
   addMouseWheelListener(new MouseWheelListener() { 
   public void mouseWheelMoved(MouseWheelEvent mwe){ 
     mouseWheel(mwe.getWheelRotation());
    }}); 
  }
  
}
