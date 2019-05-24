public class BlankRoom extends Room {

  boolean blankRoom = false;
  int emptyColor;
  public BlankRoom(int x, int y, int numRows, int numCols, int cellSize, int hexColor, boolean blankRoom, int emptyColor) {
    super(x, y, numRows, numCols, cellSize, hexColor);
    this.blankRoom = blankRoom;
    this.emptyColor = emptyColor; 
  }

  public void show() {
    pushMatrix();
    translate(x_pos, y_pos);

    for (int j=0; j< rows; j++) {
      for (int i=0; i < cols; i++) {
        int xAt = i*cellSize;
        int yAt = j*cellSize;
        if (blankRoom) {
          fill(emptyColor);
        } else { 
          fill(hexColor);
        }
        rect(xAt, yAt, cellSize, cellSize);
        drawLayerCell(j, i, xAt, yAt);
      }
    }

    if (!blankRoom) {
      for (RoomItem item : items) {
        int xLoc = item.col() * cellSize;
        int yLoc = item.row()* cellSize;
        item.show(xLoc, yLoc, cellSize);
      }
    }

    popMatrix();
  }
  
  void setBlank(boolean isBlank){
    blankRoom = isBlank; 
  }
  
  
  
  
  
  
}
