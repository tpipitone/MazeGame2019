
public class Room {
  
  
  int xLoc;
  int yLoc;
  boolean active;

  int x_pos, y_pos;  
  int cellSize;
  int rows, cols;
  int[][] layer;
  ArrayList<RoomItem> items;

  public Room(int x, int y, int numRows, int numCols, int cellSize ) {
    x_pos = x;
    y_pos = y;
    this.cellSize = cellSize;
    rows = numRows;
    cols = numCols;
    layer = null;
    items = new ArrayList<RoomItem>();
  }

  public void addItem(RoomItem item, int newRow, int newCol) {
    item.newCol(newCol);
    item.newRow(newRow);
    items.add(item); 
    item.setBounds(rows, cols);
  }

  public void set_active(boolean is_active){
    active = is_active;
  }
  
  public boolean isActive(){
    return active;
  }

  public void removeItem(RoomItem item) {
    items.remove(item);
  }

  public void show() {
    pushMatrix();
    translate(x_pos, y_pos);
    for (int j=0; j< rows; j++) {
      for (int i=0; i < cols; i++) {
        int xAt = i*cellSize;
        int yAt = j*cellSize;

        //todo: think about what color we want
        //fill( ? )
        //stroke( ? ) //border color
        //strokeWeight( ? ) // thickness of cell border
        fill(255);
        rect(xAt, yAt, cellSize, cellSize);
        drawLayerCell(j, i, xAt, yAt);
      }
    }


    //Draw each item on the Room

    for (RoomItem item : items) {
      item.show(xLoc, yLoc, cellSize);    
      xLoc = item.col() * cellSize;
      yLoc = item.row()* cellSize;
    }    


    popMatrix();
  }  

  protected void drawLayerCell(int rowId, int colId, int xPos, int yPos) {
    if (layer != null) {
      if (layer.length > rowId) {
        if (layer[rowId].length > colId) {
          int cellColor = layer[rowId][colId];
          fill(cellColor);
          rect(xPos, yPos, cellSize, cellSize);
        }
      }
    }
  }


  public Cell getCell(int xClicked, int yClicked) {
    xClicked = xClicked - x_pos;
    yClicked = yClicked - y_pos;

    int xAt = xClicked/cellSize;
    int yAt = yClicked/cellSize;

    return new Cell(yAt, xAt);
  }

  public void addLayer(int[][] theLayer) {
    this.layer = theLayer;
  }
}
