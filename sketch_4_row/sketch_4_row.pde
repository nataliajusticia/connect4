/***************************************
 VARIABLES 
 ***************************************/
// 
// 0: Pantalla inicial
// 1: Pantalla de juego
// 2: Pantalla game over
int game_screen = 0;
//
// Posiciones
int pos_btn1 = 0;
int pos_btn2 = 856;
int pos_piece = 0;
// 
// Btn: inicio del juego
// Btn: salir
// Btn: volver pantalla inicial 
boolean btn_start = false;
boolean btn_exit = false;
boolean btn_home = false;
//
// Tipografia
String text_title = "  Connect 4  ";
int counter;
PFont font;
//
// Tablero de juego
int[][] table = new int[7][6];
//
// Jugadores
boolean player = true;
boolean move = false;
boolean select = false;
int casillas_ocupadas = 1;
int fichas_j1 = 10;
int fichas_j2 = 10;
int column;
int row = 0;
int posX;
int posY;
//
// Imagenes
PImage img_background;
PImage img_btn_start;
PImage img_btn_start_hover;
PImage img_btn_exit;
PImage img_btn_exit_hover;
PImage img_btn_home;
PImage img_btn_home_hover;
PImage img_piece1;
PImage img_piece2;

/***************************************
 FUNCIONES DE INICIO
 ***************************************/

/**
 * Función setup()
 */
void setup() {
  size(1000, 700);
  frameRate(30);
  smooth();

  loadImg();
}

/**
 * Función draw()
 */
void draw() {
  noStroke();
  background(236, 240, 241);
  image(img_background, 0, 0);

  switch(game_screen) {
  case 0:
    initScreen();
    break;
  case 1:
    gameScreen();
    break;
  case 2:
    checkGame();
    break;
  case 3:
    endGame();
    break;
  }

  fill(52, 73, 94);
  textSize(11); 
  text("Developed by Natalia Justicia", width/2, height-20);
}

/***************************************
 FUNCIONES DE PANTALLA
 ***************************************/

/**
 * Función initScreen()
 * Pantalla principal del juego - menu
 */
void initScreen() { 
  rect(0, height/2.8, width, 155);

  // Titulo del juego
  textAlign(CENTER);
  textSize(60);
  if (counter < text_title.length())
    counter++;
  shadowText(text_title.substring(0, counter), width/2, height/2, 3);

  // Fichas del juego
  image(img_piece1, 150, pos_piece);
  image(img_piece2, 800, pos_piece);

  // Botones pantalla inicial
  image(img_btn_start, pos_btn1, height/1.5);
  image(img_btn_exit, pos_btn2, height/1.3);

  // Movimiento
  if (pos_btn1 < width/2.4) {
    pos_btn1 = pos_btn1+15;
  }
  if (pos_btn2 > width/2.3) {
    pos_btn2 = pos_btn2-15;
  }
  if (pos_piece < height/2.4) {
    pos_piece = pos_piece+10;
  }

  // Funcionalidad botón
  if (mouseX >= width/2.4 && mouseX <= width/2.4+149 && mouseY >= height/1.5 && mouseY <= height/1.5+45) {
    btn_start = true;
    btn_home = false;
    image(img_btn_start_hover, pos_btn1, height/1.5);
  } else {
    btn_start = false;
  }
  if (mouseX >= width/2.3 && mouseX <= width/2.3+149 && mouseY >= height/1.3 && mouseY <= height/1.3+45) {
    btn_exit = true;
    image(img_btn_exit_hover, pos_btn2, height/1.3);
  } else {
    btn_exit = false;
  }
}

/**
 * Función gameScreen()
 * Pantalla de juego
 */
void gameScreen() {
  drawTable();
  playGame();
}

/**
 * Función checkGame()
 */
void checkGame() {
}

/**
 * Función endGame()
 */
void endGame() {
}

/***************************************
 FUNCIONES DE DIBUJO
 ***************************************/

/**
 * Función drawTable()
 * Dibujo de la tabla, botones y fichas
 */
void drawTable() {
  rect(100, 140, 505, 430, 25);

  // Botón
  image(img_btn_home, 900, 20);
  if (mouseX >= 900 && mouseX <= 900+50 && mouseY >= 20 && mouseY <= 20+50) {
    btn_home = true;
    image(img_btn_home_hover, 900, 20);
  } else {
    btn_home = false;
  }

  // Tablero
  for (int r = 0; r < 6; r++) {
    for (int c = 0; c < 7; c++) {
      fill(255);
      ellipse(151+r*80, 180+c*70, 60, 60);
    }
  }

  // Fichas
  for (int i=1; i<=fichas_j1; i++) {
    image(img_piece1, 750, 200+20*i);
  }
  for (int i=1; i<=fichas_j2; i++) {
    image(img_piece2, 850, 200+20*i);
  }
}

/***************************************
 FUNCIONES DE INTERACCION
 ***************************************/

/**
 * Función mousePressed()
 * Intercepta la pulsación de un botón del ratón
 */
public void mousePressed() {
  if (btn_start) {
    game_screen = 1;
  } 
  if (btn_exit) {
    exit();
  }
  if (btn_home) {
    game_screen = 0;
  }
  if (select) {
    move = true;
  }
}

/***************************************
 FUNCIONES DE JUGADOR
 ***************************************/

public void playGame() {
  if (player) {
    fill(52, 73, 94);
    text("Turno del Jugador 1", 800, 50);

    if (mouseX > 120 && mouseX < 600 || move == true) {
      if (move == false) {
        image(img_piece1, mouseX-31, 70);

        if (mouseX > 120 && mouseX < 180) {
          select = true;
          column = 1;
        } else if (mouseX > 200 && mouseX < 260) {
          column = 2;
          select = true;
        } else if (mouseX > 280 && mouseX < 340) {
          column = 3;
          select = true;
        } else if (mouseX > 360 && mouseX < 420) {
          column = 4;
          select = true;
        } else if (mouseX > 440 && mouseX < 500) {
          select = true;
          column = 5;
        } else if (mouseX > 520 && mouseX < 580) {
          column = 6;
          select = true;
        } else if (mouseX > 600 && mouseX < 660) {
          column = 7;
          select = true;
        }
      } else {
        switch (column) {
        case 1:
          posX = 120;
          break;
        case 2:
          posX = 200;
          break;
        case 3:
          posX = 280;
          break;
        case 4:
          posX = 360;
          break;
        case 5:
          posX = 440;
          break;
        case 6:
          posX = 520;
          break;
        case 7:
          posX = 600;
          break;
        }
        image(img_piece1, posX, 500);
        fichas_j1 = fichas_j1 - 1;
        move = false;
        player = false;
        select = false;
      }
    }
  } else {
    fill(52, 73, 94);
    text("Turno del Jugador 2", 800, 50);

    if (mouseX > 120 && mouseX < 600) {
      if (move == false) {
        image(img_piece2, mouseX-31, 70);

        if (mouseX > 120 && mouseX < 180) {
          select = true;
          column = 1;
        } else if (mouseX > 200 && mouseX < 260) {
          column = 2;
          select = true;
        } else if (mouseX > 280 && mouseX < 340) {
          column = 3;
          select = true;
        } else if (mouseX > 360 && mouseX < 420) {
          column = 4;
          select = true;
        } else if (mouseX > 440 && mouseX < 500) {
          select = true;
          column = 5;
        } else if (mouseX > 520 && mouseX < 580) {
          column = 6;
          select = true;
        } else if (mouseX > 600 && mouseX < 660) {
          column = 7;
          select = true;
        }
      } else {
        switch (column) {
        case 1:
          posX = 120;
          break;
        case 2:
          posX = 200;
          break;
        case 3:
          posX = 280;
          break;
        case 4:
          posX = 360;
          break;
        case 5:
          posX = 440;
          break;
        case 6:
          posX = 520;
          break;
        case 7:
          posX = 600;
          break;
        }
        image(img_piece2, posX, 500);
        fichas_j2 = fichas_j2 - 1;
        move = false;
        player = true;
        select = false;
      }
    }
  }
}

/***************************************
 FUNCIONES DE EFECTOS
 ***************************************/

void shadowText (String s, float x, float y, int o) {
  fill(245, 100);
  text(s, x+o, y+o);
  fill(245);
  text(s, x, y);
}

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
