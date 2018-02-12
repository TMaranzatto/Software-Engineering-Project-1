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

  Box getBox() {
    return box;
  }

  void display(Pan pan) {
    Point actual = pan.convertLocalToActual(center);
    ellipse(actual.getX(), actual.getY(), radius * 2, radius * 2);
  }
}
