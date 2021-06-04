public class Cannon extends Tower {
  float direction;
  float boomRadius; //size of the explosion of a cannonball
  ArrayList<CannonBall> BallList;
  
  Cannon(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 200; direction = 0;
    totalValue = 170; projectileSpeed = 5;
    shootTime = 75;
    shootCounter = 0;
    boomRadius = 50;
    BallList = new ArrayList<CannonBall>();
    type = "CANNON";
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
    for (int i = 0; i < BallList.size(); i++) {
      CannonBall d = BallList.get(i);
      if (d.getHealth() > 0) {
        d.display();
      }
      else if (d.getHealth() == 0) {
        BallList.remove(i);
        i--;
      }
    }
  }
  
  void shoot() {
    if (shootCounter == 0) {
      for(Bloon b : currentGame.getBloons()) {
        if (bloonInRange(b) && shootCounter == 0) {
          CannonBall d = new CannonBall(position[0], position[1], b.getPosition()[0], b.getPosition()[1], projectileSpeed, boomRadius);
          BallList.add(d);
          shootCounter = shootTime;
        }
      }
    }
    else {
      shootCounter--;
    }
  }
}
