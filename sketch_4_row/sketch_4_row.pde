/********* VARIABLES *********/
// 
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen 

int game_screen = 0;
int counter;
int pos_btn1 = 0;
int pos_btn2 = 856;
int pos_piece = 0;
boolean play = false;
boolean exit = false;

String text_title = "  Connect 4  ";
PFont font;

// Array table
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
  size(1000, 700);
  smooth();
  
  font = loadFont("Monospaced-60.vlw");

  loadImg();
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
  background(236, 240, 241);
  image(img_background, 0, 0);
  tint(236, 240, 241);
  textAlign(CENTER);
  textFont(font, 60);
  rect(0, height/2.8, width, 155);

  typewriteText();
  
  // Pieces
  image(img_piece1, 150, pos_piece);
  image(img_piece2, 800, pos_piece);

  // Buttons
  image(img_btn_start, pos_btn1, height/1.5);
  image(img_btn_exit, pos_btn2, height/1.3);
  
  // Movement
  if(pos_btn1 < width/2.4){
    pos_btn1 = pos_btn1+15;
  }
  if(pos_btn2 > width/2.3){
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
  fill(245);
  textSize(20); 
  text("Coming soon...", width/2, height/2);
}

void drawTable() {
  background (52, 73, 94);
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
}

// Hover effect
void hoverBtn() {
  if (mouseX >= width/2.4 && mouseX <= width/2.4+149 && mouseY >= height/1.5 && mouseY <= height/1.5+45){
    exit = false;
    play = true;
    image(img_btn_start_hover, pos_btn1, height/1.5);
  }
  if (mouseX >= width/2.3 && mouseX <= width/2.3+149 && mouseY >= height/1.3 && mouseY <= height/1.3+45){
    exit = true;
    image(img_btn_exit_hover, pos_btn2, height/1.3);
  }
}
