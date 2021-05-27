public class Bloon {
  float[] pos;
  Block currentBlock;
  int bloonType;
  float speed, size;
  color bloonColor;
  boolean camo, lead;
  
  Bloon(Block b, int type, boolean isCamo, boolean isLead) {
    currentBlock = b;
    pos = new float[]{b.getX(), b.getY()};
    bloonType = type;
    camo = isCamo;
    lead = isLead;
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
  
  boolean isLead() {
    return lead;
  }
  
  void setSpeed(float n) {
    speed = n;
  }
  
  void pop() {
    bloonType--;
  }
  
  int getType() {
    return bloonType;
  }
  
  void move() {
    if(pos[0] == currentBlock.getNextBlock().getX() && pos[1] == currentBlock.getNextBlock().getY()) {
      changeToNextBlock();
    }
    /*
    if(Math.abs(currentBlock.getDirection() - currentBlock.getNextBlock().getDirection()) == 90 ||
       Math.abs(currentBlock.getDirection() - currentBlock.getNextBlock().getDirection()) == 270) {
       
     }
     */
    pos[0] += speed * cos(radians(currentBlock.getDirection()));
    pos[1] += speed * sin(radians(currentBlock.getDirection()));
  }
  
  void display() {
    switch(bloonType) {
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
    move();
    ellipseMode(CENTER);
    fill(bloonColor);
    stroke(0);
    strokeWeight(2);
    ellipse(pos[0], pos[1], 25, 35);
    line(pos[0], pos[1] + 37/2, pos[0], pos[1] + 37/2 + 15);
  }
  
}