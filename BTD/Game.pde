public class Game {
  int lives, money, difficulty, map;
  // Round currentRound;
  boolean done;
  //ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  
  Game() {
    quit = new Button("QUIT", width/2, height/2, 100, 50, color(184, 46, 0), true);
  }
  
  void run() {
    display();
  }
  
  void display() {
    background(153, 227, 79);
    quit.display();
  }
  
  boolean isDone() {
    return done;
  }

}
