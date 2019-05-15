boolean door2open = false; 
int inventoryLocation = 0; 

void keyPressed() {
  //println("COL: " + player1.col() + " ROW: " +  player1.row());
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



  if (key == 'q') {
    if (inventoryLocation ==  inventory.size() - 1) { // resets
      inventoryLocation = 0;
    } else {
      inventoryLocation++; // sets inventory location when q pressed
    }
  }




  if (inRoom == 1) {

    if (itemInteract(player1, backpack, 'e')) {
      player1.addInventory(backpack);
      room1.removeItem(backpack);
    }

    if (onItem(door2) && inventory.size() > 0  && inventory.get(inventoryLocation) == crowbar && clicks('x') >= 5 ) {
      door2open = true;
    }




    if (player1.row() >= 30 && player1.col() == 0 && key == 'e') { //adding to room 2

      room2.set_active(true);
      inRoom = 2;
      room1.removeItem(player1);
      room1.set_active(false); 
      room2.addItem(player1, 1, 0);
    } else if (player1.row() >= 0 && player1.col() == 30 && key == 'e') {

      if (door2open) {
        room4.set_active(true);
        inRoom = 4;
        room1.removeItem(player1);
        room1.set_active(false);
        room4.addItem(player1, 0, 1);
      }
    }
  }



  if (inRoom == 2) {
    if (itemInteract(player1, crowbar, 'e')  && inventory.contains(backpack)) {
      player1.addInventory(crowbar);
      room2.removeItem(crowbar);
    }

    if (player1.row() ==0 && player1.col() == 0) { //room 2
      room1.set_active(true);
      inRoom = 1;
      room2.removeItem(player1);
      room2.set_active(false); 
      room1.addItem(player1, 29, 0);
    }
  }



  if (inRoom == 3) {

    if (player1.row() == 0 && player1.col() == 0 && room3.isActive() ) { //room3
      room4.set_active(true);
      inRoom = 4;
      room3.removeItem(player1);
      room3.set_active(false); 
      room4.addItem(player1, 29, 0);
    }
  }

  if (inRoom == 5) {
    if (itemInteract(player1, prep_door2, 'e') ) {
      room4.set_active(true);
      inRoom = 4;
      room5.removeItem(player1);
      room5.set_active(false);
      room4.addItem(player1, 0, 16);
    }
   }



  if (inRoom == 4) {
    if (player1.row() >= 30 && player1.col() == 0 && room4.isActive() ) { //room 4
      room3.set_active(true);
      inRoom = 3;
      room4.removeItem(player1);
      room4.set_active(false);
      room3.addItem(player1, 1, 0);
    } else if (player1.row() == 0 && player1.col() == 0 && room4.isActive() ) {
      room1.set_active(true);
      inRoom = 1;
      room4.removeItem(player1);
      room4.set_active(false);
      room1.addItem(player1, 0, 29);
    }

    if (itemInteract(player1, prep_door, 'e')) {
      room5.set_active(true);
      inRoom = 5;
      room4.removeItem(player1);
      room4.set_active(false);
      room5.addItem(player1, 30, 7);
    }
  }
}
