public class Bloon {
  float[] pos;
  Block currentBlock;
  int bloonType;
  float speed, size;
  color bloonColor;
  boolean camo;
  int FreezeCounter;
  
  Bloon(Block b, int type, boolean isCamo) {
    currentBlock = b;
    pos = new float[]{b.getX(), b.getY()};
    bloonType = type;
    camo = isCamo;
    FreezeCounter = 0;
    switch(type) {
      case 0: //red bloon
        bloonColor = color(227, 0, 0);
        speed = 1;
        break;
      case 1: //blue bloon
        bloonColor = color(0, 0, 227);
        speed = 1.4;
        break;
      case 2: //green bloon
        bloonColor = color(0, 227, 0);
        speed = 1.8;
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
  
  void setSpeed(float n) {
    speed = n;
  }
  
  float getSpeed() {
    return speed;
  }
  
  void bloonPop() {
    bloonType--;
  }
  
  int getType() {
    return bloonType;
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
    if (FreezeCounter <= 0) {
      pos[0] += speed * currentGame.getSpeed() * cos(radians(currentBlock.getDirection()));
      pos[1] += speed * currentGame.getSpeed() * sin(radians(currentBlock.getDirection()));
    }
  }
  
  void display() {
    switch(bloonType) {
      case 0: //red bloon
        bloonColor = color(227, 0, 0);
        //speed = 1;
        break;
      case 1: //blue bloon
        bloonColor = color(0, 0, 227);
        //speed = 1.4;
        break;
      case 2: //green bloon
        bloonColor = color(0, 227, 0);
        //speed = 1.8;
        break;
    }
    move();
    ellipseMode(CENTER);
    fill(bloonColor);
    stroke(0);
    strokeWeight(2);
    ellipse(pos[0], pos[1], 25, 35);
    line(pos[0], pos[1] + 37/2, pos[0], pos[1] + 37/2 + 15);
  }
}
