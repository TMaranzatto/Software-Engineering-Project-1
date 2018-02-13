class TextBox{
 Point topLeft;
 int wide;
 int high;
 Drawable currentShape;
 
 TextBox(Point xy, int w, int h){
  this.topLeft = xy; 
  this.wide = w;
  this.high = h;
 }
 
 void updateShape(Drawable Shape){
  this.currentShape = Shape; 
 }
 
 void update(){
   
 }
 
 void display(){
   
 }
 

}