public class Dart extends Projectile {
  int dartHealth;
  
  Dart(float Xcor, float Ycor, float targetX, float targetY) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    damage = 1; dartHealth = 1; speed = 1;
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
    if (dartHealth > 0) {
      fill(123,63,0);
      move();
      ellipse(position[0],position[1],5,10);
      hitBloon(currentGame.getBloons());
    }
  }
  
  void move() {
    println("position: " + position[0] + ", " + position[1]);
    position[0] += speed * currentGame.getSpeed() * cos(radians(direction));
    position[1] += speed * currentGame.getSpeed() * sin(radians(direction));
  }
  
  boolean hitBloon(ArrayList<Bloon> bloonsList) {
    for (Bloon b : bloonsList) {
      float[] bloonPosition = b.getPosition();
      float xDiff = bloonPosition[0] - position[0]; float yDiff = bloonPosition[1] - position[1];
      if (xDiff*xDiff + yDiff * yDiff < 50) {
        b.setType(b.getType() - 1);
        b.setHealth(b.getHealth() - 1);
        dartHealth -= 1;
        if (dartHealth == 0) {
          return true;
        }
      }
    }
    return false;
  }
}
