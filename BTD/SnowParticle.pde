public class SnowParticle {
  float radius;
  float speed;
  float direction;
  float[] position;
  
  SnowParticle(float rad, float particleSpeed, float dir, float initX, float initY){
    radius = rad;
    speed = particleSpeed;
    direction = dir;
    position = new float[2];
    position[0] = initX; position[1] = initY;
  }
  void move() {
    position[0] += speed * currentGame.getSpeed() * cos(radians(direction));
    position[1] += speed * currentGame.getSpeed() * sin(radians(direction));
  }
  void display() {
    ellipseMode(RADIUS); 
    stroke(210); fill(230); 
    ellipse(position[0], position[1], radius, radius);
    move();
  }
  float getX() {
    return position[0];
  }
  float getY() {
    return position[1];
  }
  
}
