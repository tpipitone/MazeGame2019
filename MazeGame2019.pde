PFont font; //<>//
PFont font_bold;
PImage compass_img;

Room room1; //<>// //<>// //<>//
Room room2; 
Room room3;
Room room4;

RoomItem player1;
RoomItem door;


int size = 20;

int inRoom = 1; 

/*
int[][] door = {
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


  door = new RoomItem(2, 5);
  door.setName("The door");
  int[][]doorData ={{0, 0}};
  door.setData(doorData);
  room1.addItem(door, 30, 0);

  room2 =  new Room(90, 100, 31, 31, 20);
  room3 = new Room(90, 100, 31, 31, 20);
  room4 = new Room(90, 100, 31, 31, 20);
}

void draw() {
  background(46, 68, 102);

  if (room1 != null && room1.isActive()) {
    room1.show();

    fill(0);
    
    textFont(font_bold);
    textSize(20);
    text(room1txt ,750, 60);
    
    
    
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
  compass_img.resize(200,200);
  image(compass_img, 270, 800); 
  
  textFont(font_bold);
  textSize(70);
  text("ROOM "+ inRoom ,275, 80);
}


void mousePressed() {
  room1.dumpItems();
}

void keyPressed() {
  println("COL: " + player1.col() + " ROW: " +  player1.row());

  if (key == CODED) {
    if (keyCode == UP) {
      player1.updateRow(-1);
    } else if (keyCode == DOWN) {
      player1.updateRow(1);
    } else if (keyCode == LEFT) {
      player1.updateCol(-1);
    } else if (keyCode == RIGHT) {
      player1.updateCol(1);
    }
  }

  if (player1.row() >= 30 && player1.col() == 0 && room1.isActive()) { // in room 1, adding to room 2

    room2.set_active(true);
    inRoom = 2;
    room1.removeItem(player1);
    room1.set_active(false); 
    room2.addItem(player1, 1, 0);
    
  } else if (player1.row() == 0 && player1.col() >= 30 && room1.isActive()) { 
    room4.set_active(true);
    inRoom = 4;
    room1.removeItem(player1);
    room1.set_active(false);
    room4.addItem(player1, 0, 1);
  }

  if (player1.row() ==0 && player1.col() == 0 && room2.isActive()) { //room 2
    room1.set_active(true);
    inRoom = 1;
    room2.removeItem(player1);
    room2.set_active(false); 
    room1.addItem(player1, 29, 0);
  }

  if (player1.row() == 0 && player1.col() == 0 && room3.isActive()) { //room3
    room4.set_active(true);
    inRoom = 4;
    room3.removeItem(player1);
    room3.set_active(false); 
    room4.addItem(player1, 29, 0);
  }



  if (player1.row() >= 30 && player1.col() == 0 && room4.isActive()) { //room 4
    room3.set_active(true);
    inRoom = 3;
    room4.removeItem(player1);
    room4.set_active(false);
    room3.addItem(player1, 1, 0);
  } else if (player1.row() == 0 && player1.col() == 0 && room4.isActive()) {
    room1.set_active(true);
    inRoom = 1;
    room4.removeItem(player1);
    room4.set_active(false);
    room1.addItem(player1, 0, 29);
  }
}
