class Player {
  //Variables
  //Boolean states for moving left, right, jumping, and touching the ground
  boolean moveRight;
  boolean moveLeft;
  boolean jumping;

  boolean touchGround;
  boolean touchBox;

  //Movement Pararmeters
  float jumpHeight = 7;
  float speed = 5;

  //Size
  float sizeX = 30;
  float sizeY = 50;

  float leftLeg = 10;
  float rightLeg = -10;
  boolean legDown;

  //Visual effects
  float effectSize;
  float effectOpacity;

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

  //Draw Player and UFO
  void display() {
    //Draw Player
    smooth();
    fill(#0d1030);
    stroke(#ff56b9);
    strokeWeight(3);
    // rect(pos.x,pos.y - 5,sizeX,sizeY);

    //Left Leg
    rect(pos.x-7.5, pos.y-5 + leftLeg, 0, 20);
    //Left Foot
    ellipse(pos.x-10.5, pos.y + leftLeg + 10.5, 10, 5);
    //Right Leg
    rect(pos.x+7.5, pos.y-5 + rightLeg, 0, 20);
    //Right Foot
    ellipse(pos.x+10.5, pos.y + rightLeg + 10.5, 10, 5);

    //Head
    ellipse(pos.x, pos.y-17.5, 30, 30);


    //Animate legs
    if (leftLeg == 10) {
      legDown = true;
    } else if (leftLeg == -10) {
      legDown = false;
    } 

    if (legDown == true && vel.x != 0) {
      leftLeg = leftLeg - 1;
      rightLeg = rightLeg + 1;
    }

    if (legDown == false && vel.x != 0) {
      leftLeg = leftLeg + 1;
      rightLeg = rightLeg - 1;
    }

    //draws UFO on mouse cursor;
    strokeWeight(2);
    stroke (255);

    fill(#0d1030);
    ellipse(mouseX - scroll, mouseY-10, 20, 20);
    line(mouseX - scroll, mouseY-20, mouseX - scroll, mouseY-25);
    ellipse(mouseX - scroll, mouseY-28, 4, 4);

    ellipse(mouseX - scroll, mouseY, 40, 20);

    ellipse(mouseX - scroll, mouseY, 4, 4);
    ellipse(mouseX - scroll +10, mouseY, 4, 4);
    ellipse(mouseX - scroll-10, mouseY, 4, 4);

    //Visual efffect for grabbing
    if (vel.y < -1.2 && effectSize < 220) {
      stroke(#ff56b9, effectOpacity);
      strokeWeight(8);
      noFill();
      rect(pos.x, pos.y + sizeY/2, effectSize, 0);

      effectSize = effectSize + 5;
      effectOpacity = effectOpacity - 10;
    } else {
      effectSize = 0;
      effectOpacity = 255;
    }
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
