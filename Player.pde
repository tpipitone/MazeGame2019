public class Player extends RoomItem {

  public Player(int rowAt, int colAt) {
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
          image(chicken, x  - 10, y - 10, cellSize, cellSize);
        }
      }
    }
  }

  public RoomItem isOnItem() {
    RoomItem onThis = null; 
    for (RoomItem item : inventory) {
      if (onItem(item)) {
        System.out.print("SCWOOP");
        onThis = item;
      }
      
    }
    return onThis; 
  }
  
  
  
}
