class Box {

  //Variables
  float sizeX = 40;
  float sizeY = 40;

  //Position
  float initialPosX;
  float initialPosY;

  //Visual effects
  float effectSize;
  float effectOpacity;

  //Grabbing box
  boolean boxGrabbed;

  //Vectors:
  //Position
  PVector pos;
  //Velocity
  PVector vel;
  //Acceleration
  PVector acc;

  Box (float x, float y, float tempPosX, float tempPosY) {
    pos = new PVector (x, y);
    vel = new PVector (x, y);
    acc = new PVector (x, y);
    initialPosX = tempPosX;
    initialPosY = tempPosY;
  }


  //Display Box
  void display() {
    stroke(#57ebff);
    strokeWeight(3);
    fill(#0d1030);
    rect(pos.x, pos.y-3, sizeX, sizeY);
    ellipse(pos.x, pos.y-3, sizeX-6, sizeY-6);

    //Visual efffect for grabbing
    if (boxGrabbed == true && effectSize < 220) {
      stroke(#57ebff, effectOpacity);
      strokeWeight(8);
      noFill();
      rect(pos.x, pos.y, effectSize, effectSize);

      effectSize = effectSize + 8;
      effectOpacity = effectOpacity - 8;
    } else {
      effectSize = 0;
      effectOpacity = 255;
    }
  }

  //Box Physics
  //Gravity when not grabbed by the mouse
  void physics() {
    if (boxGrabbed == false) {
      pos.y = pos.y + vel.y;
      vel.y = vel.y + acc.y;
    }

    //Grabbing box with the mouse
    if (mouseX - scroll > pos.x - sizeX/2 && mouseX - scroll < pos.x + sizeX/2 && mouseY < pos.y + sizeY/2 && mouseY > pos.y - sizeY/2) {
      stroke(255);
      strokeWeight(3);
      noFill();
      rect(pos.x, pos.y - 3, sizeX + 6, sizeY + 6);

      if (mousePressed == true) {
        boxGrabbed = true;
      }
    }

    //Set box position to mouse (with offset)
    if (boxGrabbed == true) {
      pos.x = mouseX - scroll;
      pos.y = mouseY;
    }

      if (pos.y - sizeY/2 > height) {
        acc.y = 0;
        vel.y = 0;
        pos.x = initialPosX;
        pos.y = initialPosY;
    }
  }


  //Box collision with player
  void playerInteractions() {

    //Player's VERTICAL collision with box
    if (player.pos.y + player.sizeY/2 >= pos.y - sizeY/2 && player.pos.y + player.sizeY/2 < pos.y-sizeY/3 && player.pos.x - player.sizeX/2 +5 <= pos.x + sizeX/2 && player.pos.x + player.sizeX/2 -5 >= pos.x - sizeX/2 && boxGrabbed == false) {
      player.acc.y = 0;
      player.vel.y = 0;
      player.touchBox = true;
    } else {
      player.acc.y = 0.2;
      player.touchBox = false;
    }

    //Player´s HORIZONTAL collision with box
    //Right edge collision
    if (player.pos.y + player.sizeY/2 >= pos.y - sizeY/2 && player.pos.x + player.sizeX/2 <= pos.x - sizeX/2 + 5 && player.pos.x + player.sizeX/2 >= pos.x - sizeX/2 && player.moveRight == true) {
      player.vel.x = 0;
    }

    //Left edge collision
    if (player.pos.y + player.sizeY/2 >= pos.y - sizeY/2 && player.pos.x - player.sizeX/2 >= pos.x + sizeX/2 - 5 && player.pos.x - player.sizeX/2 <= pos.x + sizeX/2 && player.moveLeft == true) {
      player.vel.x = 0;
    }

    //Ensures that the player doesn't clip into the box
    if (player.touchBox == true && player.jumping == false) {
      player.pos.y = pos.y - sizeY/2 - player.sizeY/2;
    }

    //Player jumping on top of box (does not work outside of Box class)
    if (player.jumping == true && player.touchBox == true) {
      player.vel.y = player.vel.y - player.jumpHeight;
    }
  }
}
