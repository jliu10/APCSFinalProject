int page, difficulty, map;
Game currentGame, game1;
Button quit, pause, resume, quitYes, quitNo;
ArrayList<Button> gameButtons = new ArrayList<Button>();

color WHITE = color(255);
color BLACK = color(0);
color BLUE = color(52, 146, 235);

void setup() {
  size(1050, 700);
  difficulty = -1;
  map = -1;
  // background(0,225,0);
  //page = 0;//if page is 0 then main menu, 1 is instructions, 2 is map selection
  page = 3;//page 3 is the first map/game
  game1 = new Game(0,0);
  currentGame = game1;
  
  gameButtons.add(quit);
  gameButtons.add(pause);
  gameButtons.add(resume);
  gameButtons.add(quitYes);
  gameButtons.add(quitNo);
}

void draw() {
  switch(page) {
    case 0: // main menu
    case 1: // instructions
    case 2: // map/difficulty selection
      background(BLUE);
      break;
    case 3: // game
      currentGame.run();
      break;
  }
}

void mouseClicked() {
  currentGame.buttonFunctions();
}
