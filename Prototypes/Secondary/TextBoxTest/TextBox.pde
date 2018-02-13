import java.util.LinkedList;
class TextBox{
 int topleftx;
 int toplefty;
 int wide;
 int high;
 LinkedList<TextButton> inputs;
 TextBox(int x, int y, int w, int h, LinkedList<String> in){
  this.topleftx = x;
  this.toplefty = y;
  this.wide = w;
  this.high = h;
  this.inputs = new LinkedList<TextButton>();
  
  int currentline = y;
  float moveby = h / in.size();
  for(int i = 0; i < in.size(); i++){
   inputs.add(new TextButton(topleftx, currentline, wide, moveby, in.get(i)));
   currentline += moveby;
  }
 }
 
 void mouseUpdate(int mx, int my){
   for(TextButton t : inputs){
     if(t.isMouseHere(mx, my) == true){
       t.setClickedState(true);
     }
     else{
      t.setClickedState(false); 
     }
   }
 }
 
 
 void keyUpdate(Character c){
   for(int i = 0; i < inputs.size(); i++){
     if(inputs.get(i).isClicked == true){
      inputs.get(i).update(c); 
     }
     else{
       continue;
     }
   }
 }
 
 void display(){
  int ts = 20;
  textSize(ts);
  fill(255);
  rect(topleftx, toplefty, wide, high); 
  for(int i = 0; i < inputs.size(); i++){
    inputs.get(i).display();
  }
 }
}