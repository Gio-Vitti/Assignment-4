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

  //Constructor
  Player (float x, float y) {
    pos = new PVector (x, y);
    vel = new PVector (x, y);
    acc = new PVector (x, y);
  }

  //Reset Position and Physics
  void reset() {
    pos.x = width/2;
    pos.y = 0;
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
    //rect(pos.x,pos.y - 5,sizeX,sizeY);  -> HITBOX

    //Legs
    //Draws legs when not moving
    if (vel.x == 0) {
      //Left Leg
      rect(pos.x-7.5, pos.y+2, 0, 20);
      //Left Foot
      ellipse(pos.x-10.5, pos.y + 16.5, 10, 5);
      //Right Leg
      rect(pos.x+7.5, pos.y+2, 0, 20);
      //Right Foot
      ellipse(pos.x+10.5, pos.y + 16.5, 10, 5);
    } else {

      //Draws legs when moving (animated):
      //Left Leg
      rect(pos.x-7.5, pos.y-5 + leftLeg, 0, 20);
      //Left Foot
      ellipse(pos.x-10.5, pos.y + leftLeg + 10.5, 10, 5);
      //Right Leg
      rect(pos.x+7.5, pos.y-5 + rightLeg, 0, 20);
      //Right Foot
      ellipse(pos.x+10.5, pos.y + rightLeg + 10.5, 10, 5);
    }

    //Alternates between going up and going down
    if (leftLeg == 10) {
      legDown = true;
    } else if (leftLeg == -10) {
      legDown = false;
    }
    //Left leg up, right leg down
    if (legDown == true && vel.x != 0) {
      leftLeg = leftLeg - 1;
      rightLeg = rightLeg + 1;
    }
    //Left leg down, right leg up
    if (legDown == false && vel.x != 0) {
      leftLeg = leftLeg + 1;
      rightLeg = rightLeg - 1;
    }

    //Antenna
    stroke(255);
    strokeWeight(2);
    rect(pos.x, pos.y-35, 0, 10);
    ellipse(pos.x, pos.y-44, 7.5, 7.5);

    //Ears
    //Left Ear
    stroke(#ff56b9);
    strokeWeight(3);
    rect(pos.x-15, pos.y-30, 10, 10);
    //Right Ear
    rect(pos.x+15, pos.y-30, 10, 10);

    //Head
    ellipse(pos.x, pos.y-17.5, 30, 30);

    //Mouth
    stroke(255);
    strokeWeight(1.5);
    ellipse(pos.x-2, pos.y-10, 5, 5);
    ellipse(pos.x+2, pos.y-10, 5, 5);
    noStroke();
    rect(pos.x, pos.y-10.5, 5, 2);

    //Nose
    fill(255);
    ellipse(pos.x, pos.y-11.5, 5, 2.5);

    //Eyes
    stroke(255);
    fill(#0d1030);
    strokeWeight(1.5);
    //Left Eye
    ellipse(pos.x-7.5, pos.y-17.5, 10, 10);
    //Right Eye
    ellipse(pos.x+7.5, pos.y-17.5, 10, 10);
    //Middle Eye
    ellipse(pos.x, pos.y-27, 10, 10);

    //Animate Eyes
    //Standing Still
    //Left pupil
    if (vel.x == 0) {
      fill(255);
      ellipse(pos.x-7.5, pos.y-17.5, 3, 3);
      //Right Pupil
      ellipse(pos.x+7.5, pos.y-17.5, 3, 3);
      //Middle Pupil
      ellipse(pos.x, pos.y-27, 3, 3);
    }

    //Looking Right
    if (moveRight == true) {
      //Left pupil
      fill(255);
      ellipse(pos.x-6, pos.y-17.5, 3, 3);
      //Right Pupil
      ellipse(pos.x+9, pos.y-17.5, 3, 3);
      //Middle Pupil
      ellipse(pos.x+2, pos.y-27, 3, 3);
    }

    //Animate Eyes
    //Looking Left
    if (moveLeft == true && moveRight == false) {
      //Left pupil
      fill(255);
      ellipse(pos.x-10, pos.y-17.5, 3, 3);
      //Right Pupil
      ellipse(pos.x+6, pos.y-17.5, 3, 3);
      //Middle Pupil
      ellipse(pos.x-2, pos.y-27, 3, 3);
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

    //Visual efffect for jumping

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
