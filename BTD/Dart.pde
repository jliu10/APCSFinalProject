public class Dart extends Projectile {
  int health;
  
  Dart(float Xcor, float Ycor, float targetX, float targetY) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    damage = 1; health = 1;
    float Xdiff = targetX - Xcor; float Ydiff = targetY - Ycor;
    float direction1 = asin(Ydiff/sqrt(Xdiff*Xdiff + Ydiff*Ydiff));
    if (Xcor >= 0) {
      direction = degrees(direction1); //want direction in degrees
    }
    else {
      direction = 180 - degrees(direction1);
    }
  }
  
  void display() {
    if (health > 0) {
      rotate(radians(direction));
      fill(123,63,0);
      ellipse(position[0],position[1],5,10);
      move(); hitBloon(currentGame.getBloons());
    }
  }
  
  boolean hitBloon(ArrayList<Bloon> bloonsList) {
    for (Bloon b : bloonsList) {
      float[] bloonPosition = b.getPosition();
      float xDiff = bloonPosition[0] - position[0]; float yDiff = bloonPosition[1] - position[1];
      if (xDiff*xDiff + yDiff * yDiff < 50) {
        b.setType(b.getType() - 1);
        b.setHealth(b.getHealth() - 1);
        health -= 1;
        if (health == 0) {
          return true;
        }
      }
    }
    return false;
  }
}
