public class ClipArt extends RoomItem {
  PImage image; 
  float scaleSize; 
  public ClipArt(int rowAt, int colAt, PImage img, float scaleSize) {
    super(rowAt, colAt);
    image = img;
    this.scaleSize = scaleSize;
  }
  

  public void show(int xAt, int yAt, int cellSize) {    
    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
          int x = xAt + col*cellSize;
          int y = yAt + row*cellSize;
          image(image, x  - 10, y - 10, cellSize * scaleSize + 4 * (sin(frameCount / 6)), cellSize * scaleSize +  4 * (sin(frameCount / 6)));
      }
    }
  }
}
