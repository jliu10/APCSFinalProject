public class Cannon extends Tower {
  float direction;
  float boomRadius; //size of the explosion of a cannonball
  float bombSize; //how big each cannonball will be
  int health;
  ArrayList<CannonBall> BallList;
  
  Cannon(float Xcor, float Ycor) {
    position = new float[2];
    position[0] = Xcor; position[1] = Ycor;
    selected = false;
    upgrades = new int[2];
    upgrades[0] = 0; upgrades[1] = 0; //start with no upgrades
    radius = 20; range = 200; direction = 0;
    totalValue = 585; projectileSpeed = 7;
    shootTime = 75;
    shootCounter = 0;
    boomRadius = 60; bombSize = 10;
    BallList = new ArrayList<CannonBall>();
    type = "CANNON";
    health = 1;
  }
  
  void display() {
    switch(upgrades[0]) {
      case 1:
        range = 225;
        break;
    }
    switch(upgrades[1]) {
      case 1:
        damage = 2;
        health = 2;
        boomRadius = 72;
        bombSize = 12;
        break;
    }
    ellipseMode(RADIUS);
    stroke(0);
    if (selected) {
      fill(120,50);
      ellipse(position[0],position[1],range,range);
    }
    fill(0);
    float Xcor = position[0]; float Ycor = position[1];
    float d = radians(direction-90);
    bezier(Xcor - 15*cos(d)-40*sin(d), Ycor + 40*cos(d) - 15*sin(d), Xcor - 40*cos(d)+40*sin(d), Ycor - 40*sin(d) - 40*cos(d), 
    Xcor + 40*cos(d) + 40*sin(d), Ycor + 40*sin(d) - 40*cos(d), Xcor + 15*cos(d)-40*sin(d), Ycor + 40*cos(d)+15*sin(d));
    select(); deselect();
    shoot();
    for (int i = 0; i < BallList.size(); i++) {
      CannonBall ball = BallList.get(i);
      if (ball.getHealth() > 0) {
        ball.display();
      }
      else if (ball.getHealth() == 0) {
        BallList.remove(i);
        i--;
      }
    }
  }
  
  void shoot() {
    if (shootCounter == 0) {
      for(Bloon b : currentGame.getBloons()) {
        if (bloonInRange(b) && shootCounter == 0) {
          float Xcor = position[0]; float Ycor = position[1];
          float targetX = b.getPosition()[0]; float targetY = b.getPosition()[1];
          float Xdiff = targetX - Xcor; float Ydiff = targetY - Ycor; //changing the direction of the cannon
          float direction1 = asin(Ydiff/sqrt(Xdiff*Xdiff + Ydiff*Ydiff));
          if (Xdiff >= 0) {
            direction = degrees(direction1); //want direction in degrees
          }
          else {
            direction = 180 - degrees(direction1);
          } 
          CannonBall d = new CannonBall(Xcor, Ycor, targetX, targetY, projectileSpeed, boomRadius, bombSize);
          BallList.add(d);
          
          
          shootCounter = shootTime;
        }
      }
    }
    else {
      shootCounter--;
    }
  }
}
