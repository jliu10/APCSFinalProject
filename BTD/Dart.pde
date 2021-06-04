public class Dart extends Projectile {
  
  Dart(float Xcor, float Ycor, float targetX, float targetY, float dartSpeed, int dmg, int hp) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    damage = dmg; health = hp; speed = dartSpeed;
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
      bezier(Xcor + 5*sin(d),Ycor - 5*cos(d), Xcor - 15*cos(d)-25*sin(d), Ycor + 25*cos(d)-15*sin(d), 
      Xcor + 15*cos(d)-25*sin(d), Ycor + 25*cos(d)+15*sin(d), Xcor + 5*sin(d), Ycor - 5*cos(d));
      hitBloon(currentGame.getBloons());
    }
  }
  
  void move() {
    position[0] += speed * currentGame.getSpeed() * cos(radians(direction));
    position[1] += speed * currentGame.getSpeed() * sin(radians(direction));
  }
  
  float[] getPosition() {
    return position;
  }
  
  int getHealth() {
    return health;
  }
  
  boolean hitBloon(ArrayList<Bloon> bloonsList) {
    for (Bloon b : bloonsList) {
      float[] bloonPosition = b.getPosition();
      float xDiff = bloonPosition[0] - position[0]; float yDiff = bloonPosition[1] - position[1];
      if (xDiff*xDiff + yDiff * yDiff < 400) {
        health -= b.getHealth();
        if (!b.getFrozen()) {
          b.bloonPop(damage);
        }
        if (health == 0) {
          return true;
        }
      }
    }
    return false;
  }
}
