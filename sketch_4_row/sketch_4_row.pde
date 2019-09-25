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
boolean home = false;

String text_title = "  Connect 4  ";
PFont font;

private Tile[][] piece = new Tile[6][7];

/********* IMAGES *********/

PImage img_background;
PImage img_btn_start;
PImage img_btn_start_hover;
PImage img_btn_exit;
PImage img_btn_exit_hover;
PImage img_btn_home;
PImage img_btn_home_hover;
PImage img_piece1;
PImage img_piece2;

/********* SETUP BLOCK *********/

void setup() {
  size(1000, 700);
  smooth();
  
  font = loadFont("Monospaced-60.vlw");

  loadImg();
  
  for(int r = 0; r < 6; r++) {
    for(int c = 0; c < 7; c++) {
      piece[r][c] = new Tile(140 + (c*70), 180 + (r*70));
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
  
  image(img_btn_home, 900, 20);
  
  if (mouseX >= 900 && mouseX <= 900+50 && mouseY >= 20 && mouseY <= 20+50){
    home = true;
    image(img_btn_home_hover, 900, 20);
  }
  
  fill(52, 73, 94);
  textSize(11); 
  text("Developed by Natalia Justicia", width/2, height-20);
}

void drawTable() {
  background(236, 240, 241);
  image(img_background, 0, 0);
  fill(52, 73, 94);
  noStroke();
  rect(100, 140, 502, 430);
  
  for(int r = 0; r < 6; r++) {
    for(int c = 0; c < 7; c++) {
      fill(piece[r][c].getColor());
      ellipse(piece[r][c].getX(), piece[r][c].getY(), 60, 60);
    }
  }
}

/********* INPUTS *********/

public void mousePressed() {
  
    if(play) {
      startGame();
    } 
    if (exit) {
      exit();
    }


      if(home) {
      returnHome();
    } 
}

/********* LOAD ASSETS *********/

void loadImg() {
  img_background = loadImage("bg.jpg");
  img_btn_start = loadImage("btn_start.png");
  img_btn_start_hover = loadImage("btn_start2.png");
  img_btn_exit = loadImage("btn_exit.png");
  img_btn_exit_hover = loadImage("btn_exit2.png");
  img_btn_home = loadImage("btn_home.png");
  img_btn_home_hover = loadImage("btn_home2.png");
  img_piece1 = loadImage("ficha_1.png");
  img_piece2 = loadImage("ficha_2.png");
}

/********* OTHER FUNCTIONS *********/

// Start the game  
void startGame() {
  game_screen = 1;
}

void returnHome() {
  game_screen = 0;
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
    home = false;
    exit = false;
    play = true;
    image(img_btn_start_hover, pos_btn1, height/1.5);
  }
  if (mouseX >= width/2.3 && mouseX <= width/2.3+149 && mouseY >= height/1.3 && mouseY <= height/1.3+45){
    exit = true;
    image(img_btn_exit_hover, pos_btn2, height/1.3);
  }
}

public class Tile {
  private int myColor, myX, myY;
  Tile(int x, int y) {
    myColor = (220);
    myX = x;
    myY = y;
  }
  public int getColor() { return myColor; }
  public void setColor(int mColor) { myColor = mColor; }
  public int getX() { return myX; }
  public int getY() { return myY; }
}
