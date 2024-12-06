//Variables
//Screen scrolling offset
float scroll;

float explosionSize;
float explosionSpeed = 10;

int lineNumber = 16;
int groundNumber = 3;
int boxNumber = 2;

boolean gameActive = false;

//Declare objects
Player player;

//Declare Arrays
Ground [] ground = new Ground[groundNumber];
Box [] box = new Box[boxNumber];
GridLines [] gridLines = new GridLines [lineNumber];

//Setup
void setup() {
  size(640, 480);
  rectMode(CENTER);

  //Draws lines in the background;
  gridLines = new GridLines[lineNumber];
  for (int i = 0; i < lineNumber; i++) {
    gridLines[i] = new GridLines(i*40, i*40, i*40, i*40);
  }

  //Initialize player and reset position
  player = new Player(X, Y);
  player.reset();

  //Initialize Ground and Box objects, each on their respective locations
  //SCREEN 1
  ground[0] = new Ground(320, height-40, 640, 76);
  ground[1] = new Ground(70, 200, 140, 400);
  ground[2] = new Ground(590, 310, 100, 180);
  box[0] = new Box(X, Y, 570, 200);
  box[1] = new Box(X, Y, 200, 200);

  //SCREEN 2



  //SCREEN 3



  //SCREEN 4
  
  for (int i = 0; i < boxNumber; i++) {
  box[i].pos.x = box[i].initialPosX;
  box[i].pos.y = box[i].initialPosY;
}
}

void draw() {
  background(#0d1030);

  //Screen scroll
  scroll = width/2 - player.pos.x;
  translate(scroll, 0);

  for (int i = 0; i < lineNumber; i++) {
    gridLines[i].display();
  }

  if (gameActive == false) {
    // Title Screen:
    //Write Text
    textAlign(CENTER);
    fill(255);
    textSize(42.5);
    text("Click to Start", width/2, 195);

    //Draw TextBox
    stroke(255);
    noFill();
    strokeWeight(3);
    stroke(#ff56b9);
    rect(width/2, 183, 240, 80);
    stroke(255);
    rect(width/2, 180, 240, 80);

    //Draw Alien:
  }

  if (gameActive == true) {

    //Box methods
    for (int i = 0; i < boxNumber; i++) {
      box[i].display();
      box[i].physics();
      box[i].playerInteractions();
    }

    //Ground methods
    for (int i = 0; i < groundNumber; i++) {
      ground[i].display();
      ground[i].playerInteractions();
      ground[i].boxInteractions();
    }

    //Player Methods
    player.physics();
    player.display();
  }

  //Explosion effect when falling off stage
  if (player.pos.y - player.sizeY > height) {
    strokeWeight(5);
    stroke(#ff56b9);
    noFill();
    rect(player.pos.x, height, explosionSize, explosionSize);
    rect(player.pos.x, height, explosionSize-100, explosionSize-100);
    rect(player.pos.x, height, explosionSize-200, explosionSize-200);

    //Animate the explosion
    explosionSize = explosionSize + explosionSpeed;

    //Resets player position once exploson is off screen
    if (explosionSize > 1200) {
      gameActive = false;
      player.reset();
      explosionSize = 0;
    }
  }
}

//Get key inputs
void keyPressed() {
  //Move Right
  if (key == 'd') {
    player.moveRight = true;
  }
  //Move Left
  if (key == 'a') {
    player.moveLeft = true;
  }

  if (key=='w') {
    player.jumping = true;
  }
}

//Check if key has been released
void keyReleased() {
  if (key == 'd') {
    player.moveRight = false;
    player.vel.x = 0;
  }
  if (key == 'a') {
    player.moveLeft = false;
    player.vel.x = 0;
  }

  if (key=='w') {
    player.jumping = false;
  }
}

void mousePressed() {
  if (gameActive == false) {
    gameActive = true;
    player.reset();
  }
}

//Lets go of box when releasing mouse
void mouseReleased() {
  for (int i = 0; i < boxNumber; i++) {
    box[i].boxGrabbed = false;
  }
}
