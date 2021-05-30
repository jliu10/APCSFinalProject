abstract class Projectile {
  float[] position;
  float speed;
  float direction;
  int damage;
  
  abstract void display();
  abstract void hitBloon(ArrayList<Bloon> bloonsList);
  void move() {
    position[0] += speed * currentGame.getSpeed() * cos(radians(direction));
    position[1] += speed * currentGame.getSpeed() * sin(radians(direction));
  }
}
