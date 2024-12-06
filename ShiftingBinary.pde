//Variables

//Declare objects
Player player;
Box box;

//Ground Array
Ground [] ground = new Ground[4];

//Setup
void setup() {
  size(640, 480);
  rectMode(CENTER);

  //Initialize player and reset position
  player = new Player(X, Y);
  player.reset();

  box = new Box(X, Y);
  box.pos.x = 200;
  box.pos.y = 200;


  //Initialize Ground objects, each on their respective locations
  //SCREEN 1
  ground[0] = new Ground(320, height-30, 800, 50);
  ground[1] = new Ground(320, height-90, 70, 70);
  ground[2] = new Ground(500, height-125, 70, 140);
  ground[3] = new Ground(0, 480, 0, 0);

  //SCREEN 2

  //SCREEN 3
}

void draw() {
  background(#0d1030);

  //Screen scroll
  translate(width/2 - player.pos.x, 0);

  player.physics();
  player.display();

  box.display();
  box.physics();
  box.playerInteractions();

  for (int i = 0; i < 4; i++) {
    ground[i].display();
    ground[i].playerInteractions();
    ground[i].boxInteractions();

    //Player Jumping (does not work if outside of Ground class)
    if (player.jumping == true && player.touchGround == true || player.jumping == true && player.touchBox == true) {
      player.vel.y = player.vel.y - player.jumpHeight;
    }
  }

  //Resets when falling off the stage
  if (player.pos.y - player.sizeY - 50 > height) {
    player.reset();
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

//Lets go of box when releasing mouse
void mouseReleased() {
  box.boxGrabbed = false;
}
