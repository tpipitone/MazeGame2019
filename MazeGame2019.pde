PFont font; //<>// //<>//
PFont font_bold;
PImage compass_img;

Room room1; //<>// //<>//
Room room2; 
Room room3;
Room room4;

RoomItem player1;
RoomItem door1;
RoomItem door2;
RoomItem backpack; 

int size = 20;

int inRoom = 1; 

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

  room1 = new Room(90, 100, 31, 31, 20); //(x, y, rows, cols, cellsize)
  room1.set_active(true);

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




  room2 =  new Room(90, 100, 31, 31, 20);
  room3 = new Room(90, 100, 31, 31, 20);
  room4 = new Room(90, 100, 31, 31, 20);
}




void draw() {
  background(46, 68, 102);
  textFont(font_bold);
  textSize(20);
  text(help, 1650,900);
  
  if (room1 != null && room1.isActive()) {
    room1.show();

    fill(0);

    textFont(font_bold);
    textSize(20);
    text(room1txt, 750, 60);

    if (inventory.contains(backpack)) {
      text(grabbedPack, 750, 300);
    }
    
    if(itemInteract(player1, door2)){
      text(door2locked, 750, 500);
    
    }
    
    
  }

  if (room2 != null && room2.isActive()) {
    room2.show();
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

//public boolean itemClicked(RoomItem item, Room room) {

//  if (room.getCellX(mouseX) == item.col() && room.getCellY(mouseY) == item.row()) { // ***use this for breaking doors and whatnot *****
//    System.out.println("HERE");
//    return true;
//  }
//  return false;
//}


public boolean itemInteract(RoomItem player, RoomItem item) {
  if (key == 'e' && player.row() == item.row() && player.col() == item.col()) {
    return true;
  }
  return false;
}




void mousePressed() { // for picking things up
  room1.dumpItems();
}
