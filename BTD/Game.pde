public class Game {
  int lives, money, difficulty, map;
  // Round currentRound;
  boolean done;
  //ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  
  Game(int diff) {
    difficulty = diff;
    quit = new Button("QUIT", width/2, height/2, 100, 50, color(184, 46, 0), true);
    lives = 100;
    money = 200;
  }
  
  void run() {
    display();
  }
  
  void display() {
    background(153, 227, 79);
    testBlock.display();
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
