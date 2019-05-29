public class Door extends RoomItem {

  public Door(int rowAt, int colAt) {
    super(rowAt, colAt);
  }

  public void show(int xAt, int yAt, int cellSize) {    
    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
        int fillColor = glyphData[row][col];
        if (fillColor != -1) {
          fill(fillColor);
          int x = xAt + col*cellSize;
          int y = yAt + row*cellSize;
          rect(x + (cellSize / 2), y, cellSize / 2, cellSize);
        }
      }
    }
  }
}
