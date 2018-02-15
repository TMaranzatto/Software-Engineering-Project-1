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
  private PanObserver[] observers;

  Pan(Point c, float w, float h, Drawable[] shapes, PanObserver[] obs) {
    posCenter = c;
    panWidth = w;
    panHeight = h;
    this.shapes = shapes;

    localWidth = w;
    localHeight = h;
    localCenter = new Point(0, 0);

    localBox = new Box(
      new Point(-w / 2, h / 2),
      new Point(w / 2, -h / 2)
    );

    sensitivity = 1;

    observers = obs;
  }

  Point getLocalCenter() {
    return localCenter;
  }

  float getLocalWidth() {
    return localWidth;
  }

  float getLocalHeight() {
    return localHeight;
  }

  Point convertActualToLocal(Point point) {
    return point;
  }

  Point convertLocalToActual(Point point) {
    float xDiff = point.getX() - localCenter.getX();
    float yDiff = point.getY() - localCenter.getY();

    return new Point(posCenter.getX() + xDiff, posCenter.getY() + yDiff);
  }

  Box getBox() {
    return localBox;
  }

  void update(Point initial, Point current) {
    float xDiff = initial.getX() - current.getX();
    float yDiff = initial.getY() - current.getY();

    localCenter.setX(localCenter.getX() + xDiff * sensitivity);
    localCenter.setY(localCenter.getY() + yDiff * sensitivity);

    localBox = new Box(
      new Point(localCenter.getX() - localWidth / 2, localCenter.getY() + localHeight / 2),
      new Point(localCenter.getX() + localWidth / 2, localCenter.getY() - localHeight / 2)
    );
  }

  void display() {
    rect(
      posCenter.getX() - panWidth / 2,
      posCenter.getY() - panHeight / 2,
      panWidth,
      panHeight
    );

    // Quick fix to not show objects outside of the canvas
    // What's a better way to do this?
    clip(
      posCenter.getX() - panWidth / 2,
      posCenter.getY() - panHeight / 2,
      panWidth,
      panHeight
    );

    System.out.println("====START====");
    System.out.println(localBox);

    for (Drawable shape : shapes) {
      System.out.println(shape.getBox());
      if (!localBox.intersect(shape.getBox())) {
        continue;
      }

      shape.display(this);
    }

    for (PanObserver ob : observers) {
      ob.update(this);
    }
  }
}
