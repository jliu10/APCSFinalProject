import java.util.*;

public class Track {
  ArrayDeque<Block> blockList;
  int mapNumber;
  
  Track(int map) {
    blockList = new ArrayDeque<Block>();
    mapNumber = map;
    if (map == 0) {
      float red = 250;
      float green = 150;
      float blue = 0;
      Block startBlock = new Block(0, 100, 75, -50, 250,red,green,blue);//needs to be invisible
      blockList.add(startBlock);
      
      
      Block firstBlock = new Block(0, 100, 75, 50, 250,red,green,blue);
      startBlock.setNextBlock(firstBlock);
      blockList.add(firstBlock);
      
      Block secondBlock = new Block(0, 100, 75, 150, 250,red,green,blue);
      firstBlock.setNextBlock(secondBlock);
      blockList.add(secondBlock);
      
      Block thirdBlock = new Block(270, 75, 75, 237.5, 250,red,green,blue); //turn up
      secondBlock.setNextBlock(thirdBlock);
      blockList.add(thirdBlock);
      
      Block fourthBlock = new Block(270, 75, 100, 237.5, 162.5,red,green,blue);
      thirdBlock.setNextBlock(fourthBlock);
      blockList.add(fourthBlock);
      
      Block fifthBlock = new Block(0, 75, 75, 237.5, 75,red,green,blue); //turn right
      fourthBlock.setNextBlock(fifthBlock);
      blockList.add(fifthBlock);
      
      Block sixthBlock = new Block(0, 100, 75, 325, 75,red,green,blue); 
      fifthBlock.setNextBlock(sixthBlock);
      blockList.add(sixthBlock);
      
      Block sevenBlock = new Block(90, 75, 75, 412.5, 75,red,green,blue); //turn down
      sixthBlock.setNextBlock(sevenBlock);
      blockList.add(sevenBlock);
      
      Block block8 = new Block(90, 75, 100, 412.5, 162.5,red,green,blue);
      sevenBlock.setNextBlock(block8);
      blockList.add(block8);
      
      Block block9 = new Block(90, 75, 100, 412.5, 162.5,red,green,blue);
      block8.setNextBlock(block9);
      blockList.add(block9);
      
      Block block10 = new Block(90, 75, 100, 412.5, 262.5,red,green,blue);
      block9.setNextBlock(block10);
      blockList.add(block10);
      
      Block block11 = new Block(90, 75, 100, 412.5, 362.5,red,green,blue);
      block10.setNextBlock(block11);
      blockList.add(block11);
      
      Block block12 = new Block(180, 75, 75, 412.5, 450,red,green,blue); //turn left
      block11.setNextBlock(block12);
      blockList.add(block12);
      
      Block block13 = new Block(180, 100, 75, 325, 450,red,green,blue);
      block12.setNextBlock(block13);
      blockList.add(block13);
      
      Block block14 = new Block(180, 100, 75, 225, 450,red,green,blue);
      block13.setNextBlock(block14);
      blockList.add(block14);
      
      Block block15 = new Block(90, 75, 75, 137.5, 450,red,green,blue); //turn down
      block14.setNextBlock(block15);
      blockList.add(block15);
      
      Block block16 = new Block(90, 75, 100, 137.5, 537.5,red,green,blue);
      block15.setNextBlock(block16);
      blockList.add(block16);
      
      Block block17 = new Block(0, 75, 75, 137.5, 625,red,green,blue); //turn right
      block16.setNextBlock(block17);
      blockList.add(block17);
      
      Block block18 = new Block(0, 100, 75, 225, 625,red,green,blue);
      block17.setNextBlock(block18);
      blockList.add(block18);
      
      Block block19 = new Block(0, 100, 75, 325, 625,red,green,blue);
      block18.setNextBlock(block19);
      blockList.add(block19);
      
      Block block20 = new Block(0, 100, 75, 425, 625,red,green,blue);
      block19.setNextBlock(block20);
      blockList.add(block20);
      
      Block block21 = new Block(0, 100, 75, 525, 625,red,green,blue);
      block20.setNextBlock(block21);
      blockList.add(block21);
      
      Block block22 = new Block(270, 75, 75, 612.5, 625,red,green,blue);
      block21.setNextBlock(block22);
      blockList.add(block22);
      
      Block block23 = new Block(270, 75, 100, 612.5, 537.5,red,green,blue);
      block22.setNextBlock(block23);
      blockList.add(block23);
      
      Block block24 = new Block(270, 75, 100, 612.5, 437.5,red,green,blue);
      block23.setNextBlock(block24);
      blockList.add(block24);
      
      Block block25 = new Block(270, 75, 100, 612.5, 337.5,red,green,blue);
      block24.setNextBlock(block25);
      blockList.add(block25);
      
      Block block26 = new Block(270, 75, 100, 612.5, 237.5,red,green,blue);
      block25.setNextBlock(block26);
      blockList.add(block26);
      
      Block block27 = new Block(270, 75, 100, 612.5, 137.5,red,green,blue);
      block26.setNextBlock(block27);
      blockList.add(block27);
      
      Block block28 = new Block(270, 75, 100, 612.5, 37.5,red,green,blue);
      block27.setNextBlock(block28);
      blockList.add(block28);
      
      Block block29 = new Block(270, 75, 75, 612.5, -50,red,green,blue);
      block28.setNextBlock(block29);
      blockList.add(block29); 
    }
    else if (map == 1) {
      float red = 150;
      float green = 150;
      float blue = 100;
      Block startBlock = new Block(0, 100, 75, -50, 250,red,green,blue);//needs to be invisible
      blockList.add(startBlock);
      
      
      Block firstBlock = new Block(0, 100, 75, 50, 250,red,green,blue);
      startBlock.setNextBlock(firstBlock);
      blockList.add(firstBlock);
      
      Block secondBlock = new Block(0, 100, 75, 150, 250,red,green,blue);
      firstBlock.setNextBlock(secondBlock);
      blockList.add(secondBlock);
      
      Block thirdBlock = new Block(270, 75, 75, 237.5, 250,red,green,blue); //turn up
      secondBlock.setNextBlock(thirdBlock);
      blockList.add(thirdBlock);
      
      Block fourthBlock = new Block(270, 75, 100, 237.5, 162.5,red,green,blue);
      thirdBlock.setNextBlock(fourthBlock);
      blockList.add(fourthBlock);
      
      Block fifthBlock = new Block(0, 75, 75, 237.5, 75,red,green,blue); //turn right
      fourthBlock.setNextBlock(fifthBlock);
      blockList.add(fifthBlock);
      
      Block sixthBlock = new Block(0, 100, 75, 325, 75,red,green,blue); 
      fifthBlock.setNextBlock(sixthBlock);
      blockList.add(sixthBlock);
      
      Block sevenBlock = new Block(90, 75, 75, 412.5, 75,red,green,blue); //turn down
      sixthBlock.setNextBlock(sevenBlock);
      blockList.add(sevenBlock);
      
      Block block8 = new Block(90, 75, 100, 412.5, 162.5,red,green,blue);
      sevenBlock.setNextBlock(block8);
      blockList.add(block8);
      
      Block block9 = new Block(90, 75, 100, 412.5, 162.5,red,green,blue);
      block8.setNextBlock(block9);
      blockList.add(block9);
      
      Block block10 = new Block(90, 75, 100, 412.5, 262.5,red,green,blue);
      block9.setNextBlock(block10);
      blockList.add(block10);
      
      Block block11 = new Block(90, 75, 100, 412.5, 362.5,red,green,blue);
      block10.setNextBlock(block11);
      blockList.add(block11);
      
      Block block12 = new Block(180, 75, 75, 412.5, 450,red,green,blue); //turn left
      block11.setNextBlock(block12);
      blockList.add(block12);
      
      //Block block13 = new Block(180, 100, 75, 325, 450);
      //block12.setNextBlock(block13);
      //blockList.add(block13);
      
      //Block block14 = new Block(180, 100, 75, 225, 450);
      //block13.setNextBlock(block14);
      //blockList.add(block14);
      
      //Block block15 = new Block(90, 75, 75, 137.5, 450); //turn down
      //block14.setNextBlock(block15);
      //blockList.add(block15);
      
      //Block block16 = new Block(90, 75, 100, 137.5, 537.5);
      //block15.setNextBlock(block16);
      //blockList.add(block16);
      
      //Block block17 = new Block(0, 75, 75, 137.5, 625); //turn right
      //block16.setNextBlock(block17);
      //blockList.add(block17);
      
      //Block block18 = new Block(0, 100, 75, 225, 625);
      //block17.setNextBlock(block18);
      //blockList.add(block18);
      
      //Block block19 = new Block(0, 100, 75, 325, 625);
      //block18.setNextBlock(block19);
      //blockList.add(block19);
      
      //Block block20 = new Block(0, 100, 75, 425, 625);
      //block19.setNextBlock(block20);
      //blockList.add(block20);
      
      //Block block21 = new Block(0, 100, 75, 525, 625);
      //block20.setNextBlock(block21);
      //blockList.add(block21);
      
      //Block block22 = new Block(270, 75, 75, 612.5, 625);
      //block21.setNextBlock(block22);
      //blockList.add(block22);
      
      //Block block23 = new Block(270, 75, 100, 612.5, 537.5);
      //block22.setNextBlock(block23);
      //blockList.add(block23);
      
      //Block block24 = new Block(270, 75, 100, 612.5, 437.5);
      //block23.setNextBlock(block24);
      //blockList.add(block24);
      
      //Block block25 = new Block(270, 75, 100, 612.5, 337.5);
      //block24.setNextBlock(block25);
      //blockList.add(block25);
      
      //Block block26 = new Block(270, 75, 100, 612.5, 237.5);
      //block25.setNextBlock(block26);
      //blockList.add(block26);
      
      //Block block27 = new Block(270, 75, 100, 612.5, 137.5);
      //block26.setNextBlock(block27);
      //blockList.add(block27);
      
      //Block block28 = new Block(270, 75, 100, 612.5, 37.5);
      //block27.setNextBlock(block28);
      //blockList.add(block28);
      
      //Block block29 = new Block(270, 75, 75, 612.5, -50);
      //block28.setNextBlock(block29);
      //blockList.add(block29);
      
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
