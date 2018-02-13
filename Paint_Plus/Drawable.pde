//main parent class
class Drawable
{
  private int posX;
  private int posY;
  private int centerPoint;
  private int rotation;
  private int scale;
  
  Drawable(){}
}

//individual types of classes
class Pencil extends Drawable
{}

class Paint extends Drawable
{}

class Line extends Drawable
{}

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