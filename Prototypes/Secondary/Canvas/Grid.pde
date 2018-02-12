class Grid implements PanObserver {
  Grid() {}

  void update(Pan pan) {
    Point start, end;

    start = pan.convertLocalToActual(new Point(
      pan.getLocalCenter().getX(),
      pan.getLocalCenter().getY() - pan.getLocalHeight() / 2
    ));

    end = pan.convertLocalToActual(new Point(
      pan.getLocalCenter().getX(),
      pan.getLocalCenter().getY() + pan.getLocalHeight() / 2
    ));

    line(start.getX(), start.getY(), end.getX(), end.getY());

    start = pan.convertLocalToActual(new Point(
      pan.getLocalCenter().getX() - pan.getLocalWidth() / 2,
      pan.getLocalCenter().getY()
    ));

    end = pan.convertLocalToActual(new Point(
      pan.getLocalCenter().getX() + pan.getLocalWidth() / 2,
      pan.getLocalCenter().getY()
    ));

    line(start.getX(), start.getY(), end.getX(), end.getY());

    float tickWidth = 5;
    int numTicks = 10;

    float xBin = pan.getLocalWidth() / numTicks;
    float yBin = pan.getLocalHeight() / numTicks;

    Point panCenter = pan.getLocalCenter();

    for (int i = 0; i < numTicks; i++) {
      start = pan.convertLocalToActual(new Point(
        panCenter.getX() - tickWidth / 2,
        panCenter.getY() + pan.getLocalHeight() / 2 - i * xBin
      ));

      end = pan.convertLocalToActual(new Point(
        panCenter.getX() + tickWidth / 2,
        panCenter.getY() + pan.getLocalHeight() / 2 - i * xBin
      ));

      line(start.getX(), start.getY(), end.getX(), end.getY());

      end = pan.convertLocalToActual(new Point(
        panCenter.getX() + tickWidth / 2 + 10,
        panCenter.getY() + pan.getLocalHeight() / 2 - i * xBin
      ));

      text("1", end.getX(), end.getY());

      System.out.println(end);
      //text(panCenter.getX() + i * xBin, end.getX(), end.getY());

      //System.out.println(panCenter.getX() + i * xBin);
    }
  }
}
