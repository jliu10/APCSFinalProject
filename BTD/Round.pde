public class Round {
  int roundNumber, endTime;
  ArrayList<Bloon> bloons;
  boolean done;
  
  Round(int n) {
    roundNumber = n;
    switch(roundNumber) {
      case 1:
        endTime = 213; // manually calculate the last bloon's spawn time
          // if x is the addSpawn() that spawns the last bloon of the round, then
          // the calculation for the endTime is ((num of bloons of x) - 1 ) * spacing of x + time of x
          // ^ ceil(the above/ 4) because of speed changability
        addSpawn(14, 0, 0, 50, 200); // void addSpawn(int num, int type, int isCamo, int spacing, int time)
        break;
      case 2:
        addSpawn(30, 0, 0, 25, 200);
        endTime = 232;
        break;
      case 3:
        addSpawn(15, 0, 0, 25, 200);
        addSpawn(8, 1, 0, 20, 350);
        endTime = 138;
        break;
      case 4:
        addSpawn(10, 0, 0, 25, 200);
        addSpawn(24, 1, 0, 25, 200);
        endTime = 194;
        break;
      case 5:
        addSpawn(22, 0, 0, 25, 200);
        addSpawn(28, 1, 0, 25, 200);
        endTime = 219;
        break;
      case 6:
        addSpawn(13, 0, 0, 25, 200);
        addSpawn(15, 2, 0, 30, 250);
        endTime = 168;
        break;
      case 7:
        addSpawn(50, 1, 0, 20, 200);
        endTime = 295;
        break;
      case 8:
        addSpawn(27, 0, 0, 25, 200);
        addSpawn(30, 1, 0, 25, 200);
        endTime = 232;
        break;
      case 9:
        addSpawn(32, 1, 0, 25, 200);
        addSpawn(15, 2, 0, 20, 250);
        endTime = 244;
        break;
      case 10:
        addSpawn(32, 2, 0, 25, 200);
        endTime = 244;
      case 11:
        addSpawn(12, 2, 0, 25, 200);
        addSpawn(11, 3, 0, 40, 200);
        endTime = 150;
    }
  }
  
  void addSpawn(int num, int type, int isCamo, int spacing, int time) {
    for(int i = 0; i < num; i++, time += ceil(spacing)) {
      currentGame.getSpawns().add(new int[]{type, isCamo, ceil(time/4)});
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
