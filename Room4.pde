public class Room4 extends Room {
  int x_pos, y_pos;  
  int cellSize;
  int rows, cols;
  int[][] layer;
  ArrayList<RoomItem> items;

  public Room4(int x, int y, int numRows, int numCols, int cellSize ) {
    super(x,y, numRows,numCols, cellSize);
    items = new ArrayList<RoomItem>();
  }
  
  
}
