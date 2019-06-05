PImage chicken;  //<>//
PImage monster; 
PImage farmer ; 
PImage egg; 
PImage crowbarImg; 
PImage chainsawImg; 
PImage backpackImg; 
PImage keyImg;
PImage gasImg; 

PFont font;
PFont font_bold;
PImage compass_img;

int startColor, newColor, squareColor; 
float amt; 

boolean courtBlank = false; 
boolean shedBlank  = false; 

boolean pPressed   = false;
boolean pullReady  = false; 

Room room1;
Room room2; 
Room room3;
Room room4;
Room room5;
Room room6; 
Room room7;
Room room9; 
Room room10;
Room room11; 
Room room12 ;
BlankRoom room20;     // courtyard
BlankRoom room8;      // shed within courtyard

int inRoom = 1; 
int size = 20;
int totalClicks = 0;

ClipArt chEgg, crowbar, chainsaw, rm5Key, gasCan; // all interactable pulsing clipart items

PulseItem backpack, fork, knife, spoon, mallet, flashlight, feed1, feed2, feed3; 

VillagerChicken ch; 

Player player1;

Enemy goon, finalGoon1, finalGoon2;

Door door1, door2, prep_door, prep_door2, door4, door3, door5, door3to6, door6to3, door6to7,
   boardedDoor, door20toShed, doorShedto20, doorCourtto9, door9to10, door10to11, door11to12; // all doors 

Door window7tocourt;

RoomItem river, upTree, downTree; 
RoomItem room7chair ;

VillagerChicken[] friendlies = new VillagerChicken[1000]; 



void setup() {
  // size(1920, 1080); // switch to this if fullscreen is causing issues
  fullScreen(); 
  smooth();
  
  chicken = loadImage("chicken.png");
  monster = loadImage("monster.png");
  farmer = loadImage("farmer.png"); 
  egg = loadImage("egg.png");
  crowbarImg = loadImage("crowbar.png"); 
  chainsawImg = loadImage("chainsaw.png"); 
  keyImg = loadImage("key.png"); 
  gasImg = loadImage("gascan.png"); 


  startColor = color(255, 255, 255);                           // for lerping background
  newColor = color(random(255), random(255), random(255));
  amt = 0;

  font = loadFont("SitkaBanner-48.vlw");
  font_bold = loadFont("SitkaHeading-Bold-48.vlw");
  compass_img = loadImage("compass.png");

  room1  = new Room(90, 100, 31, 31, 20, #a34e00);     //(x, y, rows, cols, cellsize, hexColor);
  room2  = new Room(90, 100, 31, 31, 20, #a34e00);
  room3  = new Room(90, 100, 31, 31, 20,#AA621A);
  room4  = new Room(90, 100, 31, 31, 20, #a34e00);
  room5  = new Room(300, 100, 31, 10, 20, #7C7B7A);                            //kitchen
  room6  = new Room(90, 100, 31, 31, 20, #a34e00);                             //bathroom
  room7  = new Room(90, 100, 31, 31, 20, #a34e00);                             //bedroom
  room20 = new BlankRoom(90, 100, 35, 88, 20, #654321, courtBlank, 0);         //courtyard
  room8  = new BlankRoom(1710, 100, 7, 7, 20, #a34e00, shedBlank, #8E8787);    //shed 
  room9  = new Room(90, 100, 31, 31, 20, #a34e00);
  room10 = new Room(90, 250, 4, 88, 20, #a34e00);
  room11 = new Room(90, 100, 35, 80, 20, #a34e00); 
  room12 = new Room(90, 100, 35, 80, 20, #067C48); 

  room1.set_active(true);

  player1 = new Player(2, 5); 
  initItem(player1, room1, player1Data, "Player 1", 0, 0); 

  room7chair = new RoomItem(0, 0);
  int[][]chairData = {{0, 0}, 
    {0, 0}};
  initItem(room7chair, room7, chairData, "Chair", 29, 0);

  chEgg = new ClipArt(0, 0, egg, 1);
  int[][]eggData = {{0}}; 
  chEgg.setData(eggData);
  chEgg.setName("Egg"); 

  river = new RoomItem(0, 0);
  initItem(river, room20, riverData, "River", 11, 0); 

  upTree = new RoomItem(0, 0);
  initItem(upTree, room20, upTreeData, "Tall Tree", 15, 11); 

  downTree = new RoomItem(0, 0);
  downTree.setName("Fallen tree");
  downTree.setData(downTreeData);

  goon = new Enemy(30, 30, player1, 3, 3);
  int[][] enemyData = { { 0 } };
  initItem(goon, room3, enemyData, "Goon", 2, 30);

  finalGoon1 = new Enemy(100, 0, player1, 10, 5);
  initItem(finalGoon1, room11, enemyData, "Evil Farmer", 30, 0);

  finalGoon2 = new Enemy(100, 100, player1, 10, 5 );
  initItem(finalGoon2, room11, enemyData, "Evil Farmer", 30, 30);

  crowbar = new ClipArt(0, 0, crowbarImg, 1.25);
  int[][]crowbarData = { {80} };
  initItem(crowbar, room2, crowbarData, "Crowbar", 28, 28); 

  backpack = new PulseItem(10, 10);
  int[][] backpackData = { { #C6A34A } };
  initItem(backpack, room1, backpackData, "Backpack", 10, 10);

  feed1 = new PulseItem(0, 0);
  int[][]feedData = {{#BDBF9C}}; 
  initItem(feed1, room6, feedData, "Chicken Feed", 0, 30);

  feed2 = new PulseItem(0, 0);
  initItem(feed2, room6, feedData, "Chicken Feed", 5, 30);

  feed3 = new PulseItem(0, 80);
  initItem(feed3, room11, feedData, "Chicken Feed", 3, 79);

  chainsaw = new ClipArt(0, 5, chainsawImg, 1);
  int[][]csData = {{#790D0D}};
  initItem(chainsaw, room8, csData, "Chainsaw", 0, 6);

  gasCan = new ClipArt(0, 0, gasImg, 1);
  int[][]gcData = {{#F20000}};
  initItem(gasCan, room8, gcData, "Gas Can", 2, 5);

  flashlight = new PulseItem(0, 0);
  int[][]flData = {{#E5D5D5}};
  initItem(flashlight, room8, flData, "Flashlight", 3, 3); 

  door1 = new Door(2, 5, false);
  door1.setName("Door1");
  int[][]door1Data ={{0, 0}};
  door1.setData(door1Data);
  room1.addItem(door1, 30, 0);

  door2 = new Door(0, 30, true );
  int[][]door2Data = {
    {0}, 
    {0}, 
  };

  initItem(door2, room1, door2Data, "Door 2", 0, 30); 

  prep_door = new Door(2, 5, false);
  prep_door.gap = true; 
  prep_door.setName("Prep Room Door");
  int[][]prep_doorData ={{0, 0}};
  prep_door.setData(prep_doorData);
  room4.addItem(prep_door, 0, 15);

  prep_door2 = new Door(2, 5, false);
  prep_door2.setName("Door To Room 5");
  int[][]prep_door2Data ={{0, 0}};
  prep_door2.setData(prep_door2Data);
  room5.addItem(prep_door2, 30, 7);

  door4 = new Door(2, 5, false );
  initItem(door4, room4, prep_door2Data, "Room 3 Door", 30, 0);

  door3 = new Door(2, 5, false );
  door3.gap = true; 
  initItem(door3, room3, prep_door2Data, "Room 4 Door", 0, 0);

  door3to6 = new Door(2, 5, false);
  int[][]sideWaysDoorData ={{0, 0}};
  initItem(door3to6, room3, sideWaysDoorData, "Door to Bathroom", 30, 0);

  door6to3 = new Door(2, 5, false);
  door6to3.gap = true; 
  initItem(door6to3, room6, sideWaysDoorData, "Door to Room 3", 0, 0);

  door6to7 = new Door(2, 5, true );
  int[][]horizDoorData =  {
    {0}, 
    {0}, 
  };
  initItem(door6to7, room6, horizDoorData, "Door to Bedroom", 15, 30);

  boardedDoor = new Door(0, 0, true );
  initItem(boardedDoor, room7, horizDoorData, "Boarded Up Door", 15, 30);


  door20toShed = new Door(0, 0, true);
  initItem(door20toShed, room20, horizDoorData, "Shed Door", 0, 80);

  doorShedto20 = new Door(0, 0, false );
  doorShedto20.gap =true;
  initItem(doorShedto20, room8, horizDoorData, "Shed Door ", 0, 0);

  doorCourtto9 = new Door(0, 0, false);
  initItem(doorCourtto9, room20, sideWaysDoorData, "Door Back Inside", 34, 0); 

  door9to10 = new Door(0, 0, true);
  initItem(door9to10, room9, horizDoorData, "Room 10 Door", 29, 30);

  door10to11 = new Door(0, 0, true );
  initItem(door10to11, room10, horizDoorData, "FINAL ROOM", 0, 87);

  door11to12 = new Door(0, 0, true );
  initItem(door11to12, room11, horizDoorData, "ESCAPE DOOR", 20, 79);

  window7tocourt = new Door(0, 0, true );
  int[][]windowData = {
    {#05ACF7}, 
    {#05ACF7}, 
    {#05ACF7}, 
  };
  initItem(window7tocourt, room7, windowData, "Window", 5, 30);

  rm5Key = new ClipArt(30, 30, keyImg, 1 );
  int[][] key5Data = {{ #C1BFBF }};
  initItem(rm5Key, room3, key5Data, "Key", 30, 30);



  fork = new PulseItem(2, 5);
  int[][]forkData = {{0}};
  initItem(fork, room5, forkData, "Fork", 0, 0);

  spoon = new PulseItem(2, 5);
  int[][]spoonData = {{0}};
  initItem(spoon, room5, spoonData, "Spoon", 0, 2);

  knife = new PulseItem(2, 5);
  int[][]knifeData = {{0}};
  initItem(knife, room5, knifeData, "Knife", 0, 4);

  mallet = new PulseItem(2, 5);
  int[][]malletData = {{0}};
  initItem(mallet, room5, malletData, "Mallet", 0, 6);

  for ( int i=0; i < friendlies.length; i++) {
    friendlies[i] = new VillagerChicken((int)random(10), (int)random(10));
    room12.addItem(friendlies[i], (int)random(50), (int) random(20));
    friendlies[i].setName("Villager Chicken");
  }


}

public void initItem(RoomItem item, Room room, int[][]itemData, String name, int row, int col) {
  item.setName(name);
  item.setData(itemData);
  room.addItem(item, row, col);
}



void draw() {
  squareColor = (lerpColor(startColor, newColor, amt));
  amt += .01; 
  if (amt >= 1) {
    amt = 0.0;
    startColor = newColor; 
    newColor = color(random(255), random(255), random(255));
  }


  background(#067C48);
  fill(squareColor);  // draws cool perimeter
  for (int i = 0; i < 1920; i+=50) {
    rect(0, i, 10, 30);
    rect(i, 0, 30, 10);
    rect(1920, i, 10, 30);
    rect(i, 1080, 30, 10);
  }

  if (inRoom != 12) {
    textFont(font_bold);
    textSize(20);
    fill(0);
    text(help, 1650, 900);
    text("Player Health ", 100, 930);

    fill(0);
    smooth();
    textSize(30);
    if (inventory.size() > 0 && inventory.contains(backpack)) {
      text("PLAYER INVENTORY: " + inventory.toString().replace("[", "").replace("]", ""), 100, 875); // displays the inventory of an item /// removes ugly brackets
      text("CURRENT ITEM: " + inventory.get(inventoryLocation), 100, 830);
    }
  }

  fill(0); 

  if (treeDown) {
    room20.addItem(downTree, 15, 11);
  }

  if (room1 != null && room1.isActive()) {
    room1.show();
    fill(0);
    room1.displayItemOn();


    textFont(font_bold);
    textSize(20);
    text(room1txt, 750, 60);

    if (inventory.contains(backpack)) {
      text(grabbedPack, 750, 300);
    }


    if (itemInteract(player1, door2, 'e') && (!door2open)) {
      text(door2locked, 750, 500);
    }

    if (door2open) {
      text(door2isopen, 750, 500);
    }
  }

  if (room2 != null && room2.isActive()) {
    room2.show();
    fill(0);
    room2.displayItemOn();
    fill(0);
    textFont(font_bold);
    textSize(20);
    text(room2txt, 750, 60);

    if (inventory.contains(crowbar)) { 
      text(grabbedCrowbar, 750, 350); //text, time, xloc, yloc
    }
  }

  if (room3 != null && room3.isActive ()) {
    room3.show();
    fill(0); 
    room3.displayItemOn();

    text(room3txt, 750, 60);

    if (onEnemy(goon)) {   // if touching enemy lower health
      player1.health--;
    }

    if (itemInteract(player1, door3to6, 'e') && (!door6open)) {
      text(door6locked, 750, 500);
    } else if (door6open) { 
      text(door6isopen, 750, 500);
    }
  }

  if (room4 != null && room4.isActive()) {
    room4.show();
    fill(0);
    room4.displayItemOn();

    textSize(20);
    text(room4txt, 750, 60);
  }

  if (room5 != null && room5.isActive()) {
    room5.show();
    fill(0);
    room5.displayItemOn();

    textSize(20);
    text(room5txt, 750, 60);
  }

  if (room6 != null && room6.isActive()) {
    room6.show();
    room6.displayItemOn();
    textSize(20);
    text(room6txt, 750, 60);
  }

  if (room7 != null && room7.isActive()) {
    room7.show();
    room7.displayItemOn();

    if (onItem(room7chair)) {
      pullReady = true;
    }

    if (pullReady) {
      pullItem(player1, room7chair);
    }
    fill(0);
    textSize(20);
    text(room7txt, 750, 60);

    if ( !window7open && itemInteract(player1, window7tocourt, 'e')) {
      text(windowHigh, 750, 500);
    } else if (itemInteract(player1, boardedDoor, 'e')) {
      text(doorHellaBoardedUp, 750, 500);
    } else if (itemInteract(player1, boardedDoor, 'x' )&& inventory.get(inventoryLocation) == crowbar){
      text("Yo try to use the crowbar, but it wont budge" , 750, 500);
    }
    
  }

  if (room20 != null && room20.isActive()) { // this here is the courtyard 
    room20.setBlank(false);
    room20.show();
    room8.show();
    room8.setBlank(true);
    fill(0);
    room20.displayItemOn();
    textSize(20);
    //text(crtYrdtxt, 0 ,60);
  }


  if (room8 != null && room8.isActive()) {
    room8.setBlank(false);
    room20.show();
    room8.show();
    room20.setBlank(true); 

    fill(0);
    room8.displayItemOn();
    textSize(20);
  }

  if (room9 != null && room9.isActive()) {
    room9.show();
    fill(0);
    room9.displayItemOn();
    textSize(20);
    text(rm9txt, 750, 60);
  }

  if (room10 != null && room10.isActive()) {
    room10.show();
    fill(0);
    room10.displayItemOn();
    textSize(20);
  }

  if (room11 != null && room11.isActive()) {
    room11.show();
    fill(0);
    room11.displayItemOn();
    textSize(20);
    text(rm11txt, 700, 50);


    if (finalGoon1.getHealth() < 0 && finalGoon1.getHealth() <= 0) {
      door11to12Open = true;
      text("You defeated the farmers! Run away quick!", 700, 80);
    }

    if (itemInteract(player1, door11to12, 'e') && !door11to12Open) {
      text("You must defeat the farmers before opening these doors!", 700, 990);
    }

    if (finalGoon1.getHealth() > 0) {
      text("Farmer 1 Health: "+ finalGoon1.enemyHealth, 100, 960);
    } else if (finalGoon1.getHealth() <= 0) {
      text("Farmer 1 is Ded!", 100, 960);
    }

    if (finalGoon2.getHealth() > 0 ) {
      text("Farmer 2 Health: "+ finalGoon2.enemyHealth, 100, 990);
    } else if (finalGoon2.getHealth() <= 0) {
      text("Farmer 2 is Ded!", 100, 990);
    }


    if (onEnemy(finalGoon1) && finalGoon1.getHealth() > 0 ) {   // if touching enemy lower health
      player1.health-=.5;
    } else if (onEnemy(finalGoon2) && finalGoon2.getHealth() > 0) {
      player1.health-=.5;
    }
  }

  if (room12 != null && room12.isActive()) {
    room12.show();
    fill(0);
    room12.displayItemOn();
    textSize(30);
    text(winnerTxt, 100, 900);
  }







  fill(0);
  compass_img.resize(200, 200);
  //image(compass_img, 270, 800); 

  textFont(font_bold);
  textSize(70);
  if (inRoom != 20 && inRoom != 12) {
    text("ROOM "+ inRoom, 275, 80);
  } else if (inRoom == 20) {
    text("COURTYARD", width/2 - 100, 80);
  }
    

  if (player1.health >= 50) {  // changes health bar color 
    fill(#03FA04);
    textSize(30); 
    text(player1.health, 250, 930);
  } else if (player1.health > 0) { 
    fill(#FA0B03);
    textSize(30);
    text(player1.health, 250, 930);
  } else {                    
    background(0);     // ends game if health == 0
    fill(#AD1A1A); 
    textSize(100);
    smooth(); 
    text("YOU HAVE DIED", height / 2, width / 4);
  }
}

public boolean itemClicked(RoomItem item, Room room) {
  if (room.getCellX(mouseX) == item.col() && room.getCellY(mouseY) == item.row()) { // ***use this for breaking doors and whatnot *****
    System.out.println("HERE");
    return true;
  }
  return false;
}

public int clicks(char ch) {
  if (totalClicks > 5) {
    totalClicks = 0;
  }
  if (key == ch) {
    totalClicks++;
    System.out.print(totalClicks);
  }
  return totalClicks;
}



public boolean onItem(RoomItem item) {
  if (player1.row() == item.row() && player1.col() == item.col()) {
    return true;
  }
  return false;
}

public boolean onEnemy(Enemy villian) {
  if (player1.row() == villian.getrow() && player1.col() == villian.getcol() ) {
    return true;
  }
  return false;
}


public boolean itemInteract(RoomItem player, RoomItem item, char keyName) {
  if (!inInventory(item) ) {
    if (key == keyName && player.row() == item.row() && player.col() == item.col()) {
      return true;
    }
  }
  return false;
}



public boolean isAttack(RoomItem player, RoomItem attackedItem, RoomItem neededItem, Room room) {
  if ( (player.row() == attackedItem.row() && player.col() == attackedItem.col())  &&  (inventory.contains(neededItem)) && (itemClicked(attackedItem, room)) ) {
    return true;
  }
  return false;
}


public void pullItem(RoomItem player, RoomItem pulled) {
  if (pPressed) {
    pulled.newRow(player.row());
    pulled.newCol(player.col());
  }
}

public boolean inInventory(RoomItem item) {
  for (RoomItem items : inventory) {
    if (items.equals(item)) {
      return true;
    }
  }
  return false;
}

void mousePressed() {
  room1.dumpItems();
}
