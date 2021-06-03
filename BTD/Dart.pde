public class Dart extends Projectile {
  
  Dart(float Xcor, float Ycor, float targetX, float targetY, float dartSpeed) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    damage = 1; health = 1; speed = dartSpeed;
    float Xdiff = targetX - Xcor; float Ydiff = targetY - Ycor;
    float direction1 = asin(Ydiff/sqrt(Xdiff*Xdiff + Ydiff*Ydiff));
    if (Xdiff >= 0) {
      direction = degrees(direction1); //want direction in degrees
    }
    else {
      direction = 180 - degrees(direction1);
    }
  }
  
 void display() {
    if (health > 0) {
      fill(123,63,0);
      move();
      float Xcor = position[0]; float Ycor = position[1];
      float d = radians(direction+90);
      bezier(Xcor + 6*sin(d),Ycor - 6*cos(d), Xcor - 18*cos(d)-24*sin(d), Ycor + 24*cos(d)-18*sin(d), 
      Xcor + 18*cos(d)-24*sin(d), Ycor + 24*cos(d)+18*sin(d), Xcor + 6*sin(d), Ycor - 6*cos(d));
      hitBloon(currentGame.getBloons());
    }
  }
  
  void move() {
    position[0] += speed * currentGame.getSpeed() * cos(radians(direction));
    position[1] += speed * currentGame.getSpeed() * sin(radians(direction));
  }
  
  int getHealth() {
    return health;
  }
  
  boolean hitBloon(ArrayList<Bloon> bloonsList) {
    for (Bloon b : bloonsList) {
      float[] bloonPosition = b.getPosition();
      float xDiff = bloonPosition[0] - position[0]; float yDiff = bloonPosition[1] - position[1];
      if (xDiff*xDiff + yDiff * yDiff < 400) {
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
