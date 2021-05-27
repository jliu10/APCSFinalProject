import java.util.*;

public class Game {
  int lives, money, difficulty;
  // Round currentRound;
  boolean done;
  //ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  ArrayList<Bloon> bloons;
  Track gameTrack;
  //Bloon testBloon;
  
  Game(int diff, int map) {
    bloons = new ArrayList<Bloon>();
    gameTrack = new Track(map);
    difficulty = diff;
    quit = new Button("QUIT", width/2, height/2, 100, 50, color(184, 46, 0), true);
    lives = 100;
    money = 200;
    
    bloons.add(new Bloon(gameTrack.getStart(), 0, false, false));
  }
  
  void run() {
    for(int i = 0; i < bloons.size(); i++) {
      Bloon b = bloons.get(i);
      if(b.getCurrentBlock() == gameTrack.getLast()) {
        bloons.remove(b);
        lives--;
      }
    }
    if(lives <= 0) done = true;
    display();
  }
  
  void display() {
    background(153, 227, 79);
    for(Block b : gameTrack.getDeque()) {
      b.display();
    }
    //testBlock.display();
    for(Bloon b : bloons) {
      b.display();
    }
    quit.display();
    
    textAlign(LEFT);
    textSize(24);
    fill(0);
    text("Lives: " + lives, 0, 25);
    text("Money: $" + money, 0, 50);
  }
  
  boolean isDone() {
    return done;
  }
  
  void buttonFunctions() {
    if(quit.getHovering()) {
      println("quit pressed");
      //quit.toggle();
      //page = 3;
    }
  }

}
