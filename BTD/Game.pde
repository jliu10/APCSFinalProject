import java.util.*;

public class Game {
  int lives, money, difficulty;
  // Round currentRound;
  boolean done, quitConfirm, wasPaused;
  float speed, lastSpeed;
  //ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  ArrayList<Bloon> bloons;
  Track gameTrack;
  ArrayDeque<Button> buttonQ;
  
  Game(int diff, int map) {
    bloons = new ArrayList<Bloon>();
    buttonQ = new ArrayDeque<Button>();
    gameTrack = new Track(map);
    speed = 1;
    lastSpeed = 1;
    difficulty = diff;
    
    quit = new Button("QUIT", width - 55, height - 30, 100, 50, 40, color(184, 46, 0), true);
    quitYes = new Button("Yes", width - 175, height - 30, 80, 50, 40, color(184, 46, 0), false);
    quitNo = new Button("No", width - 70, height - 30, 80, 50, 40, BLUE, false);
    pause = new Button("PAUSE", width - 180, height - 30, 130, 50, 40, color(150), true);
    resume = new Button("PLAY", width - 180, height - 30, 130, 50, 40, color(150), false);
    startBattle = new Button("START BATTLE", width - 125, height - 100, 220, 50, 25, color(0, 220, 0), true);
    buyDartTower = new BuyButton("Dart", "$170", width - 187.5, 155, 100, 100, 12, 24, BLUE, true, dartImage);
    
    lives = 100;
    money = 650;
    
    buttonQ.add(buyDartTower);
    buttonQ.add(new BuyButton("Dart2", "$170", width - 62.5, 155, 100, 100, 12, 24, BLUE, true, dartImage));
    buttonQ.add(new BuyButton("Dart3", "$170", width - 187.5, 600, 100, 100, 12, 24, BLUE, true, dartImage));
    
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
    for(Bloon b : bloons) {
      b.display();
    }
    
    rectMode(CORNERS);
    fill(BLUE);
    stroke(0);
    strokeWeight(2);
    rect(width, height, width - 251, 0);
    
    // TOWER SELECTION STUFF HERE
    //buyDartTower.display();
    for(Button b : buttonQ) {
      b.display();
    }
    
    rectMode(CORNERS);
    fill(0,0,0,0);
    stroke(0);
    strokeWeight(2);
    //noStroke();
    //noFill();
    rect(width - 250, 100, width, 570);
    
    rectMode(CORNERS);
    fill(BLUE);
    //noStroke();
    rect(width - 250, 0, width, 100);
    rect(width - 250, height - 130, width, height);
    
    quit.display();
    pause.display();
    resume.display();
    startBattle.display();
    
    textAlign(LEFT);
    textSize(24);
    fill(255);
    textLeading(25);
    text("Round: \nLives: " + lives + "\nMoney: $" + money, width - 245, 25);
    
    if(quitConfirm) {
      fill(BLUE);
      stroke(0);
      strokeWeight(2);
      rectMode(CORNERS);
      rect(width, height, width - 250, height - 90);
      fill(255);
      textAlign(CENTER);
      textSize(12);
      text("Are you sure you want to quit?", width - 125, height - 65);
      if(!quitYes.getActive()) quitYes.toggle();
      if(!quitNo.getActive()) quitNo.toggle();
      quitYes.display();
      quitNo.display();
    }
  }
  
  boolean isDone() {
    return done;
  }
  
  float getSpeed() {
    return speed;
  }
  
  void sellTower(Tower t) {
    money += (int)(t.getValue()*6/10);
    t = null;
  }
  
  void buttonFunctions() {
    if(quit.getActive() && quit.getHovering()) {
      quitConfirm = true;
      println("quit pressed");
      quit.toggle();
      if(pause.getActive()) pause.toggle();
      else resume.toggle();
    }
    else if(quitYes.getActive() && quitYes.getHovering()) {
      for(Button b : gameButtons) {
        if(b.getActive()) b.toggle();
      }
      page = 2;
      for(Button b : mapSelectionButtons) {
        b.toggle();
      }
      // toggle off all buttons
    }
    else if(quitNo.getActive() && quitNo.getHovering()) {
      quitConfirm = false;
      quit.toggle();
      quitYes.toggle();
      quitNo.toggle();
      if(wasPaused) resume.toggle();
      else pause.toggle();
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
    else if(startBattle.getActive() && startBattle.getHovering()) {
      println("battle started");
      startBattle.toggle();
    }
  }
  
  void scrollFunctions(int e) {
    // e > 0 means down; vice versa
    if(mouseX > width - 250 && mouseY > 100 && mouseY < height - 130) {
      println(e);
      if(e < 0 && buttonQ.getFirst().getY() > 155) {
        for(Button b : buttonQ) {
          b.setY(b.getY() + e);
        }
      }
      else if(e > 0 && buttonQ.getLast().getY() > height - 185) {
        for(Button b : buttonQ) {
          b.setY(b.getY() + e);
        }
      }
    }
  }
  
}
