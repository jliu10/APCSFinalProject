int page, difficulty, map;
Game currentGame, game1;
Button quit, pause, resume;

color WHITE = color(255);
color BLACK = color(0);

void setup() {
  size(1050, 700);
  difficulty = -1;
  map = -1;
  // background(0,225,0);
  //page = 0;//if page is 0 then main menu, 2 is instructions, 3 is map selection
  page = 4;//page 4 is the first map/game
  game1 = new Game(0,0);
  currentGame = game1;
}

void draw() {
  switch(page) {
    case 3:
      //background(150);
      break;
    case 4:
      game1.run();
      break;
  }
}

void mouseClicked() {
  game1.buttonFunctions();
}
