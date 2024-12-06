class Ground {

  //Position
  float posX;
  float posY;

  //Size
  float sizeX;
  float sizeY;

  //Constructor
  Ground (float tempPosX, float tempPosY, float tempSizeX, float tempSizeY) {
    posX = tempPosX;
    posY = tempPosY;
    sizeX = tempSizeX;
    sizeY = tempSizeY;
  }

  //Draw Ground
  void display() {
    stroke(255);
    strokeWeight(2);
    noFill();
    rect(posX, posY, sizeX, sizeY);
  }


  void playerInteractions() {


    //Player's VERTICAL collision with ground
    if (player.pos.y + player.sizeY/2 >= posY - sizeY/2 && player.pos.y + player.sizeY/2 < posY-sizeY/3 && player.pos.x - player.sizeX/2 +5 <= posX + sizeX/2 && player.pos.x + player.sizeX/2 -5 >= posX - sizeX/2) {
      player.acc.y = 0;
      player.vel.y = 0;
      player.touchGround = true;
    } else {
      player.acc.y = 0.2;
      player.touchGround = false;
    }

    //Player's HORIZONTAL collision with ground
    //Right edge collision
    if (player.pos.y + player.sizeY/2 >= posY - sizeY/2 && player.pos.x + player.sizeX/2 <= posX - sizeX/2 + 5 && player.pos.x + player.sizeX/2 >= posX - sizeX/2 && player.moveRight == true) {
      player.vel.x = 0;
    }

    //Left edge collision
    if (player.pos.y + player.sizeY/2 >= posY - sizeY/2 && player.pos.x - player.sizeX/2 >= posX + sizeX/2 - 5 && player.pos.x - player.sizeX/2 <= posX + sizeX/2 && player.moveLeft == true) {
      player.vel.x = 0;
    }
  }

  void boxInteractions() {
    //Box's VERTICAL collision with ground
    if (box.pos.y + box.sizeY/2 >= posY - sizeY/2 && box.pos.y + box.sizeY/2 < posY + sizeY/2 && box.pos.x - box.sizeX/2 <= posX + sizeX/2 && box.pos.x + box.sizeX/2 >= posX - sizeX/2) {
      box.acc.y = 0;
      box.vel.y = 0;
    } else {
      box.acc.y = 0.2;
    }

    //Ensures that the box doesn't clip into the ground
    if (box.acc.y == 0 && box.boxGrabbed == false) {
      box.pos.y = posY - sizeY/2 - box.sizeY/2;
    }
  }
}
