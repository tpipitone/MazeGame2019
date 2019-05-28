String help = 
  "** Controls **\n" 
  + "WASD - Movement\n"
  + "E - Interact (Pick Up / Open)\n"
  + "Q - Change Item\n"
  + "X - Use Item";




String room1txt = 
  "You open your eyes. You are lying on the cold floor of a small dark room. Your head hurts and your memory is blurry.\n"
  +  "To the south and see a dimly lit doorway.\n" 
  +  "To the east you see a closed door. \n"
  +  "Laying next to you is a small backpack\n";

String room2txt = "You enter a  dimly lit room, there is a shiny, large item laying in the far corner.\n"
  + "Maybe some type of tool?";

String room3txt = "A goon leaps out at you! You must escape before it attacks you!";

String room4txt = "  You are in a kitchen now. To your north, you see a door with a sign labeled 'PREP ROOM'.\n" +
  "To the south, there is another door. You can see flickering lights through the cracks and hear faint grunting.";

String room5txt = "You have entered what looks like a prep room, filled with utencils and food";

String room6txt = "You escaped the goon! Now you are in a bathroom";

String room7txt = "You are in a bedroom. The outside door is boarded up.\n"
  + "There is an open window about 5 feet above the ground";

String grabbedPack = "You picked up the backpack. Now you can carry things";

String grabbedCrowbar = "You picked up the crowbar.";

String door2locked = "There is a padlock on this door, you need to break it off somehow";
String door6locked = "This door is locked; you need a key";

String door2isopen = "You broke the lock!";
String door6isopen = "You unlock the door!";

String doorHellaBoardedUp = "This door is boarded up.";
String windowHigh = "This window is too high to climb without help."; 
String currItem = "Current item:";


int[][] player1Data = {{#F7F9FC}};



int a = -1; 
int b = #214365;
int[][] riverData = {
  {b}, 
  {b, b}, 
  {b, b, b}, 
  {b, b, b, b }, 
  {b, b, b, b, b}, 
  {b, b, b, b, b, b}, 
  {b, b, b, b, b, b, b}, 
  {a, b, b, b, b, b, b, b}, 
  {a, a, b, b, b, b, b, b, b}, 
  {a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 
  {a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, b, b, b, b, b, b, b}, 



};


int brn = #8d6815; 
int[][] upTreeData = {
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
};

int[][]downTreeData = {
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
  {brn, brn, brn, brn}, 
};
