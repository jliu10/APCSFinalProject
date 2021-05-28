int page, difficulty, map;
Game currentGame, game1;
Button quit, pause, resume, quitYes, quitNo, map1, mainMenu;
ArrayList<Button> gameButtons = new ArrayList<Button>();
ArrayList<Button> mapSelectionButtons = new ArrayList<Button>();

color WHITE = color(255);
color BLACK = color(0);
color BLUE = color(52, 146, 235);

void setup() {
  size(1050, 700);
  difficulty = -1;
  map = -1;
  map1 = new Button("MAP1", width/2, height/2, 300, 100, BLUE, false); // change to flase
  mainMenu = new Button("BACK", 110, 60, 200, 100, BLUE, false); // change to false
  mapSelectionButtons.add(map1);
  mapSelectionButtons.add(mainMenu);
  
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
      map1.display();
      mainMenu.display();
      break;
    case 3: // game
      currentGame.run();
      break;
  }
}

void mouseClicked() {
  switch(page) {
    case 0:
      break;
    case 1:
      break;
    case 2:
      if(map1.getActive() && map1.getHovering()) {
        for(Button b : mapSelectionButtons) {
          b.toggle();
        }
        page = 3;
      }
      else if(mainMenu.getActive() && mainMenu.getHovering()) {
        for(Button b : mapSelectionButtons) {
          b.toggle();
        }
        page = 0;
      }
      break;
    case 3:
      currentGame.buttonFunctions();
      break;
  }
}
