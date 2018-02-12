import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Experiment extends PApplet {

Drawable[] shapes = {
  new Circle(new Point(-300, 0), 50),
  new Circle(new Point(-150, 0), 50),
  new Circle(new Point(0, 0), 50),
  new Circle(new Point(150, 0), 50),
  new Circle(new Point(300, 0), 50)
};

Pan pan;

Point initialPoint = new Point(0, 0);
Point movedPoint = new Point(0, 0);

public void setup()
{
  
  background(255);

  pan = new Pan(
    new Point(width / 2, height / 2),
    400,
    400,
    shapes
  );

  pan.display();
}

public void draw()
{}

public void mousePressed()
{
  initialPoint.setX(mouseX);
  initialPoint.setY(mouseY);
}

public void mouseDragged() {
  movedPoint.setX(mouseX);
  movedPoint.setY(mouseY);

  pan.update(initialPoint, movedPoint);
  pan.display();

  initialPoint.setX(movedPoint.getX());
  initialPoint.setY(movedPoint.getY());
}
class Box {
  private Point topLeft;
  private Point bottomRight;

  Box(Point tl, Point br) {
    topLeft = tl;
    bottomRight = br;
  }

  public boolean intersect(Box other) {
    boolean xSat = abs(this.getX() - other.getX()) < (this.getWidth() + other.getWidth());
    boolean ySat = abs(this.getY() - other.getY()) < (this.getHeight() + other.getHeight());

    return xSat && ySat;
  }

  public float getWidth() {
    return bottomRight.getX() - topLeft.getX();
  }

  public float getHeight() {
    return bottomRight.getY() - topLeft.getY();
  }

  public float getX() {
    return topLeft.getX();
  }

  public float getY() {
    return topLeft.getY();
  }
}
class Circle implements Drawable {
  private Point center;
  private float radius;
  private Box box;

  Circle(Point c, float r) {
    center = c;
    radius = r;

    box = new Box(
      new Point(c.getX() - radius, c.getY() + radius),
      new Point(c.getX() + radius, c.getY() - radius)
    );
  }

  public Box getBox() {
    return box;
  }

  public void display(Pan pan) {
    Point actual = pan.convertLocalToActual(center);
    ellipse(actual.getX(), actual.getY(), radius * 2, radius * 2);
  }
}
interface Drawable {
  public Box getBox();
  public void display(Pan pan);
}
class Pan {
  private Point posCenter;
  private float panWidth;
  private float panHeight;
  private Drawable[] shapes;
  private Box localBox;
  private float localHeight;
  private float localWidth;
  private Point localCenter;
  private float sensitivity;

  Pan(Point c, float w, float h, Drawable[] shapes) {
    posCenter = c;
    panWidth = w;
    panHeight = h;
    this.shapes = shapes;

    localWidth = w;
    localHeight = h;
    localCenter = new Point(0, 0);

    localBox = new Box(
      new Point(-w, h),
      new Point(w, -h)
    );

    sensitivity = 1;
  }

  public Point convertActualToLocal(Point point) {
    return new Point(0, 0);
  }

  public Point convertLocalToActual(Point point) {
    float xDiff = point.getX() - localCenter.getX();
    float yDiff = point.getY() - localCenter.getY();

    return new Point(posCenter.getX() + xDiff, posCenter.getY() + yDiff);
  }

  public Box getBox() {
    return localBox;
  }

  public void update(Point initial, Point current) {
    float xDiff = initial.getX() - current.getX();
    float yDiff = initial.getY() - current.getY();

    localCenter.setX(localCenter.getX() + xDiff * sensitivity);
    localCenter.setY(localCenter.getY() + yDiff * sensitivity);

    localBox = new Box(
      new Point(localCenter.getX() - localWidth / 2, localCenter.getY() + localHeight / 2),
      new Point(localCenter.getX() + localWidth / 2, localCenter.getY() - localHeight / 2)
    );
  }

  public void display() {
    rect(
      posCenter.getX() - panWidth / 2,
      posCenter.getY() - panHeight / 2,
      panWidth,
      panHeight
    );

    // clip(
    //   posCenter.getX() - panWidth / 2,
    //   posCenter.getY() - panHeight / 2,
    //   panWidth,
    //   panHeight
    // );

    for (Drawable shape : shapes) {
      if (!localBox.intersect(shape.getBox())) {
        continue;
      }

      shape.display(this);
    }
  }
}
class Point {
  private float posX, posY;

  Point(float x, float y) {
    posX = x;
    posY = y;
  }

  public float getX() {
    return posX;
  }

  public float getY() {
    return posY;
  }

  public void setX(float x) {
    posX = x;
  }

  public void setY(float y) {
    posY = y;
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Experiment" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
