class Spike {

  //Position
  float posX;
  float posY;

  //Size
  float sizeX = 120;
  float sizeY = 40;

  //Constructor
  Spike (float tempPosX, float tempPosY) {
    posX = tempPosX;
    posY = tempPosY;
  }

  void display() {
    //Draw the Spikes
    stroke(#ff56b9);
    strokeWeight(3);
    //rect(posX, posY, sizeX, sizeY); HITBOX

    triangle(posX-60, posY+20, posX-40, posY-20, posX-20, posY+20);
    triangle(posX-20, posY+20, posX, posY-20, posX+20, posY+20);
    triangle(posX+60, posY+20, posX+40, posY-20, posX+20, posY+20);
  }

  void playerInteractions() {
    //Game over when player touches spikes
    if (player.pos.y + player.sizeY/2 > posY - sizeY/2 && player.pos.x + player.sizeX/2 > posX - sizeX/2 && player.pos.x - player.sizeX/2 < posX + sizeX/2) {
      touchingSpike = true;
    } else {
      touchingSpike = false;
    }
  }

  void boxInteractions() {
    //Box's VERTICAL collision with spikes
    for (int i = 0; i < boxNumber; i++) {
      if (box[i].pos.y + box[i].sizeY/2 >= posY - sizeY/2 && box[i].pos.y + box[i].sizeY/2 < posY + sizeY/2 && box[i].pos.x - box[i].sizeX/2 <= posX + sizeX/2 && box[i].pos.x + box[i].sizeX/2 >= posX - sizeX/2) {
        box[i].acc.y = 0;
        box[i].vel.y = 0;
      } else {
        box[i].acc.y = 0.2;
      }

      //Ensures that the box[i] doesn't clip into the spikes
      if (box[i].acc.y == 0 && box[i].boxGrabbed == false) {
        box[i].pos.y = posY - sizeY/2 - box[i].sizeY/2;
      }
    }
  }
}
