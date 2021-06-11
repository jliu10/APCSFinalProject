public class GrassBlade {
  float[] position;
  float Increment; //to animate, increment direction by this value
  float direction;
  float size;
  
  
  GrassBlade(float initX, float initY, float bladeSize) {
    position = new float[2];
    position[0] = initX; position[1] = initY;
    direction = 276;
    Increment = 0.1;
    size = bladeSize;
  }
  
  void display() {
    fill(48,183,0); stroke(48,183,0);
    float Xcor = position[0]; float Ycor = position[1];
    float d = radians(direction+90);
    float cons = 10;
    bezier(Xcor + size*cons*1.9*cos(d), Ycor + size*cons*3.9, Xcor + size*cons*1.9, Ycor + size*cons*.30, 
    Xcor + size*cons*2.40, Ycor + size*cons*.30, Xcor + size*cons*2.40, Ycor + size*cons*3.90);
    //bezier(Xcor + 5*size*sin(d),Ycor - 5*size*cos(d), Xcor - 15*size*cos(d)-25*size*sin(d), Ycor + 25*size*cos(d)-15*size*sin(d), 
    //Xcor + 15*size*cos(d)-25*size*sin(d), Ycor + 25*size*cos(d)+15*size*sin(d), Xcor + 5*size*sin(d), Ycor - 5*size*cos(d));
  }
}
