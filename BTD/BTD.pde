int page;
Game game1;
Button quit, pause;
Block testBlock;

color WHITE = color(255);
color BLACK = color(0);

void setup() {
  size(800, 700);
  // background(0,225,0);
  //page = 0;//if page is 0 then main menu, 2 is instructions, 3 is map selection
  page = 4;//page 4 is the first map/game
  game1 = new Game();
  testBlock = new Block(90, 100, 50, 100, 100, false);
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
  if(quit.getHovering()) {
    println("quit pressed");
    //quit.toggle();
    //page = 3;
  }
}
