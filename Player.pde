class Player {
  //Variables
  //Moving left / Moving right
  boolean moveRight;
  boolean moveLeft;
  boolean touchGround;
  boolean jumping;

  float xSize = 30;
  float ySize = 60;

  //Vectors for Position, Velocity, and Acceleration
  PVector pos;
  PVector vel;
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
    fill(255);
    rect(pos.x, pos.y, xSize, ySize);
    
    rect(width/2,ground.posY-ground.sizeY/3, width,2);
  }

//Physics
  void physics() {
    //Movement in the X Axis
    pos.x = pos.x + vel.x;
    //Move Right
    if (moveRight == true) {
      vel.x = 5;
    }
    //Move Left
    if (moveLeft == true) {
      vel.x = -5;
    }

    //Gravity
    pos.y = pos.y + vel.y;
    vel.y = vel.y + acc.y;
    
    //Ensures that the player doesn't clip into the ground
    if (touchGround == true && jumping == false) {
    pos.y = ground.posY-ground.sizeY/2 - ySize/2;
    }

    //Collision with Ground
    if (pos.y + ySize/2 >= ground.posY - ground.sizeY/2 && pos.y + ySize/2 < ground.posY-ground.sizeY/3 && pos.x - xSize/2 <= ground.posX + ground.sizeX/2 && pos.x + xSize/2 >= ground.posX - ground.sizeX/2) {
      acc.y = 0;
      vel.y = 0;
      touchGround = true;
    } else {
      acc.y = 0.2;
      touchGround = false;
    }
  }
}
