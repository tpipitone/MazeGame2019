public class RoomItem{

  //Where the Room item upper left/right corner lives
  protected int colId, rowId;

  //TODO: This might not be the best way to track
  //but we need to know when we are out of bounds
  protected int maxRow, maxCol;

  protected int[][] glyphData;

  public RoomItem(int rowAt, int colAt){
     this.rowId = rowAt;
     this.colId = colAt;
  }

  public void setData(int[][] data){
     glyphData = data; 
  }

  public int row(){ return rowId; }

  public int col(){ return colId; }

  public void show(int xAt, int yAt, int cellSize){    
    for(int row = 0; row < glyphData.length; row++){
       for(int col = 0; col < glyphData[row].length; col++){
          int fillColor = glyphData[row][col];
          if(fillColor > -1){
            fill(fillColor);
            int x = xAt + col*cellSize;
            int y = yAt + row*cellSize;
            rect(x,y,cellSize,cellSize);
          }
       }
    }
  }

  public void setBounds(int rows, int cols){
    maxRow = rows;
    maxCol = cols;
  }

  public void updateCol(int by){
    if(colId + by <= maxCol - glyphData[0].length && colId + by >= 0)
       colId += by; 
  }

  public void updateRow(int by){
     if(rowId + by <= maxRow - glyphData.length  && rowId + by >= 0)
       rowId += by;
  }

  public Cell[] getVanguard( char direction ){
    ArrayList<Cell> result = new ArrayList<Cell>();

    //deal with the up direction
    if(direction == 'u'){
      for(int i = 0; i < glyphData[0].length; i++){
         if( glyphData[0][i] > -1 ){
           int colVal = i + colId;
           int rowVal = rowId - 1;
           Cell c = new Cell(rowVal, colVal);
           result.add(c);
         }
      }
    }

    return result.toArray(new Cell[0]);
  }
  /*
  
  public int getX(){
    return rowId;
  }
  public int getY(){
    return colId;
  }
  */

}
