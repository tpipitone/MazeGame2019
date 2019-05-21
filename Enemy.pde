public class Enemy extends RoomItem {

  //PVector villian;
  PVector villian = new PVector(500, 500, 0);
  float villianSpeed = 2;
  RoomItem player1;

  public Enemy(int rowAt, int colAt, RoomItem player1) {
    super(rowAt, colAt);
    this.player1 = player1;
  }



  public void show(int xAt, int yAt, int cellSize) {   
    //villian = new PVector(xAt, yAt, 0);
    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
        int fillColor = glyphData[row][col];
        if (fillColor != -1) {
          fill(fillColor);
          rect(villian.x, villian.y, cellSize, cellSize  );

          float angle = atan2( ( player1.row() * cellSize ) - villian.y, ( player1.col() * cellSize ) - villian.x); // gets the item to follow player1
          float newX = cos(angle) * villianSpeed + villian.x;
          float newY = sin(angle) * villianSpeed + villian.y;
          villian.set(newX, newY, 0);
        }
      }
    }
  }


  public int getcol() {
    return (int)villian.x / 20 ;
  }

  public int getrow() {
    return (int)villian.y / 20;
  }
  
  
  
}
