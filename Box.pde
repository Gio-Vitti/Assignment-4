class Box {

  //Size
  float sizeX;
  float sizeY;

  //Vectors:
  //Position
  PVector pos;
  //Velocity
  PVector vel;
  //Acceleration
  PVector acc;

  Box (float x, float y) {
    pos = new PVector (x, y);
    vel = new PVector (x, y);
    acc = new PVector (x, y);
  }

  //Constructor
  Box (float posX, float posY, float tempSizeX, float tempSizeY) {
    pos.x = tempPosX;
    pos.y = tempPosY;
    sizeX = tempSizeX;
    sizeY = tempSizeY;
  }

  //Display Box
  void display() {
    stroke(#57ebff);
    strokeWeight(3);
    noFill();
    rect(pos
  }
}
