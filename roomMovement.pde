boolean room2open = false; 


void keyPressed() {
  println("COL: " + player1.col() + " ROW: " +  player1.row());
  textFont(font_bold);
  textSize(20);

  if (key== 'w') {
    player1.updateRow(-1);
  } else if (key == 's') {
    player1.updateRow(1);
  } else if (key == 'a' ) {
    player1.updateCol(-1);
  } else if (key == 'd') {
    player1.updateCol(1);
  }


  if (inRoom == 1) {

    if (itemInteract(player1, backpack)) {
      player1.addInventory(backpack);
      room1.removeItem(backpack);
    }
  }



  if (player1.row() >= 30 && player1.col() == 0 && room1.isActive()) { // in room 1, adding to room 2

    room2.set_active(true);
    inRoom = 2;
    room1.removeItem(player1);
    room1.set_active(false); 
    room2.addItem(player1, 1, 0);
  } else if (player1.row() == 0 && player1.col() >= 30 && room1.isActive()) {
    if (room2open) {
      room4.set_active(true);
      inRoom = 4;
      room1.removeItem(player1);
      room1.set_active(false);
      room4.addItem(player1, 0, 1);
    }
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
