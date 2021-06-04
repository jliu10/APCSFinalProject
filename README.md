# APCSFinalProject

https://docs.google.com/document/d/1W2oKpcipvNo9vgylLO3WmfNikOwWcYjb9leJDrHvKuI/edit?usp=sharing

Group Name: Srinath Liu
<br>
Justin Liu, Srinath Mahankali

Bloons Tower Defense: Bloons Tower Defense is a Tower Defense game played on a track over several rounds. In each round, a set number of Bloons (balloons) spawn at the start location of the track, moving towards the end of the track. The goal is to pop all of the bloons before they reach the end of the track. If a Bloon reaches the end of the track, the number of lives decreases (the game starts with 100 lives), and the game is lost when the number of lives reaches 0. To pop the Bloons, towers are available to buy with money that is given at the start of the game, and these towers pop the Bloons. Money is also earned by popping Bloons, and it is also earned at the end of each round. Bloons come in many different types, which affects how fast they move through the track and how much damage they are able to take before being fully popped. To increase the effectiveness of the towers, upgrades are available, and purchasing upgrades will also cost money.

Run Instructions: Open BTD.pde and click "Run".

UML diagram: ![image](https://user-images.githubusercontent.com/59585690/120741228-a708bf80-c4c2-11eb-8164-fdb1182d2661.png)

DEV LOG:
- Justin 2021-05-25: Set up page system, created class Game with essentials
- Justin 2021-05-26: Created and developed classes Button and Bloon; developed class Game
- Srinath 2021-05-26: Developed Block class
- Justin 2021-05-27: Completed? class Block; added proper Block-based Bloon movement; added "last block" mechanic
- Srinath 2021-05-27: Developed Track class; updated Game class to contain Track class; tested Track class in BTD.pde
- Srinath 2021-05-27: Created first Track; fixed move() in Bloon class
- Justin 2021-05-27: Added side menu with functioning pause/resume button
- Justin 2021-05-28: Added map selection, main menu, and instructions pages with navigation buttons
- Srinath 2021-05-28: Created abstract class Tower
- Justin 2021-05-29: Added "Start Battle" button
- Srinath 2021-05-29: Created abstract class Projectile
- Srinath 2021-05-30: Created sellTower function; created IceTower
- Justin 2021-05-30: Added tower shop menu; added purchasing and tower placement mechanism
- Justin 2021-05-31: Developed tower placement and round and bloon spawning system
- Srinath 2021-05-31: Fixed shoot() in IceTower; created animation for IceTower and frozen bloons; created class Dart and DartTower
- Justin 2021-06-01: Made "Sell" button
- Srinath 2021-06-01: Fixed Dart and DartTower to make Dart move in the correct direction towards target bloon
- Justin 2021-06-03: Added upgrades for Dart Tower
