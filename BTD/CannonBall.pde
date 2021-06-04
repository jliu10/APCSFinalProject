public class CannonBall extends Projectile {
  float explodeRadius;
  int explosionTimer;
  float size;
  
  CannonBall(float Xcor, float Ycor, float targetX, float targetY, float BallSpeed, float boomRadius, float bombSize) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    damage = 1; health = 1; speed = BallSpeed; size = bombSize;
    explodeRadius = boomRadius; explosionTimer = 15;
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
      ellipseMode(RADIUS); stroke(0); fill(0);
      ellipse(position[0], position[1], size, size);
      hitBloon(currentGame.getBloons());
    }
    if (health == 0) {
      if (explosionTimer > 0) {
        ellipseMode(RADIUS); stroke(0); fill(255,26,0);
        ellipse(position[0], position[1], 1.5*explodeRadius, 1.5*explodeRadius);
        fill(255,137,0);
        ellipse(position[0], position[1], explodeRadius, explodeRadius);
        fill(255,230,0);
        ellipse(position[0], position[1], 0.5*explodeRadius, 0.5*explodeRadius);
        explosionTimer--;
      }
    }
  }
  
  boolean hitBloon(ArrayList<Bloon> bloonsList) {
    for (Bloon b : bloonsList) {
      float[] bloonPosition = b.getPosition();
      float xDiff = bloonPosition[0] - position[0]; float yDiff = bloonPosition[1] - position[1];
      if (xDiff*xDiff + yDiff * yDiff < 1.5*size*size) {
        health -= 1;
        explosionTimer = 20;
        for(Bloon b2 : bloonsList) {
          float[] b2position = b2.getPosition();
          float xDiff2 = b2position[0] - position[0]; float yDiff2 = b2position[1] - position[1];
          if (xDiff2*xDiff2 + yDiff2*yDiff2 < 2.25*explodeRadius*explodeRadius) {
            b2.bloonPop(damage);
          }
        }
        if (health == 0) {
          return true;
        }
      }
    }
    return false;
  }
}
