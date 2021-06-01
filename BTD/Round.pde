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
    int startSpawn = currentTime;
    if(currentTime == time) {
      println("spawn called");
      for(int i = 0; i < num * spacing; i++) {
        if((currentTime - startSpawn) % spacing == 0) {
          currentGame.getBloons().add(new Bloon(currentGame.getTrack().getStart(), type, isCamo));
        }
      }
    }
  }
  
  void run() {
    println("currentTime: " + currentTime);
    if(counter > 0) {
      counter --;
      currentTime ++;
    }
    else counter = 1000;
    switch(roundNumber) {
      case 1:
        spawn(5, 2, false, 2000, 1000);
        break;
    }
    
    if(currentTime >= endTime && currentGame.getBloons().size() == 0) {
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
