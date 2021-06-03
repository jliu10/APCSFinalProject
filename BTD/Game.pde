import java.util.*;

public class Game {
  int lives, money, difficulty, placeTower, roundNumber, counter, currentTime;
  // don't need roundStartTime?
  Round currentRound;
  boolean done, quitConfirm, wasPaused, placing, valid;
  float speed, lastSpeed;
  Tower selectedTower;
  ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  ArrayList<Bloon> bloons;
  ArrayList<int[]> spawns; // {bloon type, camo (0 or 1), spawn time}
  Track gameTrack;
  ArrayDeque<Button> buttonQ;
  
  Game(int diff, int map) {
    bloons = new ArrayList<Bloon>();
    towers = new ArrayList<Tower>();
    buttonQ = new ArrayDeque<Button>();
    gameTrack = new Track(map);
    spawns = new ArrayList<int[]>();
    speed = 1;
    lastSpeed = 1;
    difficulty = diff;
    roundNumber = 1;
    // counter = 1000;
    
    quit = new Button("QUIT", width - 55, height - 30, 100, 50, 40, color(184, 46, 0), true);
    quitYes = new Button("Yes", width - 175, height - 30, 80, 50, 40, color(184, 46, 0), false);
    quitNo = new Button("No", width - 70, height - 30, 80, 50, 40, BLUE, false);
    pause = new Button("PAUSE", width - 180, height - 30, 130, 50, 40, color(150), true);
    resume = new Button("PLAY", width - 180, height - 30, 130, 50, 40, color(150), false);
    startBattle = new Button("START BATTLE", width - 180, height - 100, 130, 50, 16, color(0, 220, 0), true);
    sell = new Button("SELL", width - 55, height - 100, 100, 50, 40, color(255, 170, 0), false);
    buyDartTower = new BuyButton("Dart", "$170", width - 187.5, 155, 100, 100, 12, 24, BLUE, true, dartImage);
    buyIceTower = new BuyButton("Ice", "$255", width - 62.5, 155, 100, 100, 12, 24, BLUE, true, iceImage);
    
    lives = 100;
    money = 650;
    
    buttonQ.add(buyDartTower);
    buttonQ.add(buyIceTower);
    buttonQ.add(new BuyButton("Dart3", "$170", width - 187.5, 600, 100, 100, 12, 24, BLUE, true, dartImage));
    
    //bloons.add(new Bloon(gameTrack.getStart(), 2, false));
    
    //Testing IceTower
    //towers.add(new IceTower(525,350));
  }
  
  void run() {    
    // millis() is imprecise, so we have own timer
    
    
    if(currentRound != null && !currentRound.getDone()) {
      
      if(counter > 0) {
      counter -= 1 * speed;
      currentTime += 1 * speed;
      }
      else counter = 1000;
      currentRound.run();
    }
    
    // spawning bloons
    for(int i = 0; i < spawns.size(); i++) {
      int[] e = spawns.get(i);
      if(currentTime == e[2]) {
        spawn(e[0], e[1]);
        spawns.remove(i);
        i--;
      }
    }
    
    for(int i = 0; i < bloons.size(); i++) {
      Bloon b = bloons.get(i);
      if(b.getType() < 0) {
        bloons.remove(b);
        i--;
      }
      if(b.getCurrentBlock() == gameTrack.getLast()) {
        lives -= b.getType() + 1;
        bloons.remove(b);
        i--;
      }
    }
    
    float r = 0;
    switch(placeTower) { // tower radius
      case 0:
        r = 20;
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
    
    selectedTower = null;
    for(Tower t : towers) { // invalid on towers
      if(dist(mouseX, mouseY, t.getPos()[0], t.getPos()[1]) <= t.getRad() + r) {
        valid = false;
      }
      
      if(t.getSelected()) selectedTower = t;
    }
    
    if(sell.getActive()) sell.toggle();
    if(selectedTower != null) {
      if(!sell.getActive()) sell.toggle();
      
    // upgrades
      for(Button b : buttonQ) {
        if(b.getActive()) b.toggle();

      }
    }
    else for(Button b : buttonQ) {
        if(!b.getActive()) b.toggle();   
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
        if(valid) fill(0, 0, 0, 100);
        else fill(255, 0, 0, 100);
        ellipseMode(RADIUS);
        switch(placeTower) {
          case 0: // dart tower
            circle(mouseX, mouseY, 20);
            noStroke();
            circle(mouseX, mouseY, 200);
            break;
          case 1: // ice tower
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
    sell.display();
    
    textAlign(LEFT);
    textSize(24);
    fill(255);
    textLeading(25);
    text("Round: " + roundNumber + "\nLives: " + lives + "\nMoney: $" + money, width - 245, 25);
    
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
    
    fill(0);
    textSize(24);
    text("Bloon Count: " + bloons.size() + "\nTime: " + currentTime, 0, 20);
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
    towers.remove(t);
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
      currentTime = 0;
      counter = 1000;
      currentRound = new Round(roundNumber);
      startBattle.toggle();
    }
    else if(sell.getActive() && sell.getHovering()) {
      println("sold");
      sellTower(selectedTower);
    }
    else if(buyDartTower.getHovering() && money >= 170) {
      println("bought dart tower");
      placing = true;
      placeTower = 0;
    }
    else if(buyIceTower.getHovering() && money >= 255) {
      println("bought ice tower");
      placing = true;
      placeTower = 1;
    }
    else if(placing && valid && mouseX < width - 250) {
      placing = false;
      switch(placeTower) {
        case 0: // dart tower
          towers.add(new DartTower(mouseX, mouseY));
          money -= 170;
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
  
  void nextRound() {
    roundNumber++;
  }
  
  Track getTrack() {
    return gameTrack;
  }
  
  int getCurrentTime() {
    return currentTime;
  }
  
  ArrayList<int[]> getSpawns() {
    return spawns;
  }
  
  void spawn(int type, int isCamo) { // isCamo = 0 : false; isCamo = 1 : true
    if(isCamo == 0) bloons.add(new Bloon(currentGame.getTrack().getStart(), type, false));
    else bloons.add(new Bloon(currentGame.getTrack().getStart(), type, true));
  }
  
  void addMoney(int n) {
    money += n;
  }
}
