public class IceTower extends Tower{
  boolean active; //change animation when active
  int animationTimer;
  int FreezeTime;
  
  IceTower(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 100; direction = 0; //do not need direction for IceTower
    totalValue = 255; projectileSpeed = 0; //no projectiles for IceTower
    shootTime = 60; shootCounter = 0; FreezeTime = 30;
    active = false;
    animationTimer = 0;
    type = "ICE";
  }
  
  void display() {
    switch(upgrades[0]) {
      case 1:
        range = 125;
        break;
    }
    switch(upgrades[1]) {
      case 1:
        FreezeTime = 45;
        break;
    }
    ellipseMode(RADIUS);
    if (animationTimer > 0) {//show flash of ice when ice tower is freezing
      stroke(0,0);
      fill(255,50);
      ellipse(position[0],position[1],range,range);
      animationTimer--;
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
  void shoot() {
    active = false;
    if (shootCounter == 0) {
      for(Bloon b : currentGame.getBloons()) {
        if (bloonInRange(b)) {
          active = true;
          if (!b.getFrozen()) {//set all non-frozen bloons in range to frozen
            b.setFrozen(FreezeTime);
          }
        }
      }
      if (active) {
        shootCounter = shootTime; //reset shooting
        if (animationTimer == 0) {//allow animation to show
          animationTimer = 7;
        }
      }
    }
    else {
      shootCounter--;
    }
  }
  
}
