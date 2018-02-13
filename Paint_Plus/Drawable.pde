//main parent class
class Drawable
{
  
  private int posX;
  private int posY;
  private int prevX, prevY;
  PShape shap = createShape(GROUP);
  
  private int[] centerPoint;
  private int rotation;
  private int scale;
  
  Drawable(){
    rotation = 100;
    scale = 100;
  }
  
  void mouseP(int x, int y){}
  void mouseD(int x, int y){}
  void mouseR(int x, int y){}
  void display(){}
  void keyT(Character c){}
}

//individual types of classes

class Curve extends Drawable
{
  //difficult as we go through mouseP mouseD and mouseR twice.  how to tell the difference?
}

class Polygon extends Drawable
{
  //similar issue here...
}


class Pencil extends Drawable
{ 
  //these cause issues... we need to create these as dynamic pshapes
  Pencil(){}
  
  void mouseP(int x, int y){
    super.posX = x;
    super.posY = y;
    shap.addChild(createShape(LINE,x,y,x,y));
    point(x,y);
  }
  
  void mouseD(int x, int y){
    myCanvas.display();
    if(super.prevX != 0 && super.prevY != 0){
      shap.addChild(createShape(LINE,super.prevX, super.prevY, x, y));
      line(super.prevX, super.prevY, x, y);
    }
     super.prevX = x;
     super.prevY = y;
  }
  
  //display wont do much for us here..
  
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
    myCanvas.display();
    strokeWeight(thickness);
    if(super.prevX != 0 && super.prevY != 0){
      if(thickness < max){
        line(super.prevX, super.prevY, x, y);
        thickness += 0.25;
      }
      else{
        line(super.prevX, super.prevY, x, y);
        strokeWeight(max);
      }
    }
     super.prevX = x;
     super.prevY = y;
  }
  
  void mouseR(int x, int y){
   myCanvas.display();
   thickness = 1; 
  }
}

class Line extends Drawable
{
  private int posX2;
  private int posY2;
  
  Line(){}
  void mouseP(int x, int y){
    super.posX = x;
    super.posY = y;
  }
  void mouseD(int x, int y){
    myCanvas.display();
    line(super.posX, super.posY, x, y);
  }
  void mouseR(int x, int y){
    posX2 = x;
    posY2 = y;
    myCanvas.display();
    line(super.posX, super.posY, posX2, posY2);
  }
  void display(){
    line(super.posX, super.posY, posX2, posY2);
  }
}

class Ellipse extends Drawable
{
  float x = 0, y = 0;
  float w = 0, h = 0;
  
  Ellipse(){}
  
  void mouseP(int x1, int y1){
    super.posX = x1;
    super.posY = y1;
  }
  
  void mouseD(int x1, int y1){
    myCanvas.display();
    ellipse(super.posX, super.posY, (x1 - super.posX)*2, (y1 - super.posY) * 2);
  }
  
  void mouseR(int x1, int y1){
    myCanvas.display();
    w = (x1 - super.posX) * 2;
    h = (y1 - super.posY) * 2;
    ellipse(super.posX, super.posY, w, h);
  }
  
  void display(){
    ellipse(super.posX, super.posY, w, h);
  }
}

class Rectangle extends Drawable
{
  float x = 0, y = 0;
  float w = 0, h = 0;
  Rectangle(){}
  
  void mouseP(int x1, int y1){
    super.posX = x1;
    super.posY = y1;
  }

  void mouseD(int x1, int y1){
   myCanvas.display();
   rect(super.posX, super.posY, x1 - super.posX, y1 - super.posY);
  }

  void mouseR(int x1, int y1){
   myCanvas.display();
   w = x1 - super.posX; 
   h = y1 - super.posY;
   rect(super.posX, super.posY, w, h);
  }
  
  void display(){
    rect(super.posX, super.posY, w, h);
  }

}

class Text extends Drawable
{
  String text = "";
  
  Text(){}
  
  void mouseP(int x, int y){
    print(x);
    super.posX = x;
    super.posY = y;
  }
  
  void keyT(Character c){
    myCanvas.display();
    fill(0);
    textSize(15);
    if(c != BACKSPACE){
    text += c;
  }
  else if(c == BACKSPACE && text.length() != 0){
    text = text.substring(0, text.length() - 1);
  }
  text(text, super.posX, super.posY); 
  }
  
  void display(){
    fill(0);
    text(text, super.posX, super.posY); 
  }
}