public class DartTower extends Tower {
  ArrayList<Dart> dartList;
  int health;
  
  DartTower(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 170; direction = 0;
    totalValue = 170; projectileSpeed = 8;
    shootTime = 50;
    shootCounter = 0;
    dartList = new ArrayList<Dart>();
    type = "DART";
    damage = 1;
    health = 1;
  }
  
  void display() {
    switch(upgrades[0]) {
      case 1:
        range = 250;
        break;
    }
    switch(upgrades[1]) {
      case 1:
        damage = 2;
        health = 2;
        break;
    }
    ellipseMode(RADIUS);
    stroke(0);
    if (selected) {
      fill(120,50);
      ellipse(position[0],position[1],range,range);
    }
    fill(110,38,14);
    ellipse(position[0], position[1], radius, radius);
    select(); deselect();
    shoot();
    for (int i = 0; i < dartList.size(); i++) {
      Dart d = dartList.get(i);
      float[] dartPos = d.getPosition();
      if (d.getHealth() > 0 || (dartPos[0] < 1050 && dartPos[0] > 0 && dartPos[1] < 700 && dartPos[1] > 0)) {
        d.display();
      }
      else if (dartPos[0] >= 1050 || dartPos[0] <= 0 || dartPos[1] >= 700 || dartPos[1] <= 0) {//remove dart if it is out of bounds
        d = null;
        dartList.remove(i);
        i--;
      }
      else if (d.getHealth() == 0) {//remove dart when health is 0
        d = null;
        dartList.remove(i);
        i--;
      }
    }
    //for (Dart d : dartList) {
    //  if (d.getHealth() > 0) {
    //    d.display();
    //  }
    //  else if (d.getHealth() == 0) {
    //    d = null;
    //  }
    //}
  }
  
  void shoot() {
    if (shootCounter <= 0) {
      for(Bloon b : currentGame.getBloons()) {
        if (bloonInRange(b) && shootCounter <= 0) {
          Dart d = new Dart(position[0], position[1], b.getPosition()[0], b.getPosition()[1], projectileSpeed, damage, health);
          dartList.add(d);
          shootCounter = shootTime;
        }
      }
    }
    else {
      shootCounter -= currentGame.getSpeed();
    }
  }
  
}
