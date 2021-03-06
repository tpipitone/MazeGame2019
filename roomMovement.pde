boolean door2open = false; 
boolean door6open = false; 
boolean window7open = false; 
boolean treeDown = false;
boolean door11to12Open = false; 
int inventoryLocation = 0; 


void keyReleased() {
  if (key == 'p') {
    pPressed = false;
  }
}


void keyPressed() {
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
  } else if (key == 'p') {
    pPressed = true;
  }

  if (key == 'q') {                                                ///switches inventory
    if (inventoryLocation ==  inventory.size() - 1) { // resets
      inventoryLocation = 0;
    } else {
      inventoryLocation++; // sets inventory location when q pressed
    }
  }

  if (inRoom == 1) {

    if (key == 'r') {
      room1.addItem(chEgg, player1.row(), player1.col());
    }


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

    if (player1.row() == 0 && player1.col() == 0 && room3.isActive() && key == 'e') { //room3
      room4.set_active(true);
      inRoom = 4;
      room3.removeItem(player1);
      room3.set_active(false); 
      room4.addItem(player1, 29, 0);
    }

    if (itemInteract(player1, door3to6, 'e') && door6open) {
      room6.set_active(true);
      inRoom = 6;
      room3.removeItem(player1);
      room3.set_active(false);
      room6.addItem(player1, 0, 0);
    }

    if (itemInteract(player1, rm5Key, 'e')) {
      player1.addInventory(rm5Key);
      room3.removeItem(rm5Key);
    }

    if (onItem(door3to6)  && inventory.get(inventoryLocation) == rm5Key && clicks('x') >= 1 ) {
      door6open = true;
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

    if (itemInteract(player1, fork, 'e')) {
      player1.addInventory(fork);
      room5.removeItem(fork);
    }

    if (itemInteract(player1, knife, 'e') ) {
      player1.addInventory(knife);
      room5.removeItem(knife);
    }

    if (itemInteract(player1, mallet, 'e') ) {
      player1.addInventory(mallet);
      room5.removeItem(mallet);
    }

    if (itemInteract(player1, spoon, 'e') ) {
      player1.addInventory(spoon);
      room5.removeItem(spoon);
    }
  }



  if (inRoom == 4) {

    if (player1.row() >= 30 && player1.col() == 0 && room4.isActive() && key == 'e') { //room 4
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


  if (inRoom == 6 ) {

    if (itemInteract(player1, door6to7, 'e')) {
      room7.set_active(true);
      inRoom = 7;
      room6.removeItem(player1);
      room6.set_active(false);
      room7.addItem(player1, 15, 0);
    }


    if (player1.health <= 70) {
      if (itemInteract(player1, feed1, 'e')) {
        player1.health+=30;
        room6.removeItem(feed1);
      } else if (itemInteract(player1, feed2, 'e')) {
        player1.health+=30;
        room6.removeItem(feed2);
      }
    }
  }

  if (inRoom == 7) {

    if (room7chair.row() == 5 && room7chair.col() == 29) {
      window7open = true;
    }

    if (window7open && itemInteract(player1, window7tocourt, 'e') ) {
      room20.set_active(true);
      inRoom = 20;
      room7.removeItem(player1);
      room7.set_active(false);
      room20.addItem(player1, 5, 0);
    }
  }

  if (inRoom == 8) {

    if (itemInteract(player1, doorShedto20, 'e')) {
      room20.set_active(true);
      inRoom = 20;
      room8.removeItem(player1);
      room8.set_active(false);
      room20.addItem(player1, 0, 79);
    }

    if (itemInteract(player1, gasCan, 'e')) {
      player1.addInventory(gasCan);
      room8.removeItem(gasCan);
    } else if (itemInteract(player1, flashlight, 'e')) {
      player1.addInventory(flashlight);
      room8.removeItem(flashlight);
    } else if (itemInteract(player1, chainsaw, 'e')) {
      player1.addInventory(chainsaw);
      room8.removeItem(chainsaw);
    }
  }


  if (inRoom == 20) {

    if (itemInteract(player1, door20toShed, 'e')) {
      room8.set_active(true);
      inRoom = 8;
      room20.removeItem(player1);
      room20.set_active(false);
      room8.addItem(player1, 0, 0);
    }

    if ((onItem(upTree) && inventory.size() > 0  && inventory.get(inventoryLocation) == chainsaw && clicks('x') >= 6 )) {
      room20.removeItem(player1); 
      room20.addItem(downTree, 15, 11);
      room20.removeItem(upTree);
      room20.addItem(player1, 15, 11);
    }

    if (itemInteract(player1, doorCourtto9, 'e')) {
      room9.set_active(true);
      inRoom = 9;
      room20.removeItem(player1);
      room20.set_active(false);
      room9.addItem(player1, 0, 0);
    }
  }

  if (inRoom == 9) {

    if (itemInteract(player1, door9to10, 'e')) {
      room10.set_active(true);
      inRoom = 10;
      room9.removeItem(player1);
      room9.set_active(false);
      room10.addItem(player1, 0, 0);
    }
  }

  if (inRoom == 10) {
    if (itemInteract(player1, door10to11, 'e')) {
      room11.set_active(true);
      inRoom = 11;
      room10.removeItem(player1);
      room10.set_active(false);
      room11.addItem(player1, 0, 0);
    }
  }

  if (inRoom == 11) {

    if (itemInteract(player1, door11to12, 'e') && door11to12Open) {
      room12.set_active(true);
      inRoom = 12;
      room11.removeItem(player1);
      room11.set_active(false);
      room12.addItem(player1, 20, 0);
    } 

    if (itemInteract(player1, feed3, 'e')) {
      player1.health = 100;
    }

    if (onEnemy(finalGoon1) && key == 'x' && (inventory.get(inventoryLocation) == crowbar || inventory.get(inventoryLocation) == chainsaw)) {   // if touching enemy lower health
      finalGoon1.enemyHealth-=20;
      if (finalGoon1.enemyHealth == 0) {
        room11.removeItem(finalGoon1);
      }
    } else if (onEnemy(finalGoon2) && key == 'x' && (inventory.get(inventoryLocation) == crowbar || inventory.get(inventoryLocation) == chainsaw)) {
      finalGoon2.enemyHealth-=20;
      if (finalGoon2.enemyHealth == 0) {
        room11.removeItem(finalGoon2);
      }
    }
  }
}
