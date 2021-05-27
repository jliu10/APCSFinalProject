import java.util.*;

public class Track {
  ArrayDeque<Block> blockList;
  int mapNumber;
  
  Track(int map) {
    blockList = new ArrayDeque<Block>();
    mapNumber = map;
    if (map == 0) {
      Block testBlock = new Block(90, 100, 50, 100, 100);
      blockList.add(testBlock);
      
      Block testBlock1 = new Block(0, 100, 50, 100, 150);
      testBlock.setNextBlock(testBlock1);
      blockList.add(testBlock1);
      
      Block testBlock2 = new Block(90, 100, 50, 200, 150);
      testBlock1.setNextBlock(testBlock2);
      blockList.add(testBlock2);
    }
  }
  
  Block getStart() {
    return blockList.getFirst();
  }
  Block getLast() {
    return blockList.getLast();
  }
  ArrayDeque<Block> getDeque() {
    return blockList;
  }
}
