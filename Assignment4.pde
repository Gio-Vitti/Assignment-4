//Variables
//Screen scrolling offset
float scroll;

float explosionSize;
float explosionSpeed = 10;

int lineNumber = 16;

boolean gameActive = false;

//Declare objects
Player player;
Box box;

//Declare Arrays
Ground [] ground = new Ground[4];
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

  box = new Box(X, Y, 200, 200);

  box.reset();

  //Initialize Ground objects, each on their respective locations
  //SCREEN 1
  ground[0] = new Ground(320, height-40, 800, 76);
  ground[1] = new Ground(320, height-115, 70, 70);
  ground[2] = new Ground(500, height-150, 70, 140);
  ground[3] = new Ground(0, 480, 0, 0);

  //SCREEN 2

  //SCREEN 3
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
    //Write Text
    textAlign(CENTER);
    fill(255);
    textSize(42.5);
    text("Click to Start", width/2, 215);

    //Draw TextBox
    stroke(255);
    noFill();
    strokeWeight(3);
    stroke(#ff458a);
    rect(width/2, 203, 240, 80);
    stroke(255);
    rect(width/2, 200, 240, 80);
  }

  if (gameActive == true) {

    //Box methods
    box.display();
    box.physics();
    box.playerInteractions();

    //Ground methods
    for (int i = 0; i < 4; i++) {
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

  //Resets Box when falling off the stage
  if (box.pos.y - box.sizeY/2 >= height) {
    box.reset();
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
  box.boxGrabbed = false;
}
