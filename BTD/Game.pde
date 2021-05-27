import java.util.*;

public class Game {
  int lives, money, difficulty, map;
  // Round currentRound;
  boolean done;
  //ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  ArrayList<Bloon> bloons;
  ArrayDeque<Block> track1;
  //Bloon testBloon;
  
  Game(int diff) {
    bloons = new ArrayList<Bloon>();
    track1 = new ArrayDeque<Block>();
    difficulty = diff;
    quit = new Button("QUIT", width/2, height/2, 100, 50, color(184, 46, 0), true);
    lives = 100;
    money = 200;
    Block testBlock = new Block(90, 100, 50, 100, 100);
    bloons.add(new Bloon(testBlock, 0, false, false));
    track1.add(testBlock);
    
    Block testBlock1 = new Block(0, 100, 50, 100, 150);
    testBlock.setNextBlock(testBlock1);
    track1.add(testBlock1);
    
    Block testBlock2 = new Block(90, 100, 50, 200, 150);
    testBlock1.setNextBlock(testBlock2);
    track1.add(testBlock2);
  }
  
  void run() {
    for(int i = 0; i < bloons.size(); i++) {
      Bloon b = bloons.get(i);
      if(b.getCurrentBlock() == track1.getLast()) {
        bloons.remove(b);
        lives--;
      }
    }
    if(lives <= 0) done = true;
    display();
  }
  
  void display() {
    background(153, 227, 79);
    for(Block b : track1) {
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
