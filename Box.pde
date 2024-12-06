class Box {

  //Variables
  float sizeX = 40;
  float sizeY = 40;

  boolean boxGrabbed;

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


  //Display Box
  void display() {
    stroke(#57ebff);
    strokeWeight(3);
    noFill();
    rect(pos.x, pos.y - 3, sizeX, sizeY);
  }

  //Box Gravity when not grabbed by the mouse
  void physics() {
    if (boxGrabbed == false) {
      pos.y = pos.y + vel.y;
      vel.y = vel.y + acc.y;
    }

    if (mousePressed == true && mouseX > pos.x - sizeX/2 && mouseX < pos.x + sizeX/2) {
      boxGrabbed = true;
    }

    if (boxGrabbed == true) {
      pos.x = mouseX;
      pos.y = mouseY;
    }
  }

  //Box collision with player
  void playerInteractions() {

    //Player's VERTICAL collision with box
    if (player.pos.y + player.sizeY/2 >= pos.y - sizeY/2 && player.pos.y + player.sizeY/2 < pos.y-sizeY/3 && player.pos.x - player.sizeX/2 +5 <= pos.x + sizeX/2 && player.pos.x + player.sizeX/2 -5 >= pos.x - sizeX/2) {
      player.acc.y = 0;
      player.vel.y = 0;
      player.touchBox = true;
    } else {
      player.acc.y = 0.2;
      player.touchBox = false;
    }

    //Ensures that the player doesn't clip into the box
    if (player.touchBox == true && player.jumping == false) {
      player.pos.y = pos.y - sizeY/2 - player.sizeY/2;
    }
  }
}
