public class Game {
  int lives, money, difficulty, map;
  // Round currentRound;
  boolean done;
  //ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  
  void run() {
    display();
  }
  
  void display() {
    background(153, 227, 79);
  }
  
  boolean isDone() {
    return done;
  }
}
