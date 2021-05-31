import java.util.*;

public class Game {
  int lives, money, difficulty, placeTower;
  // Round currentRound;
  boolean done, quitConfirm, wasPaused, placing, valid;
  float speed, lastSpeed;
  ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  ArrayList<Bloon> bloons;
  Track gameTrack;
  ArrayDeque<Button> buttonQ;
  
  Game(int diff, int map) {
    bloons = new ArrayList<Bloon>();
    towers = new ArrayList<Tower>();
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
    buyIceTower = new BuyButton("Ice", "$255", width - 62.5, 155, 100, 100, 12, 24, BLUE, true, iceImage);
    
    lives = 100;
    money = 650;
    
    buttonQ.add(buyDartTower);
    buttonQ.add(buyIceTower);
    buttonQ.add(new BuyButton("Dart3", "$170", width - 187.5, 600, 100, 100, 12, 24, BLUE, true, dartImage));
    
    bloons.add(new Bloon(gameTrack.getStart(), 2, false));
    
    //Testing IceTower
    //towers.add(new IceTower(525,350));
  }
  
  void run() {
    for(int i = 0; i < bloons.size(); i++) {
      Bloon b = bloons.get(i);
      if(b.getCurrentBlock() == gameTrack.getLast()) {
        bloons.remove(b);
        lives -= b.getType() + 1;
      }
    }
    
    
    float r = 0;
    switch(placeTower) { // tower radius
      case 0:
        break;
      case 1:
        r = 20;
        break;
    }
    valid = true;
    for(Block b : gameTrack.getDeque()) { // invalid on track
      if(abs(mouseX - b.getX()) <= b.getLength()/2 + r && abs(mouseY - b.getY()) <= b.getWidth()/2 + r) {
        valid = false;
      }
    }
    for(Tower t : towers) { // invalid on towers
      if(dist(mouseX, mouseY, t.getPos()[0], t.getPos()[1]) <= t.getRad() + r) {
        valid = false;
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
    for(Tower t : towers) {
      t.display();
    }
    
    if(placing) {
      if(mouseX < width - 250) {
        switch(placeTower) {
          case 0: // dart tower
            break;
          case 1: // ice tower
            if(valid) fill(0, 0, 0, 100);
            else fill(255, 0, 0, 100);
            ellipseMode(RADIUS);
            circle(mouseX, mouseY, 20);
            noStroke();
            circle(mouseX, mouseY, 200);
            break;
        }
      }
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
  ArrayList<Tower> getTowers() {
    return towers;
  }
  void sellTower(Tower t) {
    money += (int)(t.getValue()*6/10);
    t = null;
  }
  
  void leftMB() {
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
    else if(buyDartTower.getHovering()) {
      println("bought dart tower");
    }
    else if(buyIceTower.getHovering() && money >= 255) {
      println("bought ice tower");
      placing = true;
      placeTower = 1;
    }
    else if(placing && valid) {
      placing = false;
      switch(placeTower) {
        case 0: // dart tower
          break;
        case 1: // ice tower
          towers.add(new IceTower(mouseX, mouseY));
          money -= 255;
          break;
      }
    }
  }
  
  void rightMB() {
    placing = false;
  }
  
  void scrollFunctions(int e) {
    if(mouseX > width - 250 && mouseY > 100 && mouseY < height - 130) {
      if(e < 0 && buttonQ.getFirst().getY() < 155) { // scrolling up
          for(Button b : buttonQ) {
            b.setY(b.getY() - e);
          }
      }
      else if(e > 0 && buttonQ.getLast().getY() > height - 185) { // scrolling down
        for(Button b : buttonQ) {
          b.setY(b.getY() - e);
        }
      }
    }
  }
  
  ArrayList<Bloon> getBloons() {
    return bloons;
  }
}
