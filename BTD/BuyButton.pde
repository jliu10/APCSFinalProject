public class BuyButton extends Button {
  PImage img;
  String topText, botText;
  float topSize, botSize;
  
  BuyButton(String top, String bot,
         float x, float y, float w, float h, float ts, float bs,
         color c,
         boolean canClick,
         PImage i) {
    super("", x, y, w, h, 0, c, canClick);
    img = i;
    topText = top;
    botText = bot;
    topSize = ts;
    botSize = bs;
  }
  
  void display() {
    if(active) {
      hover();
      rectMode(CENTER);
      fill(buttonColor);
      stroke(0);
      strokeWeight(2);
      rect(pos[0], pos[1], w, h, 8);
  
      imageMode(CENTER);
      float ratio = img.height / img.width;
      image(img, pos[0], pos[1], (.8 * h)/ratio, .8 * h);
  
      textAlign(CENTER);
      fill(textColor);
      textSize(topSize); 
      text(topText, pos[0], pos[1] - (h/2 - topSize));
      textSize(botSize);
      text(botText, pos[0], pos[1] + h/2);
    }
  }
  
}
