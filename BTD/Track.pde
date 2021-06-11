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
      
      Block startBlock = new Block(0, 100, 75, -62.5, 650,red,green,blue);//needs to be invisible
      blockList.add(startBlock);
      
      Block firstBlock = new Block(0, 100, 75, 37.5, 650,red,green,blue);
      startBlock.setNextBlock(firstBlock);
      blockList.add(firstBlock);
      
      Block secondBlock = new Block(0, 100, 75, 137.5, 650,red,green,blue);
      firstBlock.setNextBlock(secondBlock);
      blockList.add(secondBlock);
      
      Block thirdBlock = new Block(0, 100, 75, 237.5, 650,red,green,blue);
      secondBlock.setNextBlock(thirdBlock);
      blockList.add(thirdBlock);
      
      Block fourthBlock = new Block(270, 75, 75, 325, 650,red,green,blue);
      thirdBlock.setNextBlock(fourthBlock);
      blockList.add(fourthBlock);
      
      Block fifthBlock = new Block(270, 75, 100, 325, 562.5,red,green,blue); //turn up
      fourthBlock.setNextBlock(fifthBlock);
      blockList.add(fifthBlock);
      
      Block block6 = new Block(270, 75, 100, 325, 462.5,red,green,blue); 
      fifthBlock.setNextBlock(block6);
      blockList.add(block6);
      
      Block block7 = new Block(270, 75, 75, 325, 375,red,green,blue); 
      block6.setNextBlock(block7);
      blockList.add(block7);
      
      Block block8 = new Block(270, 75, 100, 325, 287.5,red,green,blue); 
      block7.setNextBlock(block8);
      blockList.add(block8);
      
      Block block9 = new Block(270, 75, 100, 325, 187.5,red,green,blue); 
      block8.setNextBlock(block9);
      blockList.add(block9);
      
      Block block10 = new Block(180, 75, 75, 325, 100,red,green,blue); //turn left
      block9.setNextBlock(block10);
      blockList.add(block10);
      
      Block block11 = new Block(180, 100, 75, 237.5, 100,red,green,blue); 
      block10.setNextBlock(block11);
      blockList.add(block11);
      
      Block block12 = new Block(180, 100, 75, 137.5, 100,red,green,blue); 
      block11.setNextBlock(block12);
      blockList.add(block12);
      
      Block block13 = new Block(90, 75, 75, 50, 100,red,green,blue);  //turn down
      block12.setNextBlock(block13);
      blockList.add(block13);
      
      Block block14 = new Block(90, 75, 100, 50, 187.5,red,green,blue);
      block13.setNextBlock(block14);
      blockList.add(block14);
      
      Block block15 = new Block(90, 75, 100, 50, 287.5,red,green,blue);
      block14.setNextBlock(block15);
      blockList.add(block15);
      
      Block block16 = new Block(0, 75, 75, 50, 375,red,green,blue); //turn right
      block15.setNextBlock(block16);
      blockList.add(block16);
      
      Block block17 = new Block(0, 100, 75, 137.5, 375,red,green,blue); 
      block16.setNextBlock(block17);
      blockList.add(block17);
      
      Block block18 = new Block(0, 100, 75, 237.5, 375,red,green,blue);
      block17.setNextBlock(block18);
      blockList.add(block18);
      
      Block block19 = new Block(0, 75, 75, 325, 375,red,green,blue); //completing the loop
      block18.setNextBlock(block19);
      blockList.add(block19);
      
      Block block20 = new Block(0, 75, 75, 400, 375,red,green,blue);
      block19.setNextBlock(block20);
      blockList.add(block20);
      
      Block block21 = new Block(0, 75, 75, 475, 375,red,green,blue); //reflection
      block20.setNextBlock(block21);
      blockList.add(block21);
      
      Block block22 = new Block(0, 100, 75, 562.5, 375,red,green,blue); 
      block21.setNextBlock(block22);
      blockList.add(block22);
      
      Block block23 = new Block(0, 100, 75, 662.5, 375,red,green,blue); 
      block22.setNextBlock(block23);
      blockList.add(block23);
      
      Block block24 = new Block(270, 75, 75, 750, 375,red,green,blue); //turn up
      block23.setNextBlock(block24);
      blockList.add(block24);
      
      Block block25 = new Block(270, 75, 100, 750, 287.5,red,green,blue);
      block24.setNextBlock(block25);
      blockList.add(block25);
      
      Block block26 = new Block(270, 75, 100, 750, 187.5,red,green,blue);
      block25.setNextBlock(block26);
      blockList.add(block26);
      
      Block block27 = new Block(180, 75, 75, 750, 100,red,green,blue); //turn left
      block26.setNextBlock(block27);
      blockList.add(block27);
      
      Block block28 = new Block(180, 100, 75, 662.5, 100,red,green,blue);
      block27.setNextBlock(block28);
      blockList.add(block28);
      
      Block block29 = new Block(180, 100, 75, 562.5, 100,red,green,blue);
      block28.setNextBlock(block29);
      blockList.add(block29);
      
      Block block30 = new Block(90, 75, 75, 475, 100,red,green,blue); //turn down
      block29.setNextBlock(block30);
      blockList.add(block30);
      
      Block block31 = new Block(90, 75, 100, 475, 187.5,red,green,blue);
      block30.setNextBlock(block31);
      blockList.add(block31);
      
      Block block32 = new Block(90, 75, 100, 475, 287.5,red,green,blue);
      block31.setNextBlock(block32);
      blockList.add(block32);
      
      Block block33 = new Block(90, 75, 75, 475, 375, red,green,blue);
      block32.setNextBlock(block33);
      blockList.add(block33);
      
      Block block34 = new Block(90, 75, 100, 475, 462.5, red,green,blue);
      block33.setNextBlock(block34);
      blockList.add(block34);
      
      Block block35 = new Block(90, 75, 100, 475, 562.5, red,green,blue);
      block34.setNextBlock(block35);
      blockList.add(block35);
      
      Block block36 = new Block(0, 75, 75, 475, 650, red,green,blue); //turn right
      block35.setNextBlock(block36);
      blockList.add(block36);
      
      Block block37 = new Block(0, 100, 75, 562.5, 650, red,green,blue);
      block36.setNextBlock(block37);
      blockList.add(block37);
      
      Block block38 = new Block(0, 100, 75, 662.5, 650, red,green,blue);
      block37.setNextBlock(block38);
      blockList.add(block38);
      
      Block block39 = new Block(0, 100, 75, 762.5, 650, red,green,blue);
      block38.setNextBlock(block39);
      blockList.add(block39);
      
      Block block40 = new Block(0, 100, 75, 862.5, 650, red,green,blue);
      block39.setNextBlock(block40);
      blockList.add(block40);
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
