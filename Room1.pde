public class Room1 extends Room {
  int x_pos, y_pos;  
  int cellSize;
  int rows, cols;
  int[][] layer;
  ArrayList<RoomItem> items;

  public Room1(int x, int y, int numRows, int numCols, int cellSize ) {
    super(x,y, numRows,numCols, cellSize);
    items = new ArrayList<RoomItem>();
  }
  
  void keyPressed() {
    println("COL: " + player1.col() + " ROW: " +  player1.row());
  }
  
  
}
