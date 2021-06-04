public class CannonBall extends Projectile {
  float explodeRadius;
  int explosionTimer;
  
  CannonBall(float Xcor, float Ycor, float targetX, float targetY, float BallSpeed, float boomRadius) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    damage = 1; health = 1; speed = BallSpeed; 
    explodeRadius = boomRadius; explosionTimer = 0;
    float Xdiff = targetX - Xcor; float Ydiff = targetY - Ycor;
    float direction1 = asin(Ydiff/sqrt(Xdiff*Xdiff + Ydiff*Ydiff));
    if (Xdiff >= 0) {
      direction = degrees(direction1); //want direction in degrees
    }
    else {
      direction = 180 - degrees(direction1);
    }
  }
  
  int getHealth() {
    return health;
  }
  
  void display() {
    if (health > 0) {
      fill(123,63,0);
      move();
      //float Xcor = position[0]; float Ycor = position[1];
      //float d = radians(direction+90);
      ellipseMode(RADIUS); stroke(0); fill(255);
      hitBloon(currentGame.getBloons());
    }
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
