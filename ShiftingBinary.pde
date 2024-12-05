//Variables


//Declare objects
Player player;

//Ground Array
Ground [] ground = new Ground[4];

//Setup
void setup() {
  size(640, 480);
  rectMode(CENTER);

  //Initialize player and reset position
  player = new Player(X, Y);
  player.reset();

  //Initialize Ground objects, each on their respective locations
  //SCREEN 1
  ground[0] = new Ground(320,450,400,50);
  ground[1] = new Ground(0,480,0,0);
  ground[2] = new Ground(320,380,70,100);
  ground[3] = new Ground(0,480,0,0);

  //SCREEN 2

  //SCREEN 3
}

void draw() {
  background(#0d1030);
 
 //Screen scroll
    translate(width/2 - player.pos.x, 0);

  player.physics();
  player.display();
  
  for (int i = 0; i < 4; i++) {
      ground[i].display();
      ground[i].playerInteractions();
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
