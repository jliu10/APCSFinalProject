public class DartTower extends Tower {
  int shootTime;
  int shootCounter;
  ArrayList<Dart> dartList;
  
  DartTower(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    projectileSpeed = 3;
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 200; firerate = 0.5; direction = 0;
    totalValue = 170; projectileSpeed = 5;
    shootTime = 50;
    shootCounter = 0;
    dartList = new ArrayList<Dart>();
  }
  void display() {
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
      if (d.getHealth() > 0) {
        d.display();
      }
      else if (d.getHealth() == 0) {
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
    if (shootCounter == 0) {
      for(Bloon b : currentGame.getBloons()) {
        if (bloonInRange(b) && shootCounter == 0) {
          Dart d = new Dart(position[0], position[1], b.getPosition()[0], b.getPosition()[1], projectileSpeed);
          dartList.add(d);
          shootCounter = shootTime;
        }
      }
    }
    else {
      shootCounter--;
    }
  }
  
}
