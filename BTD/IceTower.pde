public class IceTower extends Tower{
  
  IceTower(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 200; firerate = 0.5; direction = 0; //do not need direction for IceTower
    totalValue = 300; projectileSpeed = 0; //no projectiles for IceTower
  }
  
  void display() {
    ellipseMode(RADIUS);
    if (selected) {
      fill(120,50);
      ellipse(position[0],position[1],range,range);
    }
    fill(165,242,243);
    ellipse(position[0], position[1], radius, radius);
    select(); deselect(); shoot();
  }
  boolean bloonInRange(Bloon b) {
    float xDiff = b.getPosition()[0] - position[0];
    float yDiff = b.getPosition()[1] - position[1];
    return (xDiff*xDiff + yDiff*yDiff < range*range);
  }
  void shoot() {
    for(Bloon b : currentGame.getBloons()) {
      if (bloonInRange(b)) {
        b.setSpeed(b.getSpeed()*0.5);
        println(b.getSpeed());
      }
      //float xDiff = b.getPosition()[0] - position[0];
      //float yDiff = b.getPosition()[1] - position[1];
      //if (dist(b.getPosition()[0], b.getPosition()[1], position[0], position[1]) < range) { //test if bloon is close enough to ice tower
      //  b.setSpeed(0);
      //}
    }
  }
  
}
