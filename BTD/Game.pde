import java.util.*;

public class Game {
  int lives, money, difficulty, placeTower, roundNumber, counter, currentTime;
  Round currentRound;
  boolean done, quitConfirm, wasPaused, placing, valid;
  float speed, lastSpeed;
  Tower selectedTower;
  ArrayList<Tower> towers;
  //ArrayList<Projectile> projectiles;
  ArrayList<Bloon> bloons;
  ArrayList<int[]> spawns; // {bloon type, camo (0 or 1), spawn time}
  Track gameTrack;
  ArrayDeque<Button> buttonQ, dartTowerUpgrades, cannonUpgrades, tackTowerUpgrades;
  
  Game(int diff, int map) {
    bloons = new ArrayList<Bloon>();
    towers = new ArrayList<Tower>();
    buttonQ = new ArrayDeque<Button>();
    dartTowerUpgrades = new ArrayDeque<Button>();
    cannonUpgrades = new ArrayDeque<Button>();
    tackTowerUpgrades = new ArrayDeque<Button>();
    gameTrack = new Track(map);
    spawns = new ArrayList<int[]>();
    speed = 1;
    lastSpeed = 1;
    difficulty = diff;
    roundNumber = 1;
    
    quit = new Button("QUIT", width - 55, height - 30, 100, 50, 40, color(184, 46, 0), true);
    quitYes = new Button("Yes", width - 175, height - 30, 80, 50, 40, color(184, 46, 0), false);
    quitNo = new Button("No", width - 70, height - 30, 80, 50, 40, BLUE, false);
    pause = new Button("PAUSE", width - 180, height - 30, 130, 50, 40, color(150), true);
    resume = new Button("PLAY", width - 180, height - 30, 130, 50, 40, color(150), false);
    startBattle = new Button("START BATTLE", width - 180, height - 100, 130, 50, 16, color(0, 220, 0), true);
    sell = new Button("SELL", width - 55, height - 100, 100, 50, 40, color(255, 170, 0), false);
    buyDartTower = new BuyButton("Dart", "$170", width - 187.5, 155, 100, 100, 12, 24, BLUE, true, dartImage);
    buyIceTower = new BuyButton("Ice", "$255", width - 62.5, 155, 100, 100, 12, 24, BLUE, true, iceImage);
    buyCannon = new BuyButton("Cannon", "$585", width - 187.5, 260, 100, 100, 12, 24, BLUE, true, cannonImage);
    buyLongRangeDarts = new BuyButton("Long Range", "$90", width - 187.5, 155, 100, 100, 12, 24, BLUE, false, longRangeDartsImage);
    buyPiercingDarts = new BuyButton("Piercing", "$205", width - 62.5, 155, 100, 100, 12, 24, BLUE, false, piercingDartsImage);
    buyExtraRangeBombs = new BuyButton("Extra Range", "$200", width - 187.5, 155, 100, 100, 12, 24, BLUE, false, extraRangeBombsImage);
    buyBiggerBombs = new BuyButton("Bigger Bombs", "$350", width - 62.5, 155, 100, 100, 12, 24, BLUE, false, biggerBombsImage);
    buyTackTower = new BuyButton("Tack", "$400", width - 62.5, 260, 100, 100, 12, 24, BLUE, true, tackImage);
    buyFasterShooting = new BuyButton("Faster Shooting", "$250", width - 187.5, 155, 100, 100, 12, 24, BLUE, false, fasterShootingImage);
    buyExtraRangeTacks = new BuyButton("Extra Range", "$150", width - 62.5, 155, 100, 100, 12, 24, BLUE, false, extraRangeTacksImage);
    
    lives = 100;
    money = 9999;
    
    buttonQ.add(buyDartTower);
    buttonQ.add(buyIceTower);
    buttonQ.add(buyCannon);
    buttonQ.add(buyTackTower);
    // buttonQ.add(new BuyButton("Dart3", "$170", width - 187.5, 600, 100, 100, 12, 24, BLUE, true, dartImage));
    
    dartTowerUpgrades.add(buyLongRangeDarts);
    dartTowerUpgrades.add(buyPiercingDarts);
    
    cannonUpgrades.add(buyExtraRangeBombs);
    cannonUpgrades.add(buyBiggerBombs);
    
    tackTowerUpgrades.add(buyFasterShooting);
    tackTowerUpgrades.add(buyExtraRangeTacks);
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
      if(b.getType() < 0 && b.getPopTimer() <= 0) {
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
      case 2:
        r = 20;
        break;
      case 3:
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
    else {
      /*
      switch(selectedTower.getType()) {
        case 0: // dart tower
          for(Button b : dartTowerUpgrades) {
            if(b.getActive()) b.toggle();
          }
          break;
      }
      */
      for(Button b : buttonQ) {
        if(!b.getActive()) b.toggle();
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
        if(valid) fill(0, 0, 0, 100);
        else fill(255, 0, 0, 100);
        ellipseMode(RADIUS);
        switch(placeTower) {
          case 0: // dart tower
            circle(mouseX, mouseY, 20);
            noStroke();
            circle(mouseX, mouseY, 170);
            break;
          case 1: // ice tower
            circle(mouseX, mouseY, 20);
            noStroke();
            circle(mouseX, mouseY, 100);
            break;
          case 2: // cannon
            circle(mouseX, mouseY, 20);
            noStroke();
            circle(mouseX, mouseY, 200);
            break;
          case 3: // tack
            circle(mouseX, mouseY, 20);
            noStroke();
            circle(mouseX, mouseY, 100);
            break;
        }
      }
    }
    
    rectMode(CORNERS);
    fill(BLUE);
    stroke(0);
    strokeWeight(2);
    rect(width, height, width - 251, 0);
    
    // UPGRADES
    if(selectedTower != null) {
      fill(0, 150, 0);
      rectMode(CENTER);
      rect(width - 187.5, 155, 100, 100, 8);
      rect(width - 62.5, 155, 100, 100, 8);
      fill(255);
      textAlign(CENTER);
      textLeading(24);
      switch(selectedTower.getType()) {
        case "DART": // dart tower
          textSize(14);
          text("BOUGHT\nLONG RANGE", width - 187.5, 148);
          textSize(20);
          text("BOUGHT\nPIERCING", width - 62.5, 143);
          for(Button b : dartTowerUpgrades) {
            if(!b.getActive()) b.toggle();
          }
          if(selectedTower.getUpgrades()[0] > 0) buyLongRangeDarts.toggle();
            // continue cascade if we end up having more upgrade tiers
          if(selectedTower.getUpgrades()[1] > 0) buyPiercingDarts.toggle();
          for(Button b : dartTowerUpgrades) {
            b.display();
          }
          break;
        case "CANNON": // cannon
          textSize(14);
          text("BOUGHT\nEXTRA RANGE", width - 187.5, 148);
          text("BOUGHT\nBIGGER BOMBS", width - 62.5, 148);
          for(Button b : cannonUpgrades) {
            if(!b.getActive()) b.toggle();
          }
          if(selectedTower.getUpgrades()[0] > 0) buyExtraRangeBombs.toggle();
            // continue cascade if we end up having more upgrade tiers
          if(selectedTower.getUpgrades()[1] > 0) buyBiggerBombs.toggle();
          for(Button b : cannonUpgrades) {
            b.display();
          }
          break;
        case "TACK": // tack tower
          textSize(16);
          text("BOUGHT\nFASTER\nSHOOTING", width - 187.5, 136);
          textSize(14);
          text("BOUGHT\nEXTRA RANGE", width - 62.5, 148);
          for(Button b : tackTowerUpgrades) {
            if(!b.getActive()) b.toggle();
          }
          if(selectedTower.getUpgrades()[0] > 0) buyFasterShooting.toggle();
            // continue cascade if we end up having more upgrade tiers
          if(selectedTower.getUpgrades()[1] > 0) buyExtraRangeTacks.toggle();
          for(Button b : tackTowerUpgrades) {
            b.display();
          }
          break;
      }
    }
    
    // TOWER SELECTION SHOP
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
    else if(buyCannon.getHovering() && money >= 585) {
      placing = true;
      placeTower = 2;
    }
    else if(buyTackTower.getHovering() && money >= 400) {
      placing = true;
      placeTower = 3;
    }
    else if(buyLongRangeDarts.getHovering() && buyLongRangeDarts.getActive() && money >= 90) {
      if(selectedTower != null) selectedTower.upgrade(0);
      money -= 90;
      buyLongRangeDarts.toggle();
    }
    else if(buyPiercingDarts.getHovering() && buyPiercingDarts.getActive() && money >= 205) {
      if(selectedTower != null) selectedTower.upgrade(1);
      money -= 205;
      buyPiercingDarts.toggle();
    }
    else if(buyExtraRangeBombs.getHovering() && buyExtraRangeBombs.getActive() && money >= 200) {
      if(selectedTower != null) selectedTower.upgrade(0);
      money -= 200;
      buyExtraRangeBombs.toggle();
    }
    else if(buyBiggerBombs.getHovering() && buyBiggerBombs.getActive() && money >= 350) {
      if(selectedTower != null) selectedTower.upgrade(1);
      money -= 350;
      buyBiggerBombs.toggle();
    }
    else if(buyFasterShooting.getHovering() && buyFasterShooting.getActive() && money >= 250) {
      if(selectedTower != null) selectedTower.upgrade(0);
      money -= 250;
      buyFasterShooting.toggle();
      println("faster shooting");
    }
    else if(buyExtraRangeTacks.getHovering() && buyExtraRangeTacks.getActive() && money >= 150) {
      if(selectedTower != null) selectedTower.upgrade(1);
      money -= 150;
      buyExtraRangeTacks.toggle();
      println("extra range");
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
        case 2: // cannon
          towers.add(new Cannon(mouseX, mouseY));
          money -= 585;
          break;
        case 3: // tack
          towers.add(new TackTower(mouseX, mouseY));
          money -= 400;
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
