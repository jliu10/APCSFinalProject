public class TackTower extends Tower {
  ArrayList<Tack> tackList;
  int health;
  
  TackTower(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 100; direction = 0;
    totalValue = 170; projectileSpeed = 8;
    shootTime = 50;
    shootCounter = 0;
    tackList = new ArrayList<Tack>();
    type = "TACK";
    damage = 1;
    health = 1;
  }
  
  void display() {
    //switch(upgrades[0]) {
    //  case 1:
    //    range = 250;
    //    break;
    //}
    //switch(upgrades[1]) {
    //  case 1:
    //    damage = 2;
    //    health = 2;
    //    break;
    //}
    ellipseMode(RADIUS);
    stroke(0);
    if (selected) {
      fill(120,50);
      ellipse(position[0],position[1],range,range);
    }
    fill(255,105,180);//pink color for tack tower
    ellipse(position[0], position[1], radius, radius);
    select(); deselect();
    shoot();
    for (int i = 0; i < tackList.size(); i++) {
      Tack t = tackList.get(i);
      float[] tackPos = t.getPosition();
      if (t.getHealth() > 0 || (tackPos[0] < 1050 && tackPos[0] > 0 && tackPos[1] < 700 && tackPos[1] > 0)) {
        t.display();
      }
      else if (tackPos[0] >= 1050 || tackPos[0] <= 0 || tackPos[1] >= 700 || tackPos[1] <= 0) {//remove tack if it is out of bounds
        t = null;
        tackList.remove(i);
        i--;
      }
      else if (t.getHealth() == 0) {//remove tack when health is 0
        t = null;
        tackList.remove(i);
        i--;
      }
    }
  }
  
  void shoot() {
    if (shootCounter == 0) {
      for(Bloon b : currentGame.getBloons()) {
        if (bloonInRange(b) && shootCounter == 0) {
          Tack t = new Tack(position[0], position[1], projectileSpeed, damage, health, 0);
          tackList.add(t);
          shootCounter = shootTime;
        }
      }
    }
    else {
      shootCounter--;
    }
  }
  
}
