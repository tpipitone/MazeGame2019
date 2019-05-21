ArrayList<RoomItem> inventory;
public class RoomItem {

  //Where the Room item upper left/right corner lives
  protected int colId, rowId;

  //TODO: This might not be the best way to track
  //but we need to know when we are out of bounds
  protected int maxRow, maxCol;
  
  int health = 100; 
  
  protected int[][] glyphData;

  protected String itemName;

  public RoomItem(int rowAt, int colAt) {
    this.rowId = rowAt;
    this.colId = colAt;
    inventory = new ArrayList<RoomItem>(); // lets each item have its own inventory, mostly useful for player items
  }

  public void setName(String s) {
    itemName = s;
  }

  public void setData(int[][] data) {
    glyphData = data;
  }

  public void newRow(int newId) {
    this.rowId = newId;
  }

  public void newCol(int newId) { //makes it so that when moving to a new room you can set new locations 
    this.colId = newId;
  }

  public int row() { 
    return rowId;
  } // row = x 

  public int col() { 
    return colId;
  } // col = y


  public void addInventory(RoomItem inv_item) {
    inventory.add(inv_item);
  }

  public void removeInventory(RoomItem inv_item) {
    inventory.remove(inv_item);
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



    fill(0);
    smooth();
    textSize(30);
    if (inventory.contains(backpack)) {
      text("PLAYER INVENTORY: " + inventory.toString().replace("[", "").replace("]", ""), 50, 670); // displays the inventory of an item /// removes ugly brackets
      text("CURRENT ITEM: " + inventory.get(inventoryLocation), 50, 730);
    }
  }

  public void setBounds(int rows, int cols) {
    maxRow = rows;
    maxCol = cols;
  }

  public void updateCol(int by) {
    if (colId + by <= maxCol - glyphData[0].length && colId + by >= 0)
      colId += by;
  }


  public void updateRow(int by) {
    if (rowId + by <= maxRow - glyphData.length  && rowId + by >= 0)
      rowId += by;
  }

  public Cell[] getVanguard( char direction ) {
    ArrayList<Cell> result = new ArrayList<Cell>();

    //deal with the up direction
    if (direction == 'u') {
      for (int i = 0; i < glyphData[0].length; i++) {
        if ( glyphData[0][i] > -1 ) {
          int colVal = i + colId;
          int rowVal = rowId - 1;
          Cell c = new Cell(rowVal, colVal);
          result.add(c);
        }
      }
    }

    return result.toArray(new Cell[0]);
  }

  public String toString() {
    return itemName; 
    // return itemName + " row = " + rowId + " col = " + colId; // ***USE THIS TO LOCATE FIND ITEM LOCATIONS ***
  }
}
