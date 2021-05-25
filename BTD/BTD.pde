int page;
Game game1;

void setup() {
  size(800, 700);
  // background(0,225,0);
  //page = 0;//if page is 0 then main menu, 2 is instruction, 3 is map selection
  page = 4;//page 4 is the first map/game
  game1 = new Game();
}

void draw() {
  switch(page) {
    case 4:
      game1.run();
  }
}
