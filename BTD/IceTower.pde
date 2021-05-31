public class IceTower extends Tower{
  
  IceTower(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 300; firerate = 0.5; direction = 0; //do not need direction for IceTower
    totalValue = 300; projectileSpeed = 0; //no projectiles for IceTower
  }
  
  void display() {
    fill(165,242,243);
    ellipseMode(RADIUS);
    ellipse(position[0], position[1], radius, radius);
  }
  
  void shoot() {
    for(Bloon b : currentGame.getBloons()) {
      float xDiff = b.getPosition()[0] - position[0];
      float yDiff = b.getPosition()[1] - position[1];
      if (xDiff * xDiff + yDiff * yDiff < range*range) { //test if bloon is close enough to ice tower
        b.setSpeed(b.getSpeed()*0.5);
      }
    }
  }
}
