abstract class Tower {
  float[] position;
  float range, radius, firerate, direction, totalValue, projectileSpeed;
  boolean selected;
  int[] upgrades;
  Bloon target;
  int damage;
  
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
    if (mouseButton == 37 && dist(mouseX,mouseY, position[0], position[1]) > range) {
      selected = false;
    }
  }
  void selectSetFalse() {
    selected = false;
  }
  void upgrade(int path) {
    if (upgrades[path] < 2) {
      upgrades[path]++;
    }
  }
  void findTarget() {
  }
  float getValue() {
    return totalValue;
  }
}
