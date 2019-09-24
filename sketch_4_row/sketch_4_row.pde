/********* VARIABLES *********/
// 
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen 

int gameScreen = 0;
int exit = 0;

PFont font;
PImage img;

Circle [][] a = new Circle[7][6];

/********* SETUP BLOCK *********/

void setup() {
  size(600, 600);
  smooth();
  
  font = loadFont("Monospaced-60.vlw");
  img = loadImage("bg.jpg");
  
  for (int i = 0; i < 7; i++) {
    for (int j = 0; j < 6; ++j) {
      a[i][j] = new Circle (50 + 100*(i), 50 + 100*(j), 90, color (255, 255, 255));
    }
  }
}

/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) { 
    initScreen();
  } else if (gameScreen == 1) { 
    gameScreen();
  }
}

/********* SCREEN CONTENTS *********/

void initScreen() { 
  image(img, 0, 0);
  tint(236, 240, 241);
 
  textAlign(CENTER);
  
  textFont(font, 60);
  rect(0, height/3, width, 155);
  shadowtext("+ Connect 4 +", width/2, height/2, 3);
  
  fill(52, 73, 94);
  textSize(12); 
  text("Press '1' to start", width/2, height-100);
  text("Press 'x' to exit", width/2, height-80);
}

void gameScreen() {
  drawTable();
  stroke(0);
  fill(0);
  rect(212, 270, 180, 50);
  fill(131);
  rect(208, 267, 180, 50);
  fill(0);
  textSize(20); 
  text("Coming soon...", width/2, height/2);
}

void drawTable() {
  background (52, 73, 94);
  
  for (int i = 0; i < 7; i++) {
    for (int j = 0; j < 6; j++) {
      a[i][j].render();
    }
  }
}

/********* INPUTS *********/

public void keyPressed() {
  if (gameScreen == 0 || gameScreen == 1) { 
    if (key == '1') {
      startGame();
    }
    else if (key == 'x' || key == 'X') {
      exit();
    }
  }
}

/********* OTHER FUNCTIONS *********/

// This method sets the necessery variables to start the game  
void startGame() {
  gameScreen=1;
}

void shadowtext (String s, float x, float y, int o) {
  fill(245, 100);
  text(s, x+o, y+o);
  fill(245);
  text(s, x, y);
}

/********* CLASS CIRCLE *********/
class Circle {
  float x;
  float y;

  float diameter;
  boolean isFilled; 

  color fillColor;
  color strokeColor;

  Circle(float init_x, float init_y,
  float init_diameter,
  color init_color)
  {
    x = init_x;
    y = init_y;
    diameter = init_diameter;
    fillColor = init_color;
    strokeColor = init_color;
    isFilled = false;
  }

  void render () {
    fill (fillColor);
    stroke (strokeColor);
    ellipse (x, y, diameter, diameter);
  }
}
