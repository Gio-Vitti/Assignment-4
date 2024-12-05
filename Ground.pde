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
      if (player.pos.y + player.sizeY/2 >= posY - sizeY/2 && player.pos.x + player.sizeX/2 <= posX - sizeX/2 + 10 && player.pos.x + player.sizeX/2 >= posX - sizeX/2 && player.moveRight == true) {
        player.vel.x = 0;
      }  
      
       //Left edge collision
      if (player.pos.y + player.sizeY/2 >= posY - sizeY/2 && player.pos.x - player.sizeX/2 >= posX + sizeX/2 - 10 && player.pos.x - player.sizeX/2 <= posX + sizeX/2 && player.moveLeft == true) {
        player.vel.x = 0;
      }  

    //Ensures that the player doesn't clip into the ground
    if (player.touchGround == true && player.jumping == false) {
      player.pos.y = posY - sizeY/2 - player.sizeY/2;
    }

    //Player Jumping (does not work if outside of Ground class)
    if (player.jumping == true && player.touchGround == true) {
      player.vel.y = player.vel.y - player.jumpHeight;
      
    }
  }
}
