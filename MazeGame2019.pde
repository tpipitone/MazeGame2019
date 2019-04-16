Room room1;
Room room2; 
Room room3;
Room room4;

RoomItem player1;

Sticky guy; 
int size = 20;

/*
boolean room1_active = true;
boolean room2_active = false;
boolean room3_active = false; 
boolean room4_active = false;
boolean room5_active = false;
boolean room6_active = false;
*/


/*int[][] layer = {
 {0  , 255, 125,9,10,15,24,45,150},
 {100, 100, 100,9},
 {0  ,  0,  0},
 {#8F2CB7}
 };
 */


void setup() {
  size(800, 800);
  //size of  cells 
  room1 = new Room1(20, 20, height / size - 25, width / size - 25, size);
  
  room1.set_active(true);
  
  guy = new Sticky(5, 5);
  player1 = new RoomItem(2, 5);
  /*int[][] player1Data = {{ 0,0,  0,  },
   {0   ,  244,    0},
   {0,  0,  0}};
   */
  int[][] player1Data = {{(66)}};
  player1.setData(player1Data);
  room1.addItem( player1, 0, 0);
  // room1.addLayer( layer );
  //room1.addItem(guy);

  room2 =  new Room(20, 350, height / size - 25, width / size - 25, size);
  room3 = new Room(350, 350, height / size - 25, width / size - 25, size);
  room4 = new Room(350, 20, height / size - 25, width / size - 25, size);
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


  if (player1.row() >= 14 && player1.col() == 0 && room1.isActive()) { // in room 1
    room2.set_active(true);
    room1.removeItem(player1);
    room1.set_active(false); 
    room2.addItem(player1, 0, 0);
  } else if (player1.row() == 0 && player1.col() >= 14 && room1.isActive()) { 
    room4.set_active(true);
    room1.removeItem(player1);
    room1.set_active(false);
    room4.addItem(player1, 0, 0);
  }
  
  if (player1.row() >= 14 && player1.col() == 0 && room4.isActive()) { //room 4
    room3.set_active(true);
    room4.removeItem(player1);
    room4.set_active(false);
    room3.addItem(player1,0,0);
  }
  
  
  
}
