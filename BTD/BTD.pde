int page, difficulty, map;
Game currentGame;
Button quit, pause, resume, quitYes, quitNo, map1, mainMenu, play, instructions, startBattle;
ArrayList<Button> gameButtons = new ArrayList<Button>();
ArrayList<Button> mapSelectionButtons = new ArrayList<Button>();
ArrayList<Button> menuButtons = new ArrayList<Button>();
ArrayList<Button> instructionsButtons = new ArrayList<Button>();

color WHITE = color(255);
color BLACK = color(0);
color BLUE = color(52, 146, 235);

void setup() {
  size(1050, 700);
  difficulty = 0;
  map = 0;
  map1 = new Button("MAP1", width/2, height/2, 300, 100, 80, BLUE, false); // change to flase
  mainMenu = new Button("BACK", 110, 60, 200, 100, 80, BLUE, false); // change to false
  mapSelectionButtons.add(map1);
  mapSelectionButtons.add(mainMenu);
  instructionsButtons.add(mainMenu);
  play = new Button("PLAY", width/2, height/2, 300, 100, 80, color(0, 220, 0), true);
  instructions = new Button("How to Play", width/2, height/2 + 150, 500, 100, 80, BLUE, true);
  menuButtons.add(play);
  menuButtons.add(instructions);
  
  //if page is 0 then main menu, 1 is instructions, 2 is map selection
  page = 0;//page 3 is the first map/game
  currentGame = new Game(0, 0);
  
  gameButtons.add(quit);
  gameButtons.add(pause);
  gameButtons.add(resume);
  gameButtons.add(quitYes);
  gameButtons.add(quitNo);
}

void draw() {
  switch(page) {
    case 0: // main menu
      background(BLUE);
      play.display();
      instructions.display();
      textAlign(CENTER);
      textSize(100);
      textLeading(80);
      fill(255);
      text("BLOONS\nTOWER\nDEFENSE", width/2, 100);
      break;
    case 1: // instructions
      background(BLUE);
      mainMenu.display();
      break;
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
      if(play.getHovering()) {
        for(Button b : mapSelectionButtons) {
          b.toggle();
        }
        for(Button b : menuButtons) {
          b.toggle();
        }
        page = 2;
      }
      if(instructions.getHovering()) {
        for(Button b : instructionsButtons) {
          b.toggle();
        }
        for(Button b : menuButtons) {
          b.toggle();
        }
        page = 1;
      }
      break;
    case 1:
      if(mainMenu.getHovering()) {
        for(Button b : instructionsButtons) {
          b.toggle();
        }
        for(Button b : menuButtons) {
          b.toggle();
        }
        page = 0;
      }
      break;
    case 2:
      if(map1.getHovering()) {
        for(Button b : mapSelectionButtons) {
          b.toggle();
        }
        map = 0;
        currentGame = new Game(difficulty, map);
        page = 3;
      }
      else if(mainMenu.getHovering()) {
        for(Button b : mapSelectionButtons) {
          b.toggle();
        }
        for(Button b : menuButtons) {
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
