/********* VARIABLES *********/
// 
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen 

int game_screen = 0;
int counter;
int pos_btn1 = 0;
int pos_btn2 = 450;
int pos_piece = 0;
boolean play = false;
boolean exit = false;

String text_title = "  Connect 4  ";
PFont font;

// Array table
Circle [][] a = new Circle[7][6];
int[][] table = new int[7][7];

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
  frameRate(30);
  smooth();
  
  font = loadFont("Monospaced-60.vlw");

  loadImg();
  
  for (int i = 0; i < 7; i++) {
    for (int j = 0; j < 6; ++j) {
      a[i][j] = new Circle (50 + 100*(i), 50 + 100*(j), 90, color (255, 255, 255));
    }
  }
}

/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the current screen
  switch(game_screen){
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

  typewriteText();
  
  // Pieces
  image(img_piece1, 54, pos_piece);
  image(img_piece2, 486, pos_piece);

  // Buttons
  image(img_btn_start, pos_btn1, height/1.5);
  image(img_btn_exit, pos_btn2, height/1.3);
  
  // Movement
  if(pos_btn1 < width/2.7){
    pos_btn1 = pos_btn1+15;
  }
  if(pos_btn2 > width/2.6){
    pos_btn2 = pos_btn2-15;
  }
  if(pos_piece < height/2.4) {
    pos_piece = pos_piece+10;
  }

  hoverBtn();
  
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
    if (game_screen == 0) { 
      if(play) {
        startGame();
      } 
      if (exit) {
        exit();
      }
  }
}

/********* LOAD ASSETS *********/

void loadImg() {
  img_background = loadImage("bg.jpg");
  img_btn_start = loadImage("btn_start.png");
  img_btn_start_hover = loadImage("btn_start2.png");
  img_btn_exit = loadImage("btn_exit.png");
  img_btn_exit_hover = loadImage("btn_exit2.png");
  img_piece1 = loadImage("ficha_1.png");
  img_piece2 = loadImage("ficha_2.png");
}

/********* OTHER FUNCTIONS *********/

// Start the game  
void startGame() {
  game_screen = 1;
}

// Shadow effect
void shadowText (String s, float x, float y, int o) {
  fill(245, 100);
  text(s, x+o, y+o);
  fill(245);
  text(s, x, y);
}

// Txpewrite effect
void typewriteText(){
  if (counter < text_title.length())
    counter++;
    shadowText(text_title.substring(0, counter), width/2, height/2, 3);
    delay(50);
}

// Hover effect
void hoverBtn() {
  if (mouseX >= width/2.7 && mouseX <= width/2.7+149 && mouseY >= height/1.5 && mouseY <= height/1.5+45){
    exit = false;
    play = true;
    image(img_btn_start_hover, pos_btn1, height/1.5);
  }
  if (mouseX >= width/2.6 && mouseX <= width/2.6+149 && mouseY >= height/1.3 && mouseY <= height/1.3+45){
    exit = true;
    image(img_btn_exit_hover, pos_btn2, height/1.3);
  }
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
