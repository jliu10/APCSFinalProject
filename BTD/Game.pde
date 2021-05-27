import java.util.*;

public class Game {
  int lives, money, difficulty;
  // Round currentRound;
  boolean done;
  float speed, lastSpeed;
  //ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  ArrayList<Bloon> bloons;
  Track gameTrack;
  //Bloon testBloon;
  
  Game(int diff, int map) {
    bloons = new ArrayList<Bloon>();
    gameTrack = new Track(map);
    speed = 1;
    lastSpeed = 1;
    difficulty = diff;
    quit = new Button("QUIT", width - 55, height - 30, 100, 50, color(184, 46, 0), true);
    pause = new Button("PAUSE", width - 180, height - 30, 130, 50, color(150), true);
    resume = new Button("PLAY", width - 180, height - 30, 130, 50, color(150), false);
    lives = 100;
    money = 200;
    
    bloons.add(new Bloon(gameTrack.getStart(), 0, false));
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
    
    rectMode(CORNERS);
    noStroke();
    fill(52, 146, 235);
    rect(width, height, width - 251, 0);
    
    quit.display();
    pause.display();
    resume.display();
    
    textAlign(LEFT);
    textSize(24);
    fill(255);
    text("Round: ", width - 250, 25);
    text("Lives: " + lives, width - 250, 50);
    text("Money: $" + money, width - 250, 75);
  }
  
  boolean isDone() {
    return done;
  }
  
  void buttonFunctions() {
    if(quit.getActive() && quit.getHovering()) {
      println("quit pressed");
      //quit.toggle();
      //page = 3;
    }
    else if(pause.getActive() && pause.getHovering()) {
      lastSpeed = speed;
      speed = 0;
      pause.toggle();
      resume.toggle();
    }
    else if(!pause.getActive() && resume.getHovering()) {
      speed = lastSpeed;
      pause.toggle();
      resume.toggle();
    }
  }
  
  float getSpeed() {
    return speed;
  }

}
