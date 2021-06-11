int page, difficulty, map;
Game currentGame;
Button quit, pause, resume, quitYes, quitNo, map1, mainMenu, play, instructions, startBattle, buyDartTower, buyIceTower, buyCannon, sell, buyLongRangeDarts, buyPiercingDarts, buyExtraRangeBombs, buyBiggerBombs, buyTackTower, buyFasterShooting, buyExtraRangeTacks, buyLongFreezeTime, buyWideFreezeRadius, map2;
ArrayList<Button> gameButtons = new ArrayList<Button>();
ArrayList<Button> mapSelectionButtons = new ArrayList<Button>();
ArrayList<Button> menuButtons = new ArrayList<Button>();
ArrayList<Button> instructionsButtons = new ArrayList<Button>();
PImage dartImage, iceImage, cannonImage, longRangeDartsImage, piercingDartsImage, extraRangeBombsImage, biggerBombsImage, tackImage, fasterShootingImage, extraRangeTacksImage, wideFreezeRadiusImage, longFreezeTimeImage;
// Slider speedSlider;

color WHITE = color(255);
color BLACK = color(0);
color BLUE = color(52, 146, 235);

void setup() {
  size(1050, 700);
  difficulty = 0;
  map = 0;
  map1 = new Button("GRASSY", width/2, height/2 - 60, 300, 100, 80, BLUE, false);
  map2 = new Button("SNOWY", width/2, height/2 + 60, 300, 100, 80, BLUE, false);
  mainMenu = new Button("BACK", 110, 60, 200, 100, 80, BLUE, false); // change to false
  mapSelectionButtons.add(map1);
  mapSelectionButtons.add(map2);
  mapSelectionButtons.add(mainMenu);
  instructionsButtons.add(mainMenu);
  play = new Button("PLAY", width/2, height/2, 300, 100, 80, color(0, 220, 0), true);
  instructions = new Button("How to Play", width/2, height/2 + 150, 500, 100, 80, BLUE, true);
  menuButtons.add(play);
  menuButtons.add(instructions);
  
  //if page is 0 then main menu, 1 is instructions, 2 is map selection
  page = 0;
  currentGame = new Game(0, 0);
  
  gameButtons.add(quit);
  gameButtons.add(pause);
  gameButtons.add(resume);
  gameButtons.add(quitYes);
  gameButtons.add(quitNo);
  gameButtons.add(startBattle);
  gameButtons.add(buyDartTower);
  gameButtons.add(buyIceTower);
  gameButtons.add(buyCannon);
  gameButtons.add(sell);
  gameButtons.add(buyLongRangeDarts); // $90
  gameButtons.add(buyPiercingDarts); // $205
  gameButtons.add(buyExtraRangeBombs); // $200
  gameButtons.add(buyBiggerBombs); // $350
  gameButtons.add(buyTackTower); // $400
  gameButtons.add(buyFasterShooting); // $250
  gameButtons.add(buyExtraRangeTacks); // $150
  gameButtons.add(buyWideFreezeRadius); // $300
  gameButtons.add(buyLongFreezeTime); // $450
  
  
  
  dartImage = loadImage("Dart.png");
  iceImage = loadImage("Ice.png");
  cannonImage = loadImage("Cannon.png");
  longRangeDartsImage = loadImage("LongRangeDarts.png");
  piercingDartsImage = loadImage("PiercingDarts.png");
  extraRangeBombsImage = loadImage("ExtraRangeBombs.png");
  biggerBombsImage = loadImage("BiggerBombs.png");
  tackImage = loadImage("TackTower.png");
  fasterShootingImage = loadImage("FasterShooting.png");
  extraRangeTacksImage = loadImage("ExtraRangeTacks.png");
  wideFreezeRadiusImage = loadImage("WideFreezeRadius.png");
  longFreezeTimeImage = loadImage("LongFreezeTime.png");
  
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
      fill(255);
      textAlign(CENTER);
      textSize(36);
      textLeading(36);
      text("Objective:\nSurvive the Bloons!", width/2, 80);
      textSize(24);
      textLeading(24);
      text("After choosing a map, you have a selection of towers you can buy and place." +
        "\n Each tower does something different, but they all help with the goal: stopping" +
        "\n Bloons from reaching the end of the track! Bloons start to spawn after clicking" +
        "\n'Start Battle'. Bloons, which come in various types, move along the track to the end." +
        "\nRed Bloons are totally destroyed when popped, but other Bloons, when popped, release" +
        "\na Bloon that is one tier below it. Here is what each tower does:", width/2, 180);
      textAlign(LEFT);
      textLeading(30);
      text("- DART TOWER: Shoots darts at a Bloon in range" +
        "\n- ICE TOWER: Periodically briefly freezes Bloons in range. Frozen" +
        "\n      Bloons cannot be popped by darts" +
        "\n- CANNON: Shoots explosive cannonballs at a Bloon in range. The" +
        "\n      explosions damage Bloons caught in it" +
        "\n- TACK TOWER: Periodically shoots tacks in 8 directions when a Bloon" +
        "\n      is in range", 120, 340);
      textAlign(CENTER);
      textLeading(24);
      text("Popping Bloons grants money, which you can spend to buy towers or upgrades for" +
      "\nexisting towers. Addtionally, you get bonus money after surviing a round. If a Bloon" +
      "\nreaches the end of the track, you lose life! So spend money wisely, and don't let the" +
      "\nevil Bloons win!!!", width/2, 560);
        
      mainMenu.display();
      break;
    case 2: // map/difficulty selection
      background(BLUE);
      map1.display();
      map2.display();
      mainMenu.display();
      break;
    case 3: // game
      currentGame.run();
      break;
    case 4: // defeat screen
      background(30);
      fill(200, 0, 0);
      textAlign(CENTER);
      textSize(36);
      text("D E F E A T", width/2, 300);
      fill(255);
      textSize(24);
      text("You died to balloons. Bruh.", width/2, 400);
      break;
    case 5: // victory screen
      background(0, 200, 0);
      fill(255, 238, 0);
      textAlign(CENTER);
      textSize(36);
      text("V I C T O R Y", width/2, 300);
      fill(255);
      textSize(24);
      text("You won!!!!!!!", width/2, 400);
      break;
  }
}

void mouseClicked() {
  if(mouseButton == 37) {
    switch(page) {
      case 0: // main menu
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
      case 1: // instructions
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
      case 2: // map selection
        if(map1.getHovering()) {
          for(Button b : mapSelectionButtons) {
            b.toggle();
          }
          map = 0;
          currentGame = new Game(difficulty, map);
          page = 3;
        }
        else if(map2.getHovering()) {
          for(Button b : mapSelectionButtons) {
            b.toggle();
          }
          map = 1;
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
      case 3: // game
        currentGame.leftMB();
        break;
    }
  }
  if(mouseButton == 39) {
    currentGame.rightMB();
  }
}

void mouseWheel(MouseEvent event) {
  // println(event.getCount());
  switch(page) {
    case 3:
      currentGame.scrollFunctions(event.getCount());
      break;
  }
}
  
void mouseDragged() {
  if(mouseButton == 37) currentGame.leftPressedFunctions();
}

void mouseReleased() {
  if(mouseButton == 37) currentGame.leftReleasedFunctions();
}
