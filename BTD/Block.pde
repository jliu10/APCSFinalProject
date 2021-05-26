public class Block {
  int direction;
  float len, wid;
  float[] pos;
  Block nextBlock;
  boolean last;
  
  Block(int dir, float blockLen, float blockWid, float xcor, float ycor, boolean isLast) {
    direction = dir;
    len = blockLen;
    wid = blockWid;
    pos = new float[2];
    pos[0] = xcor;
    pos[1] = ycor;
    last = isLast;
    nextBlock = null;
  }
  
  void display() {
    rectMode(CENTER);
    fill(250,150,0);
    stroke(0);
    strokeWeight(1);
    rect(pos[0],pos[1], len, wid);
  }
  
  int getDirection() {
    return direction;
  }
  
  Block getNextBlock() {
    return nextBlock;
  }
  
  void setNextBlock(Block next) {
    nextBlock = next;
  }
  
  boolean isLast() {
    return last;
  }
  
  float getLength() {
    return len;
  }
  
  float getWidth() {
    return wid;
  }
}
