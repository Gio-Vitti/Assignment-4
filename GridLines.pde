class GridLines {
  //Line Points
  float xPoint1;
  float yPoint1;
  float xPoint2;
  float yPoint2;

  GridLines(float tempXPoint1, float tempYPoint1, float tempXPoint2, float tempYPoint2) {
    xPoint1 = tempXPoint1;
    yPoint1 = tempYPoint1;
    xPoint2 = tempXPoint2;
    yPoint2 = tempYPoint2;
  }

  void display() {
    stroke(#393c5c);
    strokeWeight(2);
    line(xPoint1 - scroll, 0, xPoint2 - scroll, 480);
    line(0 - scroll, yPoint1, width - scroll, yPoint2);
    }
  }
