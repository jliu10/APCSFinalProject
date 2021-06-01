public class DartTower extends Tower {
  int shootTime;
  int shootCounter;
  ArrayList<Dart> dartList;
  
  DartTower(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 200; firerate = 0.5; direction = 0;
    totalValue = 255; projectileSpeed = 0; //no projectiles for IceTower
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
    select(); deselect(); shoot();
    for (Dart d : dartList) {
      d.display();
    }
  }
  
  void shoot() {
    if (shootCounter == 0) {
      for(Bloon b : currentGame.getBloons()) {
        if (bloonInRange(b)) {
          Dart d = new Dart(position[0], position[1], b.getPosition()[0], b.getPosition()[1]);
          dartList.add(d);
        }
      }
    }
    else {
      shootCounter--;
    }
  }
  
}
