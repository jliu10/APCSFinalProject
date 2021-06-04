public class Round {
  int roundNumber, endTime;
  ArrayList<Bloon> bloons;
  boolean done;
  
  Round(int n) {
    roundNumber = n;
    switch(roundNumber) {
      case 1:
        endTime = 1000; // manually calculate the last bloon's spawn time
        addSpawn(5, 0, 0, 200, 200); // void addSpawn(int num, int type, int isCamo, int spacing, int time)
        break;
      case 2:
        addSpawn(5, 0, 0, 100, 200);
        addSpawn(5, 1, 0, 150, 700);
        endTime = 1300;
        break;
      case 3:
        addSpawn(10, 0, 0, 100, 200);
        addSpawn(10, 1, 0, 10, 1200);
        endTime = 1290;
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
