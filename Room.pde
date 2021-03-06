//<>// //<>// //<>//

public class Room {


  //int xLoc;
  //int yLoc;
  boolean active;

  int x_pos, y_pos;  
  int cellSize;
  int hexColor; 
  int rows, cols;
  int[][] layer;
  ArrayList<RoomItem> items;
  

  public Room(int x, int y, int numRows, int numCols, int cellSize, int hexColor ) {
    x_pos = x;
    y_pos = y;
    this.cellSize = cellSize;
    rows = numRows;
    cols = numCols;
    layer = null;
    items = new ArrayList<RoomItem>();
    this.hexColor = hexColor;
    
    
  }
  
  public void addItem(RoomItem item, int newRow, int newCol) {
    item.newCol(newCol); // sets new col, new row location
    item.newRow(newRow);
    items.add(item); 
    item.setBounds(rows, cols);
  }
  
  public void displayItemOn() {                                     ///prints which item im on
  //System.out.println("ROOM ITEM SIZE: " + items.size());
  if (items.size() > 0) {
    for (int i = 0; i < items.size(); i++) {
      if ( (  onItem(items.get(i) ) && items.get(i) != player1 )){
        textFont(font_bold);
        textSize(20);
        text(items.get(i) + " (e to interact)" , 750, 200);
      }
    }
  }
}
  

  public void set_active(boolean is_active) {
    active = is_active;
  }

  public boolean isActive() {
    return active;
  }

  public void removeItem(RoomItem item) {
    items.remove(item);
  }

  public void show() {
    pushMatrix();
    translate(x_pos, y_pos);
    rect(100,50,50, 100); 
 
    
    for (int j=0; j< rows; j++) {
      for (int i=0; i < cols; i++) {
        int xAt = i*cellSize;
        int yAt = j*cellSize;
        fill(hexColor);
        rect(xAt, yAt, cellSize, cellSize);
        drawLayerCell(j, i, xAt, yAt);
      }

    }


    //Draw each item on the Room

    for (RoomItem item : items) {
      int xLoc = item.col() * cellSize;
      int yLoc = item.row()* cellSize;
      item.show(xLoc, yLoc, cellSize);
    }    


    popMatrix();
  }  

  void dumpItems() {
    for (RoomItem item : items)  
      println(item);
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
    System.out.println(xAt + " "  + yAt);
    return new Cell(yAt, xAt);
  }

  public int getCellX(int xClicked) {
    xClicked = xClicked - x_pos;
    return xClicked / cellSize;
  }

  public int getCellY(int yClicked) {
    yClicked = yClicked - y_pos;
    return yClicked / cellSize;
  }
  
  





  public void addLayer(int[][] theLayer) {
    this.layer = theLayer;
  }
}
