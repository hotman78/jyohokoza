class LayerSize{
  void layer(){
    JPanel panel = new JPanel();
    panel.setLayout(null);
  
    JTextField text1 = new JTextField();
    panel.add(new JLabel("numerical"));
    text1.setBounds(10, 10, 60, 30);
    panel.add(text1);
    
    JTextField text2 = new JTextField();
    panel.add(new JLabel("sssss"));
    text2.setBounds(70, 10, 60, 30);
    panel.add(text2);
    JOptionPane.showConfirmDialog(null,panel,"layersize",JOptionPane.OK_CANCEL_OPTION,JOptionPane.QUESTION_MESSAGE);
    
    String c = text1.getText();
    String d = text2.getText();
    try{
      layerSizeX =Integer.parseInt(c);layerSizeY = Integer.parseInt(d);
      }catch(NumberFormatException e){
    }
  }
}
