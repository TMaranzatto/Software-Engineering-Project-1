//main parent class
class Drawable
{
  private int posX;
  private int posY;
  private int centerPoint;
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
}

//individual types of classes
class Pencil extends Drawable
{}

class Paint extends Drawable
{}

class Line extends Drawable
{
  private int posX2;
  private int posY2;
  
  Line(){}
  void mouseP(int x, int y){
    println("Line mouseP");
    super.posX = x;
    super.posY = y;
  }
  void mouseD(int x, int y){
    println("Line mouseD");
    background(255);
    myUI.display();
    myCanvas.display();
    line(super.posX, super.posY, x, y);
  }
  void mouseR(int x, int y){
    println("Line mouseR");
    posX2 = x;
    posY2 = y;
    background(255);
    myUI.display();
    myCanvas.display();
    line(super.posX, super.posY, posX2, posY2);
  }
  void display(){
    line(super.posX, super.posY, posX2, posY2);
  }
}

class Curve extends Drawable
{}

class Ellipse extends Drawable
{}

class Rectangle extends Drawable
{}

class Polygon extends Drawable
{}

class Text extends Drawable
{}