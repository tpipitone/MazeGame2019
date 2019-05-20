public class Enemy extends RoomItem {

  RoomItem player1;

  public Enemy(int rowAt, int colAt, RoomItem player1) {
    super(rowAt, colAt);
    this.player1 = player1;
  }

  public void show(int xAt, int yAt, int cellSize) {    
    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
        int fillColor = glyphData[row][col];
        if (fillColor != -1) {
          fill(fillColor);
          int x = xAt + col*cellSize;
          int y = yAt + row*cellSize;
          rect(x, y, cellSize, cellSize);
        }
      }
    }
  }
}
