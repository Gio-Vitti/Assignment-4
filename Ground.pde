class Ground {
  float posX;
  float posY;
  
  float sizeX;
  float sizeY;
  
  //Constructor
  Ground (float tempPosX,float tempPosY,float tempSizeX,float tempSizeY) {
    posX = tempPosX;
    posY = tempPosY;
    sizeX = tempSizeX;
    sizeY = tempSizeY;
  }
  
  //Draw Ground
  void display() {
    fill(255);
    rect(posX,posY,sizeX,sizeY);
  }
  
}
