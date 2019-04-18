Room room1;
Room room2; 
Room room3;
Room room4;

RoomItem player1;
RoomItem door;
Sticky guy; 
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
  size(800, 800);
  //size of  cells 
  room1 = new Room1(90, 20, 31, 31, 20); //(x, y, rows, cols, cellsize)

  room1.set_active(true);

  guy = new Sticky(5, 5);
  player1 = new RoomItem(2, 5);
  door = new RoomItem(2, 5);
  /*int[][] player1Data = {{ 0,0,  0,  },
   {0   ,  244,    0},
   {0,  0,  0}};
   */
   
   
  //int[][]doorData ={{0,0}};
  //door.setData(doorData);
  //room1.addItem(door,0,20);
  
  int[][] player1Data = {{78}};
  player1.setData(player1Data);
  
  
  room1.addItem( player1, 0, 0);
  
  
  
  
  
   //room1.addLayer( doorData );
  //room1.addItem(guy);

  room2 =  new Room(90, 20, 31, 31, 20);
  room3 = new Room(90, 20, 31, 31, 20);
  room4 = new Room(90, 20, 31, 31, 20);
}

void draw() {
  background(0);

  if (room1 != null && room1.isActive()) {
    room1.show();
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
  
  
  textSize(35);
  text("ROOM "+ inRoom, 335, 725);
}


void mousePressed() {
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

  if (player1.row() >= 30 && player1.col() == 0 && room1.isActive()) { // in room 1

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
