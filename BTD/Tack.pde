public class Tack extends Projectile {
//directionNumber is either 0, 45, 90, 135, 180, 225, 270, or 315
  
  Tack(float Xcor, float Ycor, float tackSpeed, int dmg, int hp, int directionNumber) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    damage = dmg; health = hp; speed = tackSpeed; direction = directionNumber;
    //directionNumber is either 0, 45, 90, 135, 180, 225, 270, or 315
  }
  
 void display() {
    if (health > 0) {
      fill(123,63,0);
      move();
      float Xcor = position[0]; float Ycor = position[1];
      float d = radians(direction);
      noFill();
      strokeWeight(2.5);
      beginShape();
      //line(Xcor-5,Ycor+1,Xcor-5,Ycor-1);
      //line(Xcor-5,Ycor,Xcor+5,Ycor); This is the shape when direction = 0
      line(Xcor-5*cos(d)-1*sin(d),Ycor+1*cos(d)-5*sin(d),Xcor-5*cos(d)+1*sin(d),Ycor-1*cos(d)-5*sin(d));
      line(Xcor-5*cos(d),Ycor-5*sin(d),Xcor+5*cos(d),Ycor+5*sin(d));
      endShape();
      //bezier(Xcor + 5*sin(d),Ycor - 5*cos(d), Xcor - 15*cos(d)-25*sin(d), Ycor + 25*cos(d)-15*sin(d), 
      //Xcor + 15*cos(d)-25*sin(d), Ycor + 25*cos(d)+15*sin(d), Xcor + 5*sin(d), Ycor - 5*cos(d));
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
      float jumpDistance = speed * currentGame.getSpeed() + 1;
      if (xDiff*xDiff + yDiff * yDiff < jumpDistance*jumpDistance) {
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
