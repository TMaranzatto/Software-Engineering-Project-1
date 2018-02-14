public class Drawable
{
  
  private int posX = 0;
  private int posY = 0;
  private int rotation;
  private int scale;
  private boolean done = false;
  private PShape shap = createShape(GROUP);
  
  public Drawable(){
    this.rotation = 100;
    this.scale = 100;
  }
  
  void mouseP(int x, int y){}
  void mouseD(int x, int y){}
  void mouseR(int x, int y){}
  void display(){}
  void keyT(Character c){}
  boolean isDone(){return done;}
}



class Pencil extends Drawable
{ 
  //these cause issues... we need to create these as dynamic psuper.shapes
  //this works but crashes for more than one pencil on the canvas, so... it doesn't work
  Pencil(){
    stroke(1);
  }
  void mouseP(int x, int y){
    super.posX = x;
    super.posY = y;
    super.shap.addChild(createShape(LINE, x, y, x, y));
    point(x,y);
  }
  
  void mouseD(int x, int y){
    myCanvas.cacheDisplay();
    //this is super duper laggy
    if(super.posX != 0 && super.posY != 0){
      super.shap.addChild(createShape(LINE,super.posX, super.posY, x, y));
      //println(super.super.shap.getChildCount());
      shape(super.shap);
      //line(super.prevX, super.prevY, x, y);
    }
     super.posX = x;
     super.posY = y;
  }
  
  
  void display(){
    //myCanvas.cacheDisplay();
    shape(super.shap);
    //super.shap = createShape(GROUP);
  }
  
}


class Paint extends Drawable
{
  //Scraped From: https://stackoverflow.com/questions/26604685/trying-to-make-a-paintbrush-effect-for-my-drawing-app-but-it-starts-too-thick
  //Thank you stackoverflow user v.k.!
  float max = 6;
  float thickness = 1;
  Paint(){}
  
  void mouseP(int x, int y){
    super.posX = x;
    super.posY = y;
    strokeWeight(thickness);
    point(x,y);
  }
  
  void mouseD(int x, int y){
    myCanvas.cacheDisplay();
    strokeWeight(thickness);
    if(super.posX != 0 && super.posY != 0){
      if(thickness < max){
        super.shap.addChild(createShape(LINE,super.posX, super.posY, x, y));
        shape(super.shap);
        thickness += 0.25;
      }
      else{
        super.shap.addChild(createShape(LINE,super.posX, super.posY, x, y));
        shape(super.shap);
        strokeWeight(max);
      }
    }
     super.posX = x;
     super.posY = y;
  }
  
  void mouseR(int x, int y){
    strokeWeight(1);
    thickness = 1;
  }
  
  void display(){
    //myCanvas.cacheDisplay();
    shape(super.shap);
    //super.shap = createShape(GROUP);
  }
  
}


class Line extends Drawable
{
  private int posX2;
  private int posY2;
  
  Line(){}
  
  void mouseP(int x, int y){
    stroke(myColor);
    super.posX = x;
    super.posY = y;
    point(super.posX, super.posY);
  }
  
  void mouseD(int x, int y){
    myCanvas.cacheDisplay();
    line(super.posX, super.posY, x, y);
  }
  
  void mouseR(int x, int y){
    posX2 = x;
    posY2 = y;
    super.done = true;
    myCanvas.cacheDisplay();
    line(super.posX, super.posY, posX2, posY2);
  }
  
  void display(){
    line(super.posX, super.posY, posX2, posY2);
  }
}


class Curve extends Drawable
{
  
}

class Ellipse extends Drawable
{
  float x = 0, y = 0;
  float w = 0, h = 0;
  
  Ellipse(){}
  
  void mouseP(int x1, int y1){
    super.posX = x1;
    super.posY = y1;
    //super.super.shap.addChild(createShape(ELLIPSE, x1, y1, 0, 0));
  }
  
  void mouseD(int x1, int y1){
    myCanvas.cacheDisplay();
    ellipse( super.posX, super.posY, (x1 - super.posX)* 2, (y1 - super.posY)* 2);
  }
  
  void mouseR(int x1, int y1){
    myCanvas.cacheDisplay();
    w = (x1 - super.posX) * 2;
    h = (y1 - super.posY) * 2;
    super.shap.addChild(createShape(ELLIPSE, super.posX, super.posY, w, h));
    shape(super.shap);
  }
  
  void display(){
    shape(super.shap);
  }
}

class Rect extends Drawable
{
  float x = 0, y = 0;
  float w = 0, h = 0;
  
  Rect(){}
  
  void mouseP(int x1, int y1){
    super.posX = x1;
    super.posY = y1;
  }

  void mouseD(int x1, int y1){
   myCanvas.cacheDisplay();
   rect(super.posX, super.posY, x1 - super.posX, y1 - super.posY);
  }

  void mouseR(int x1, int y1){
   myCanvas.cacheDisplay();
   w = x1 - super.posX; 
   h = y1 - super.posY;
   super.shap.addChild(createShape(RECT, super.posX, super.posY, w, h));
   shape(super.shap);
  }
  
  void display(){
    shape(super.shap);
  }

}

class Polygon extends Drawable
{
  
}

class Text extends Drawable
{
  String text = "";
  
  Text(){}
  
  void mouseP(int x, int y){
    super.done = false;
    super.posX = x;
    super.posY = y;
  }
  
  void keyT(Character c){
    myCanvas.cacheDisplay();
    fill(0);
    textSize(15);
    if(c != BACKSPACE && c != RETURN && c != ENTER){
    text += c;
  }
  else if(c == BACKSPACE && text.length() != 0){
    text = text.substring(0, text.length() - 1);
  }
  else if(c == RETURN || c == ENTER){
    super.done = true;
    text = "";
  }
  text(text, super.posX, super.posY); 
  }
  
  void display(){
    fill(0);
    text(text, super.posX, super.posY); 
  }
}