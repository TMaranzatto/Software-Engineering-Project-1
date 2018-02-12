Drawable[] shapes = {
  new Circle(new Point(-300, 0), 50),
  new Circle(new Point(-150, 0), 50),
  new Circle(new Point(0, 0), 50),
  new Circle(new Point(150, 0), 50),
  new Circle(new Point(300, 0), 50)
};

PanObserver[] observers = {
  new Grid()
};

Pan pan;

Point initialPoint = new Point(0, 0);
Point movedPoint = new Point(0, 0);

void setup()
{
  size(800, 600);
  background(255);

  pan = new Pan(
    new Point(width / 2, height / 2),
    400,
    400,
    shapes,
    observers
  );

  pan.display();
}

void draw()
{}

void mousePressed()
{
  initialPoint.setX(mouseX);
  initialPoint.setY(mouseY);
}

void mouseDragged() {
  movedPoint.setX(mouseX);
  movedPoint.setY(mouseY);

  pan.update(initialPoint, movedPoint);
  pan.display();

  initialPoint.setX(movedPoint.getX());
  initialPoint.setY(movedPoint.getY());
}
