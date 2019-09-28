/********* VARIABLES *********/
// 
// Player 1
boolean player1_move = true;
// 
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen 
int game_screen = 0;
//
// Button position 
int pos_btn1 = 0;
int pos_btn2 = 856;
int pos_piece = 0;
// 
// Start Game
// Exit Game
// Return Home 
boolean btn_start = false;
boolean btn_exit = false;
boolean btn_home = false;
//
// Typography
String text_title = "  Connect 4  ";
int counter;
PFont font;
//
// Table
private Tile[][] piece = new Tile[6][7];
//
// Images
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
  frameRate(30);
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
  noStroke();
  background(236, 240, 241);
  image(img_background, 0, 0);
  
  switch(game_screen){
    case 0:
      initScreen();
      break;
    case 1:
      gameScreen();
      break;
  }
}

void drawTable() {
  rect(100, 140, 502, 430);
  
  for(int r = 0; r < 6; r++) {
    for(int c = 0; c < 7; c++) {
      fill(piece[r][c].getColor());
      ellipse(piece[r][c].getX(), piece[r][c].getY(), 60, 60);
    }
  }
  
  for(int i=1;i<=21;i++){
   image(img_piece1, 750, 100+20*i);
  }
  
  for(int i=1;i<=21;i++){
   image(img_piece2, 850, 100+20*i);
  }
}

/********* SCREEN CONTENTS *********/

void initScreen() { 
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
    btn_home = true;
    image(img_btn_home_hover, 900, 20);
  } else {
    btn_home = false;
  }
  
  playGame();
  
  fill(52, 73, 94);
  textSize(11); 
  text("Developed by Natalia Justicia", width/2, height-20);
}

/********* INPUTS *********/

public void mousePressed() {
    if(btn_start) {
      startGame();
    } 
    if (btn_exit) {
      exit();
    }
    if(btn_home) {
      returnHome();
    } 
}

/********* PLAYER FUNCTIONS *********/

public void playGame() {
  if(player1_move)
      player1();
  else
      player2();
}
    
void player1() {
  fill(52, 73, 94);
  text("Turn of Player 1", 800, 70);
  
  if(mouseX > 110 && mouseX < 170)
      image(img_piece1, 110, 70);
  else if(mouseX > 180 && mouseX < 240)
      image(img_piece1, 180, 70);
  else if(mouseX > 250 && mouseX < 310)
      image(img_piece1, 250, 70);
  else if(mouseX > 320 && mouseX < 380)
      image(img_piece1, 320, 70);
  else if(mouseX > 390 && mouseX < 450)
      image(img_piece1, 390, 70);
  else if(mouseX > 460 && mouseX < 520)
      image(img_piece1, 460, 70);  
  else if(mouseX > 530 && mouseX < 590)
      image(img_piece1, 530, 70);
}

void player2() {
  fill(52, 73, 94);
  text("Turn of Player 2", 800, 70);
  
  if(mouseX > 110 && mouseX < 170)
      image(img_piece2, 110, 70);
  else if(mouseX > 180 && mouseX < 240)
      image(img_piece2, 180, 70);
  else if(mouseX > 250 && mouseX < 310)
      image(img_piece2, 250, 70);
  else if(mouseX > 320 && mouseX < 380)
      image(img_piece2, 320, 70);
  else if(mouseX > 390 && mouseX < 450)
      image(img_piece2, 390, 70);
  else if(mouseX > 460 && mouseX < 520)
      image(img_piece2, 460, 70);  
  else if(mouseX > 530 && mouseX < 590)
      image(img_piece2, 530, 70);
}

/********* OTHER FUNCTIONS *********/

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
    btn_start = true;
    btn_home = false;
    image(img_btn_start_hover, pos_btn1, height/1.5);
  } else {
    btn_start = false;
  }
  
  if (mouseX >= width/2.3 && mouseX <= width/2.3+149 && mouseY >= height/1.3 && mouseY <= height/1.3+45){
    btn_exit = true;
    image(img_btn_exit_hover, pos_btn2, height/1.3);
  } else {
    btn_exit = false;
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
