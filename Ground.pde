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
    fill(255);
    rect(posX, posY, sizeX, sizeY);
  }


  void playerInteractions() {


    //Player's collision with ground
    if (player.pos.y + player.sizeY/2 >= posY - sizeY/2 && player.pos.y + player.sizeY/2 < posY-sizeY/3 && player.pos.x - player.sizeX/2 <= posX + sizeX/2 && player.pos.x + player.sizeX/2 >= posX - sizeX/2) {
      player.acc.y = 0;
      player.vel.y = 0;
      player.touchGround = true;
    } else {
      player.acc.y = 0.2;
      player.touchGround = false;
    }


    if (player.jumping == true && player.touchGround == true) {
      player.vel.y = player.vel.y - player.jumpHeight;

      //Ensures that the player doesn't clip into the ground
      if (player.touchGround == true && player.jumping == false) {
        player.pos.y = posY - sizeY/2 - player.sizeY/2;
      }
    }
  }
}
