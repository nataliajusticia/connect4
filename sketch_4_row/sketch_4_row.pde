/********* VARIABLES *********/
// 
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen 

int gameScreen = 0;
int exit = 0;
int posBtn1 = 0;
boolean JugarOver;

PFont font;


Circle [][] a = new Circle[7][6];

// Array tablero
int[][] tablero = new int[7][7];

/********* IMAGES *********/

PImage img_background;
PImage img_btn_start;
PImage img_btn_start_hover;
PImage img_btn_exit;
PImage img_btn_exit_hover;
PImage img_piece1;
PImage img_piece2;

/********* SETUP BLOCK *********/

void setup() {
  size(600, 600);
  smooth();
  
  font = loadFont("Monospaced-60.vlw");
  loadImg();

  JugarOver=false;
  
  for (int i = 0; i < 7; i++) {
    for (int j = 0; j < 6; ++j) {
      a[i][j] = new Circle (50 + 100*(i), 50 + 100*(j), 90, color (255, 255, 255));
    }
  }
}

/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the current screen
  switch(gameScreen){
    case 0:
      initScreen();
      break;
      
    case 1:
      gameScreen();
      break;
  }
}

/********* SCREEN CONTENTS *********/

void initScreen() { 
  image(img_background, 0, 0);
  tint(236, 240, 241);
 
  textAlign(CENTER);
  
  textFont(font, 60);
  rect(0, height/3, width, 155);
  shadowtext("+ Connect 4 +", width/2, height/2, 3);

  image(img_btn_start, posBtn1, height/1.5);
  
  if(posBtn1 < width/2.9){
    posBtn1 = posBtn1+20;
  }

  if (mouseX>=width/3 && mouseX<=width/3+120 && mouseY>=height/1.5 && mouseY<=height/1.5+47){
    JugarOver=true;
    image(img_btn_start_hover,posBtn1,height/1.5);
  }
  
  fill(52, 73, 94);
  textSize(11); 
  text("Developed by Natalia Justicia", width/2, height-20);
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

public void mousePressed() {
    if (gameScreen == 0) { 
      if(JugarOver) {
        startGame();
      }
  }
}

/********* LOAD ASSETS *********/

void loadImg() {
  img_background = loadImage("bg.jpg");
  img_btn_start = loadImage("btn_start.png");
  img_btn_start_hover = loadImage("btn_start2.png");
  img_piece1 = loadImage("ficha_1.png");
  img_piece2 = loadImage("ficha_2.png");
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
