class TextButton{
 int x;
 int y;
 int wid;
 float hei;
 String buttonText;
 String inputText;
 boolean isClicked;
 float textWidth;
 TextButton(int x, int y, int w, float h, String t){
  this.x = x;
  this.y = y;
  this.wid = w;
  this.hei = h;
  this.buttonText = t;
  this.inputText = "";
  this.textWidth = textWidth(buttonText);
 }
 
 void setClickedState(boolean s){
   this.isClicked = s;
 }
 
 boolean isMouseHere(int inx, int iny){
  if(inx > x && inx < x + wid){
   if(iny > y && iny < y + hei){
      return true; 
   }
  }
  return false;
 }
 void update(Character k){
   if(this.isClicked == true){
     if(k != BACKSPACE){
       inputText += k;
     }
     else if(inputText != null){
      inputText = inputText.substring(0, inputText.length() - 1);
     }
   }
 }
 
 void display(){
  textSize(hei - 3);
  fill(255);
  noStroke();
  rect(x,y, wid, hei);
  fill(0);
  text(buttonText + ": " + inputText, x + 2, y + hei);
 }
   
   
   
   
}