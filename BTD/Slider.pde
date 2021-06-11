public class Slider {
  float[] pos;
  float value, factor, len, knobX;
  String name;
  
  Slider(String text, float x, float y, float fact, float l) {
    name = text;
    factor = fact; // e.g. if fact = 4, min will be 1/4 & max will be 4
    len = l;
    pos = new float[]{x, y};
    // value = 1;
    knobX = x;
  }
  
  void function() {
    if(dist(mouseX, mouseY, knobX, pos[1]) <= 5) {
      if(knobX >= pos[0] - len/2 + 10 && knobX <= pos[0] + len/2 - 10) knobX = mouseX;
      else if(knobX > pos[0] + len/2 - 10) knobX --;
      else if(knobX < pos[0] - len/2 + 10) knobX ++;
    }
  }
  
  void display() {
    float pct = (knobX - (pos[0] -  len/2 + 10)) / (len - 20);
    if(pct < .5) value = 1/factor + (2 * pct * (1 - (1/factor)));
    else value = 1 + (pct - .5) * 2 * (factor - 1);
    
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    fill(160);
    rect(pos[0], pos[1], len, 40);
    line(pos[0] - len/2 + 10, pos[1], pos[0] + len/2 - 10, pos[1]);
    ellipseMode(RADIUS);
    noStroke();
    fill(240);
    circle(knobX, pos[1], 5);
    fill(0);
    textAlign(CENTER);
    textSize(12);
    text("Speed", pos[0], pos[1] - 8);
    text("" + value, pos[0], pos[1] + 16);
  }
  
  float getValue() {
    return value;
  }
}
