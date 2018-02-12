class Box {
  private Point topLeft;
  private Point bottomRight;
  private Point center;
  private float boxWidth;
  private float boxHeight;

  Box(Point tl, Point br) {
    topLeft     = tl;
    bottomRight = br;
    boxWidth    = abs(br.getX() - tl.getX());
    boxHeight   = abs(tl.getY() - br.getY());

    center = new Point(
      br.getX() - boxWidth / 2,
      tl.getY() - boxHeight / 2
    );
  }

  boolean intersect(Box other) {
    boolean xSat = abs(this.getX() - other.getX()) * 2 < (this.getWidth() + other.getWidth());
    boolean ySat = abs(this.getY() - other.getY()) * 2 < (this.getHeight() + other.getHeight());

    System.out.println(this.getWidth() + " and " + other.getWidth());
    System.out.println("xsat: " + xSat + ", ysat: " + ySat);

    return xSat && ySat;
  }

  float getWidth() {
    return boxWidth;
  }

  float getHeight() {
    return boxHeight;
  }

  float getX() {
    return center.getX();
  }

  float getY() {
    return center.getY();
  }

  String toString() {
    return topLeft + " - " + bottomRight;
  }
}
