public class Round {
  int[] bloonsLeft; // index corresponds to bloonType
  int roundNumber, endTime, counter, currentTime;
  ArrayList<Bloon> bloons;
  boolean done;
  
  Round(int n) {
    roundNumber = n;
    counter = 1000;
    bloonsLeft = new int[8];
    switch(roundNumber) {
      case 1:
        endTime = 10000;
        break;
    }
  }
  
  void spawn(int num, int type, boolean isCamo, int spacing, int time) {
    int startSpawn = millis();
    if(millis() - currentGame.getStartTime() >= time && millis() - currentGame.getStartTime() <= time + 20) {
      println("spawn called");
      for(int i = 0; i < num * spacing; i++) {
        if((millis() - startSpawn) % spacing == 0) {
          currentGame.getBloons().add(new Bloon(currentGame.getTrack().getStart(), type, isCamo));
        }
      }
    }
  }
  
  void run() {
    if(counter > 0) {
      counter --;
      currentTime++;
    }
    switch(roundNumber) {
      case 1:
        spawn(5, 2, false, 2000, 3000);
        break;
    }
    
    if(millis() - currentGame.getStartTime() >= endTime && currentGame.getBloons().size() == 0) {
      done = true;
      startBattle.toggle();
      currentGame.nextRound();
    }
  }
  
  boolean getDone() {
    return done;
  }
  
  int[] getBloonsLeft() {
    return bloonsLeft;
  }
  
}
