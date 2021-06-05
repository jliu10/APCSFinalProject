public class Bloon {
  float[] pos;
  Block currentBlock;
  int bloonType;
  float speed, size;
  color bloonColor;
  boolean camo;
  int FreezeCounter;
  boolean isFrozen; int freezeMultiplier;
  int health;
  boolean currentlyPopped; int popTimer;
  
  Bloon(Block b, int type, boolean isCamo) {
    currentBlock = b;
    pos = new float[]{b.getX(), b.getY()};
    bloonType = type;
    camo = isCamo;
    currentlyPopped = false; popTimer = 0;
    FreezeCounter = 0; isFrozen = false; freezeMultiplier = 1;//start out not frozen
    switch(type) {
      case 0: //red bloon
        bloonColor = color(227, 0, 0);
        speed = 1;
        health = 1;
        break;
      case 1: //blue bloon
        bloonColor = color(0, 0, 227);
        speed = 1.4;
        health = 2;
        break;
      case 2: //green bloon
        bloonColor = color(0, 227, 0);
        speed = 1.8;
        health = 3;
        break;
    }
  }
  
  void changeToNextBlock() {
    currentBlock = currentBlock.getNextBlock();
  }
  
  Block getCurrentBlock() {
    return currentBlock;
  }
  
  boolean isCamo() {
    return camo;
  }
  
  int getHealth() {
    return health;
  }
  void setHealth(int newHealth) {
    health = newHealth;
  }
  
  void setSpeed(float n) {
    speed = n;
  }
  float getSpeed() {
    return speed;
  }
  
  void bloonPop(int damage) {
    bloonType -= damage;
    health -= damage;
    currentGame.addMoney(1);
    currentlyPopped = true;
    popTimer = 5;
  }
  int getPopTimer() {
    return popTimer;
  }
  
  int getType() {
    return bloonType;
  }
  void setType(int newType) {
    currentGame.addMoney(1);
    bloonType = newType;
  }
  
  float[] getPosition() { //get position of bloon
    return pos;
  }
  
  int getFreezeCounter() {
    return FreezeCounter;
  }
  void setFreezeCounter(int num) {
    FreezeCounter = num;
  }
  void setFrozen() {
    isFrozen = true;
    FreezeCounter = 30;
    freezeMultiplier = 0;
  }
  boolean getFrozen() {
    return isFrozen;
  }
  
  void move() {
    float xDiff = pos[0] - currentBlock.getNextBlock().getX();
    float yDiff = pos[1] - currentBlock.getNextBlock().getY();
    if(xDiff*xDiff + yDiff*yDiff <= 4) {
      pos[0] = currentBlock.getNextBlock().getX();
      pos[1] = currentBlock.getNextBlock().getY();
      changeToNextBlock();
    }
    /*
    if(Math.abs(currentBlock.getDirection() - currentBlock.getNextBlock().getDirection()) == 90 ||
       Math.abs(currentBlock.getDirection() - currentBlock.getNextBlock().getDirection()) == 270) {
       
     }
    */
    pos[0] += speed * freezeMultiplier * currentGame.getSpeed() * cos(radians(currentBlock.getDirection()));
    pos[1] += speed * freezeMultiplier * currentGame.getSpeed() * sin(radians(currentBlock.getDirection()));
  }
  
  void display() {
    switch(bloonType) {
      case 0: //red bloon
        if (FreezeCounter > 0) {
          bloonColor = color(227, 50, 50);
        }
        else {
          bloonColor = color(227, 0, 0);
        }
        //speed = 1;
        break;
      case 1: //blue bloon
        if (FreezeCounter > 0) {
          bloonColor = color(50, 50, 227);
        }
        else {
          bloonColor = color(0, 0, 227);
        }
        //speed = 1.4;
        break;
      case 2: //green bloon
        if (FreezeCounter > 0) {
          bloonColor = color(50, 227, 50);
        }
        else {
          bloonColor = color(0, 227, 0);
        }
        //speed = 1.8;
        break;
    }
    move();
    ellipseMode(CENTER);
    fill(bloonColor);
    stroke(0);
    strokeWeight(2);
    line(pos[0], pos[1] + 37/2, pos[0], pos[1] + 37/2 + 15);
    ellipse(pos[0], pos[1], 25, 35);
    if (isFrozen) {//freezing mechanics
      stroke(178,255,256);
      fill(178,255,256);
      arc(pos[0], pos[1], 25, 35, PI, 2*PI);
      FreezeCounter--;
      if (FreezeCounter == 0) {
        isFrozen = false;
        freezeMultiplier = 1;
      }
    }
    if (currentlyPopped) {//pop animation
      popTimer--;
      float Xcor = pos[0]; float Ycor = pos[1];
      fill(255);
      float c = 1; float par = 11;
      stroke(0,0);
      beginShape();
      vertex(Xcor - par*c, Ycor + par*c);
      vertex(Xcor + par*c, Ycor + par*c);
      vertex(Xcor + par*c, Ycor - par*c);
      vertex(Xcor - par*c, Ycor - par*c);
      endShape();
      fill(bloonColor);
      stroke(0);
      beginShape();
      bezier(Xcor - par*c, Ycor + par*c, Xcor - 5*c, Ycor + 4*c, 
      Xcor + 5*c, Ycor + 4*c, Xcor + par*c, Ycor + par*c);
      bezier(Xcor + par*c, Ycor + par*c, Xcor + 4*c, Ycor + 5*c, 
      Xcor + 4*c, Ycor - 5*c, Xcor + par*c, Ycor - par*c);
      bezier(Xcor + par*c, Ycor - par*c, Xcor + 5*c, Ycor - 4*c, 
      Xcor - 5*c, Ycor - 4*c, Xcor - par*c, Ycor - par*c);
      bezier(Xcor - par*c, Ycor - par*c, Xcor - 4*c, Ycor - 5*c, 
      Xcor - 4*c, Ycor + 5*c, Xcor - par*c, Ycor + par*c);
      endShape();
      //beginShape();
      //curveVertex(Xcor-20, Ycor-20); 
      //curveVertex(Xcor-20, Ycor-20); 
      //curveVertex(Xcor + 20, Ycor);
      //curveVertex(Xcor + 40, Ycor + 40);
      //curveVertex(Xcor, Ycor + 60);
      //curveVertex(Xcor - 10, Ycor + 90); 
      //curveVertex(Xcor - 10, Ycor + 90);
      //endShape();
      if (popTimer == 0) {
        currentlyPopped = false;
      }
    }
  }
}
