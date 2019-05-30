public class Door extends RoomItem {

  boolean vert; 

  public Door(int rowAt, int colAt, boolean vert) {
    super(rowAt, colAt);
    this.vert = vert;
  }

  public void show(int xAt, int yAt, int cellSize) {    

    if (vert) {
      
      for (int row = 0; row < glyphData.length; row++) {
        for (int col = 0; col < glyphData[row].length; col++) {
          int fillColor = glyphData[0][0];
          fill(fillColor);
          int x = xAt + col*cellSize;
          int y = yAt + row*cellSize;
          rect(x + (cellSize / 2.5), y, cellSize / 3, cellSize);
        }
      }
      
      
    } else {
      for (int row = 0; row < glyphData.length; row++) {
        for (int col = 0; col < glyphData[row].length; col++) {
          int fillColor = glyphData[0][0];
          fill(fillColor);
          int x = xAt + col*cellSize;
          int y = yAt + row*cellSize;
          rect(x, y + (cellSize / 2.5), cellSize , cellSize / 3);
        }
      }
    }
  }
}
