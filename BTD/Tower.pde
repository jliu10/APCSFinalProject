abstract class Tower {
  float shootTime;
  float shootCounter;
  float[] position;
  float range, radius, direction, totalValue, projectileSpeed;
  boolean selected;
  int[] upgrades;
  Bloon target;
  int damage;
  String type;
  
  abstract void display();
  abstract void shoot();
  
  void select() {
    if (mouseButton == 37 && dist(mouseX,mouseY, position[0], position[1]) < radius) {
      selected = true;
      for (Tower t : currentGame.getTowers()) {
        if (!this.equals(t)) {
          t.selectSetFalse();
        }
      }
    }
  }
  void deselect() {
    if (mouseButton == 37 && mouseX < width - 250 && dist(mouseX,mouseY, position[0], position[1]) > range) {
      selected = false;
    }
  }
  void selectSetFalse() {
    selected = false;
  }
  void upgrade(int path) {
    if (upgrades[path] < 2) {
      upgrades[path]++;
      println("upgraded " + path);
    }
  }
  
  float getValue() {
    return totalValue;
  }
  boolean bloonInRange(Bloon b) {
    float xDiff = b.getPosition()[0] - position[0];
    float yDiff = b.getPosition()[1] - position[1];
    return (xDiff*xDiff + yDiff*yDiff < range*range);
  }
  float[] getPos() {
    return position;
  }
  
  float getRad() {
    return radius;
  }
  
  boolean getSelected() {
    return selected;
  }
  
  String getType() {
    return type;
  }
  
  int[] getUpgrades() {
    return upgrades;
  }
}
