class Player {
  //Variables
  //Boolean states for moving left, right, jumping, and touching the ground
  boolean moveRight;
  boolean moveLeft;
  boolean jumping;
  
  boolean touchGround;
  boolean touchBox;

  //Movement Pararmeters
  float jumpHeight = 6;
  float speed = 5;

  //Size
  float sizeX = 30;
  float sizeY = 50;
  

  //Vectors:
  //Position
  PVector pos;
  //Velocity
  PVector vel;
  //Acceleration
  PVector acc;

  Player (float x, float y) {
    pos = new PVector (x, y);
    vel = new PVector (x, y);
    acc = new PVector (x, y);
  }

  //Reset Position and Physics
  void reset() {
    pos.x = width/2;
    pos.y = height/2;
    acc.y = 0;
    vel.y = 0;
  }

  //Draw Player
  void display() {
    noFill();
    stroke(#ff56b9);
    strokeWeight(3);
    rect(pos.x, pos.y - 5, sizeX, sizeY);
  }

  //Physics and Movement
  void physics() {
    
    //Movement in the X Axis
    pos.x = pos.x + vel.x;
    
    //Move Right
    if (moveRight == true) {
      vel.x = speed;
    }
    
    //Move Left
    if (moveLeft == true) {
      vel.x = -speed;
    }

    //Gravity
    pos.y = pos.y + vel.y;
    vel.y = vel.y + acc.y;
  }
}
