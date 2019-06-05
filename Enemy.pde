public class Enemy extends RoomItem {

  public int enemyHealth = 100; 

  private int xyScale; 
  private PVector villian = new PVector(500, 500, 0);
  private float villianSpeed;
  private Player player1;
  private int enemySize;


  public Enemy(int rowAt, int colAt, Player player1, int enemySize, float enemySpeed) {
    super(rowAt, colAt);
    this.player1 = player1;
    this.enemySize = enemySize;
    villianSpeed = enemySpeed; 
    villian.x = rowAt * 20;
    villian.y = colAt * 20;
    
    if (enemySize > 5) { //makes it so that farmer fork hits player1 for damage
      xyScale = 50;
    } else {
      xyScale = 20;
    }
    
  }
  



  public void show(int xAt, int yAt, int cellSize) {   

    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
        image(farmer, villian.x - xyScale, villian.y - xyScale, cellSize * enemySize, cellSize * enemySize);
        float angle = atan2( ( player1.row() * cellSize ) - villian.y, ( player1.col() * cellSize ) - villian.x); // gets the item to follow player1
        float newX = cos(angle) * villianSpeed + villian.x;
        float newY = sin(angle) * villianSpeed + villian.y;
        villian.set(newX, newY, 0);
      }
    }
  }


  public int getcol() {
    return (int)villian.x / 20 ;
  }

  public int getrow() {
    return (int)villian.y / 20;
  }

  public int getHealth() {
    return enemyHealth;
  }
}
