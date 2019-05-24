//<>// //<>// //<>// //<>//

int startColor, newColor; 
float amt; 

boolean courtBlank = false; 
boolean shedBlank = false; 

boolean pPressed = false;
boolean pullReady = false; 

boolean GODMODE = true ;

PFont font;
PFont font_bold;
PImage compass_img;

Room room1;
Room room2; 
Room room3;
Room room4;
Room room5;
Room room6; 
Room room7;
BlankRoom room20; // courtyard 
BlankRoom room8;  // shed in courtyard

RoomItem player1;
Enemy goon, goon2; 

RoomItem door1, door2, prep_door, prep_door2, door4, door3, door5, door3to6, door6to3, door6to7, window7tocourt, boardedDoor, door20toShed, doorShedto20; // all doors 

RoomItem room7chair ;

PulseItem backpack; 
PulseItem crowbar; 

PulseItem fork, knife, spoon, mallet; // for room 5 kitchen 

PulseItem rm5Key; 

StopWatch sw = new StopWatch();

int size = 20;

int inRoom = 20; 

int totalClicks = 0;

//int playerHealth = 100; 





/*
int[][] door1 = {
 {50,100},
 {0},
 {0},
 {#8F2CB7}
 };
 */


void setup() {
  size(1920, 1080);

  //startColor = color(255,255,255);
  //newColor = color(random(30,100), random(30,100), random(30,100));
  //amt = 0;
  //background(startColor);


  font = loadFont("SitkaBanner-48.vlw");
  font_bold = loadFont("SitkaHeading-Bold-48.vlw");
  compass_img = loadImage("compass.png");


  //Timer timer = new Timer();

  room1 = new Room(90, 100, 31, 31, 20, #4c5666); //(x, y, rows, cols, cellsize, hexColor)
  //  room1.set_active(true);

  room2 =  new Room(90, 100, 31, 31, 20, #4c5666);
  room3 = new Room(90, 100, 31, 31, 20, #4c5666);
  room4 = new Room(90, 100, 31, 31, 20, #4c5666);
  room5 = new Room(300, 100, 31, 10, 20, #4c5666);       //kitchen
  room6 = new Room(90, 100, 31, 31, 20, #4c5666);       //bathroom
  room7 = new Room(90, 100, 31, 31, 20, #4c5666);      //bedroom
  room20 = new BlankRoom(90, 100, 35, 88, 20, #8e4812, courtBlank, 0);    //courtyard
  room8 = new BlankRoom(1710, 100, 7, 7, 20, #4c5666, shedBlank, #8E8787);    // shed 

  // room8.set_active(true); 
  room20.set_active(true);

  room7chair = new RoomItem(0, 0);
  int[][]chairData = {{0, 0}, 
    {0, 0}};
  initItem(room7chair, room7, chairData, "Chair", 29, 0);

  player1 = new RoomItem(2, 5); 
  int[][] player1Data = { {#AF1E1E} };
  initItem(player1, room20, player1Data, "Player 1", 0, 0); // change rm to noty have to navigate 
  player1.addInventory(backpack);


  goon = new Enemy(30, 30, player1);
  int[][] enemyData = { { 0 } };
  initItem(goon, room3, enemyData, "Goon", 2, 30);



  backpack = new PulseItem (10, 10);
  int[][] backpackData = { { #B5651D } };
  initItem(backpack, room1, backpackData, "Backpack", 10, 10);


  crowbar = new PulseItem(30, 30);
  int[][]crowbarData = { {80} };
  initItem(crowbar, room2, crowbarData, "Crowbar", 30, 30); 


  door1 = new RoomItem(2, 5);
  door1.setName("Door1");
  int[][]door1Data ={{0, 0}};
  door1.setData(door1Data);
  room1.addItem(door1, 30, 0);

  door2 = new RoomItem(0, 30);
  int[][]door2Data = {
    {0}, 
    {0}, 
  };

  initItem(door2, room1, door2Data, "Door 2", 0, 30); 


  prep_door = new RoomItem(2, 5);
  prep_door.setName("Prep Room Door");
  int[][]prep_doorData ={{0, 0}};
  prep_door.setData(prep_doorData);
  room4.addItem(prep_door, 0, 15);
  //room5.addItem(prep_door,30,7);

  prep_door2 = new RoomItem(2, 5);
  prep_door2.setName("Door To Room 5");
  int[][]prep_door2Data ={{0, 0}};
  prep_door2.setData(prep_door2Data);
  room5.addItem(prep_door2, 30, 7);

  door4 = new RoomItem(2, 5);
  initItem(door4, room4, prep_door2Data, "Room 3 Door", 30, 0);

  door3 = new RoomItem(2, 5);
  initItem(door3, room3, prep_door2Data, "Room 4 Door", 0, 0);

  door3to6 = new RoomItem(2, 5);
  int[][]sideWaysDoorData ={{0, 0}};
  initItem(door3to6, room3, sideWaysDoorData, "Door to Bathroom", 30, 0);

  door6to3 = new RoomItem(2, 5);
  initItem(door6to3, room6, sideWaysDoorData, "Door to Room 3", 0, 0);

  door6to7 = new RoomItem(2, 5);
  int[][]horizDoorData =  {
    {0}, 
    {0}, 
  };
  initItem(door6to7, room6, horizDoorData, "Door to Bedroom", 15, 30);

  boardedDoor = new RoomItem(0, 0);
  initItem(boardedDoor, room7, horizDoorData, "Boarded Up Door", 15, 30);
  
  
  door20toShed = new RoomItem(0,0);
  initItem(door20toShed, room20, horizDoorData, "Shed Door", 0, 80);
  
  doorShedto20 = new RoomItem(0,0);
  initItem(doorShedto20, room8, horizDoorData, "Shed Door " , 0,0);

  window7tocourt = new RoomItem(0, 0);
  int[][]windowData = {
    {#05ACF7}, 
    {#05ACF7}, 
    {#05ACF7}, 
  };
  initItem(window7tocourt, room7, windowData, "Window", 5, 30);

  rm5Key = new PulseItem(30, 30);
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
}

public void initItem(RoomItem item, Room room, int[][]itemData, String name, int row, int col) {
  item.setName(name);
  item.setData(itemData);
  room.addItem(item, row, col);
}







void draw() {
  //background(lerpColor(startColor, newColor, amt));
  //amt += .002; 
  //if (amt >= 1){
  //  amt = 0.0;
  //  startColor = newColor; 
  //  newColor = color(random(30, 100), random(30,100), random(30,100));
  //}

  background(#067C48);


  textFont(font_bold);
  textSize(20);
  fill(0);
  text(help, 1650, 900);

  text("Player Health ", 100, 930);

  // System.out.println(goon.getY() + " " );




  fill(0); 





  if (room1 != null && room1.isActive()) {
    room1.show();
    room1.displayItemOn();

    fill(0);
    textFont(font_bold);
    textSize(20);
    text(room1txt, 750, 60);

    if (inventory.contains(backpack)) {
      textTimer(grabbedPack, 5, 750, 300);
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
    room2.displayItemOn();
    textFont(font_bold);
    textSize(20);
    text(room2txt, 750, 60);

    if (inventory.contains(crowbar)) { 
      textTimer(grabbedCrowbar, 5, 750, 350); //text, time, xloc, yloc
    }
  }

  if (room3 != null && room3.isActive ()) {
    room3.show();
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
    room4.displayItemOn();
    textSize(20);
    text(room4txt, 750, 60);
  }

  if (room5 != null && room5.isActive()) {
    room5.show();
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

    textSize(20);
    text(room7txt, 750, 60);

    if ( !window7open && itemInteract(player1, window7tocourt, 'e')) {
      text(windowHigh, 750, 500);
    } else if (itemInteract(player1, boardedDoor, 'e')) {
      text(doorHellaBoardedUp, 750, 500);
    }
  }

  if (room20 != null && room20.isActive()) { // this here is the courtyard 
    room20.setBlank(false);
    room20.show();
    room8.show();
    room8.setBlank(true);

    room20.displayItemOn();
    textSize(20);
    //text(crtYrdtxt, 0 ,60);
  }


  if (room8 != null && room8.isActive()) {
    room8.setBlank(false);
    room20.show();
    room8.show();
    room20.setBlank(true); 
    



    room8.displayItemOn();
    textSize(20);
  }






  fill(0);
  compass_img.resize(200, 200);
  //image(compass_img, 270, 800); 

  textFont(font_bold);
  textSize(70);
  if (inRoom != 20) {
    text("ROOM "+ inRoom, 275, 80);
  } else {
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



public void textTimer(String text, int timeSecs, int xLoc, int yLoc) { //lets me set text to go away at a certian time in seconds 
  sw.start();

  if (sw.second() < timeSecs) {
    textFont(font_bold);
    textSize(20);
    text(text, xLoc, yLoc);
  } else {
    sw.stop();
  }
}

void mousePressed() { // for picking things up
  room1.dumpItems();
}
