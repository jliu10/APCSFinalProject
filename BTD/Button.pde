public class Button {
  String message;
  float w, h, size;
  float[] pos;
  color buttonColor, textColor;
  boolean active, hovering;

  Button(String text,
         float x, float y, float w, float h, float s,
         color c,
         boolean canClick) {
    message = text;
    this.w = w;
    this.h = h;
    size = s;
    pos = new float[]{x, y};
    buttonColor = c;
    textColor = WHITE;
    active = canClick;
  }

  void display() {
    if(active) {
      hover();
      rectMode(CENTER);
      fill(buttonColor);
      stroke(0);
      strokeWeight(2);
      rect(pos[0], pos[1], w, h, 8);
  
      textAlign(CENTER);
      fill(textColor);
      textSize(size);
      text(message, pos[0], .5 * size - 4 + pos[1]);
    }
  }

  void hover() {
    if(Math.abs(mouseX - pos[0]) <= w/2 + 4 && Math.abs(mouseY - pos[1]) <= h/2 + 4) {
      if(!hovering) {
        hovering = true;
        textColor = buttonColor;
        buttonColor = WHITE;
      }
    }
    else if(hovering) {
      hovering = false;
      buttonColor = textColor;
      textColor = WHITE;
    }
  }
  
  boolean getHovering() {
    return hovering;
  }
  
  void toggle() {
    active = !active;
  }
  
  boolean getActive() {
    return active;
  }
  
  float getX() {
    return pos[0];
  }
  
  float getY() {
    return pos[1];
  }
  
  void setX(float x) {
    pos[0] = x;
  }
  
  void setY(float y) {
    pos[1] = y;
  }

}
