public class Game {
  int lives, money, difficulty, map;
  // Round currentRound;
  boolean done;
  //ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  Block testBlock;
  Bloon testBloon;
  
  Game(int diff) {
    difficulty = diff;
    quit = new Button("QUIT", width/2, height/2, 100, 50, color(184, 46, 0), true);
    lives = 100;
    money = 200;
    // testBlock = new Block(90, 100, 50, 100, 100, false);
    testBlock = new Block(90, 100, 50, 100, 100, false);
    testBloon = new Bloon(testBlock, 0, false, false);
  }
  
  void run() {
    display();
  }
  
  void display() {
    background(153, 227, 79);
    testBlock.display();
    testBloon.display();
    quit.display();
    
    textAlign(LEFT);
    textSize(24);
    fill(BLACK);
    text("Lives: " + lives, 0, 25);
    text("Money: $" + money, 0, 50);
  }
  
  boolean isDone() {
    return done;
  }

}
