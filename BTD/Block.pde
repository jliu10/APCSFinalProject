public class Block {
  int direction;
  float len, wid;
  float[] pos;
  Block nextBlock;
  float redColor;
  float greenColor;
  float blueColor;
  
  Block(int dir, float blockLen, float blockWid, float xcor, float ycor, float redVal, float greenVal, float blueVal) {
    direction = dir;
    len = blockLen;
    wid = blockWid;
    pos = new float[2];
    pos[0] = xcor;
    pos[1] = ycor;
    redColor = redVal;
    greenColor = greenVal;
    blueColor = blueVal;
  }
  
  void display() {
    rectMode(CENTER);
    fill(redColor,greenColor,blueColor);
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
