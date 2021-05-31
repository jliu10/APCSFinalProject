public class IceTower extends Tower{
  boolean active; //change animation when active
  
  IceTower(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 200; firerate = 0.5; direction = 0; //do not need direction for IceTower
    totalValue = 255; projectileSpeed = 0; //no projectiles for IceTower
    active = false;
  }
  
  void display() {
    ellipseMode(RADIUS);
    if (active) {
      stroke(0,0);
      fill(255,50);
      ellipse(position[0],position[1],range,range);
    }
    stroke(0);
    if (selected) {
      fill(120,50);
      ellipse(position[0],position[1],range,range);
    }
    fill(178,255,256);
    ellipse(position[0], position[1], radius, radius);
    select(); deselect(); shoot();
  }
  boolean bloonInRange(Bloon b) {
    float xDiff = b.getPosition()[0] - position[0];
    float yDiff = b.getPosition()[1] - position[1];
    return (xDiff*xDiff + yDiff*yDiff < range*range);
  }
  void shoot() {
    active = false;
    for(Bloon b : currentGame.getBloons()) {
      if (bloonInRange(b)) {
        active = true;
        if (b.getFreezeCounter() <= -30) {
          b.setFreezeCounter(30);
        }
        else {
          b.setFreezeCounter(b.getFreezeCounter() - 1);
        }
      }
      //float xDiff = b.getPosition()[0] - position[0];
      //float yDiff = b.getPosition()[1] - position[1];
      //if (dist(b.getPosition()[0], b.getPosition()[1], position[0], position[1]) < range) { //test if bloon is close enough to ice tower
      //  b.setSpeed(0);
      //}
    }
  }
  
}
