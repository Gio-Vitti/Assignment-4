//Declare objects
Player player;

//Ground Array
Ground [] ground = new Ground[4];

//Setup
void setup() {
  size(640, 480);
  rectMode(CENTER);
  frameRate(240);

  //Initialize player and reset position
  player = new Player(X, Y);
  player.reset();

  //Initialize Ground objects, each on their respective locations
  //SCREEN 1
  ground[0] = new Ground(width/4, height-25, 350, 50);
  ground[1] = new Ground(width/2 + 200, height-120, 200, 25);
  ground[2] = new Ground(width/3, height-200, 200, 25);
  ground[3] = new Ground(width/3, height-75, 50, 50);

  //SCREEN 2

  //SCREEN 3
}

void draw() {
  background(#0d1030);

  player.physics();
  player.display();

  for (int i = 0; i < 4; i++) {
      ground[i].display();
      ground[i].playerInteractions();
    }


  //Resets when falling off the stage
  if (player.pos.y > height) {
    player.reset();

    //Scroll
    pushMatrix();
    translate(player.pos.x, player.pos.y);
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
  
  if(key=='w') {
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
  
   if(key=='w') {
    player.jumping = false;
  }
}
