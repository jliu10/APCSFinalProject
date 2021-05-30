public class IceTower extends Tower{
  float range, radius, firerate, direction, totalValue, projectileSpeed;
  boolean selected;
  int[] upgrades;
  Bloon target;
  int damage;
  
  IceTower(float Xcor, float Ycor) {
    float[] position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    int[] upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 150; firerate = 0.5; direction = 0; //do not need direction for IceTower
    totalValue = 300; projectileSpeed = 0; //no projectiles for IceTower
  }
  
  void display() {
    fill(165,242,243);
    circle(position[0], position[1], radius);
  }
  
  void shoot() {
  }
}
