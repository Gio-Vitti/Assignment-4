//Declare objects
Player player;
Ground ground;

//Setup
void setup() {
  size(640,480);
  rectMode(CENTER);

  player = new Player(X, Y);
  ground = new Ground(width/2, height-100, 200, 50);
  player.reset();
}

void draw() {
  background(#0d1030);

  player.physics();
  player.display();
  ground.display();

  //Resets when falling off the stage
  if (player.pos.y > height) {
    player.reset();

    //Scroll
    pushMatrix();
    translate(player.pos.x,player.pos.y);
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
  //Jump
  if (key == 'w' && player.touchGround == true) {
    player.vel.y = player.vel.y - 6;
    player.jumping = true;
  } else {
    player.jumping = false;
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
}
