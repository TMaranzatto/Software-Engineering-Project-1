class Point {
  private float posX, posY;

  Point(float x, float y) {
    posX = x;
    posY = y;
  }

  float getX() {
    return posX;
  }

  float getY() {
    return posY;
  }

  void setX(float x) {
    posX = x;
  }

  void setY(float y) {
    posY = y;
  }

  String toString() {
    return "(" + posX + "," + posY + ")";
  }
}
