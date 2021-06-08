public class Round {
  int roundNumber, endTime;
  ArrayList<Bloon> bloons;
  boolean done;
  
  Round(int n) {
    roundNumber = n;
    switch(roundNumber) {
      case 1:
        endTime = 850; // manually calculate the last bloon's spawn time
          // if x is the the set of bloons whose last bloon will spawn at the greatest time value, then
          // the calculation for the endTime is ((num of bloons of x) - 1 ) * spacing of x + time of x
        addSpawn(14, 0, 0, 50, 200); // void addSpawn(int num, int type, int isCamo, int spacing, int time)
        break;
      case 2:
        addSpawn(30, 0, 0, 25, 200);
        endTime = 925;
        break;
      case 3:
        addSpawn(15, 0, 0, 25, 200);
        addSpawn(8, 1, 0, 20, 350);
        endTime = 550;
        break;
      case 4:
        addSpawn(10, 0, 0, 25, 200);
        addSpawn(24, 1, 0, 25, 200);
        endTime = 775;
        break;
      case 5:
        addSpawn(22, 0, 0, 25, 200);
        addSpawn(28, 1, 0, 25, 200);
        endTime = 875;
        break;
      case 6:
        addSpawn(13, 0, 0, 25, 200);
        addSpawn(15, 2, 0, 30, 250);
        endTime = 670;
        break;
    }
  }
  
  void addSpawn(int num, int type, int isCamo, int spacing, int time) {
    for(int i = 0; i < num; i++, time += spacing) {
      currentGame.getSpawns().add(new int[]{type, isCamo, time});
    }
  }
  
  void run() {
    if(currentGame.getCurrentTime() >= endTime + 1 && currentGame.getBloons().size() == 0) {
      done = true;
      currentGame.addMoney(100 + roundNumber);
      startBattle.toggle();
      currentGame.nextRound();
    }
  }
  
  boolean getDone() {
    return done;
  }
  
}
