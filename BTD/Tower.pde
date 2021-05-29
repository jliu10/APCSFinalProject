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
    selected = true;
  }
  void deselect() {
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
