 //<>// //<>//

PFont font; //<>//
PFont font_bold;
PImage compass_img;

Room room1;
Room room2; 
Room room3;
Room room4;

RoomItem player1;
RoomItem door1;
RoomItem door2;
RoomItem backpack; 
RoomItem crowbar; 

StopWatch sw = new StopWatch();

int size = 20;

int inRoom = 1; 
int totalClicks = 0;




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
  font = loadFont("SitkaBanner-48.vlw");
  font_bold = loadFont("SitkaHeading-Bold-48.vlw");
  compass_img = loadImage("compass.png");

  //Timer timer = new Timer();

  room1 = new Room(90, 100, 31, 31, 20); //(x, y, rows, cols, cellsize)
  room1.set_active(true);

  room2 =  new Room(90, 100, 31, 31, 20);
  room3 = new Room(90, 100, 31, 31, 20);
  room4 = new Room(90, 100, 31, 31, 20);

  player1 = new RoomItem(2, 5);
  player1.setName("Player 1");
  int[][] player1Data = {{78}};
  player1.setData(player1Data);
  room1.addItem( player1, 0, 0);

  backpack = new RoomItem (10, 10);
  backpack.setName("Backpack");
  int[][] backpackData = {{125}};
  backpack.setData(backpackData);
  room1.addItem(backpack, 10, 10);

  crowbar = new RoomItem(30, 30);
  crowbar.setName("Crowbar");
  int[][]crowbarData = {{80}};
  crowbar.setData(crowbarData);
  room2.addItem(crowbar, 30, 30);


  door1 = new RoomItem(2, 5);
  door1.setName("door1");
  int[][]door1Data ={{0, 0}};
  door1.setData(door1Data);
  room1.addItem(door1, 30, 0);

  door2 = new RoomItem(0, 30);
  int[][]door2Data = {
    {0}, 
    {0}, 
  };
  door2.setData(door2Data);
  room1.addItem(door2, 0, 30);
}




void draw() {
  background(46, 68, 102);
  textFont(font_bold);
  textSize(20);
  text(help, 1650, 900);

  if (inventory.contains(backpack)) {
    textTimer(grabbedPack, 5, 750, 300);
  }

  if (inventory.contains(crowbar)) { 
    textTimer(grabbedCrowbar, 5, 750, 350); //text, time, xloc, yloc
  }

  if (room1 != null && room1.isActive()) {
    room1.show();

    fill(0);

    textFont(font_bold);
    textSize(20);
    text(room1txt, 750, 60);

    if (itemInteract(player1, door2, 'e') && (!door2open)) {
      text(door2locked, 750, 500);
    }

    if (door2open) {
      text(door2isopen, 750, 500);
    }
  }



  if (room2 != null && room2.isActive()) {
    room2.show();
    textFont(font_bold);
    textSize(20);
    text(room2txt, 750, 60);
  }

  if (room3 != null && room3.isActive ()) {
    room3.show();
  }

  if (room4 != null && room4.isActive()) {
    room4.show();
  }

  fill(0);
  compass_img.resize(200, 200);
  //image(compass_img, 270, 800); 

  textFont(font_bold);
  textSize(70);
  text("ROOM "+ inRoom, 275, 80);
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


public boolean itemInteract(RoomItem player, RoomItem item, char keyName) {
  if (key == keyName && player.row() == item.row() && player.col() == item.col()) {
    return true;
  }
  return false;
}

public boolean isAttack(RoomItem player, RoomItem attackedItem, RoomItem neededItem, Room room) {
  if ( (player.row() == attackedItem.row() && player.col() == attackedItem.col())  &&  (inventory.contains(neededItem)) && (itemClicked(attackedItem, room)) ) {
    return true;
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
