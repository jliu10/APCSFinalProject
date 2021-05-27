public class Block {
  int direction;
  float len, wid;
  float[] pos;
  Block nextBlock;
  
  Block(int dir, float blockLen, float blockWid, float xcor, float ycor) {
    direction = dir;
    len = blockLen;
    wid = blockWid;
    pos = new float[2];
    pos[0] = xcor;
    pos[1] = ycor;
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
  
  float getLength() {
    return len;
  }
  
  float getWidth() {
    return wid;
  }
  
  float getX() {
    return pos[0];
  }
  
  float getY() {
    return pos[1];
  }
}
