public class VillagerChicken extends RoomItem {
   float tx = 0;
   float ty = 10000;
   float ychickenDisperse = random(5); 
   float xchickenDisperse = random(5);
   
  public VillagerChicken(int rowAt, int colAt) {
    super(rowAt, colAt);
  }

  

  public void show(int xAt, int yAt, int cellSize) {    
    
          float n = noise(tx);
          float z = noise(ty);
          float x = map(n, 0, 1, 0, width - 100);       //found in Nature of Code I.6 Perlin Noise 
          float y = map(z, 0, 1, 0, height - 100 ); //(map(value,start1, stop1,start2, stop2); re-maps number from one range to another
          image(chicken, x * xchickenDisperse,y *  ychickenDisperse ,16,16); 
          tx += 0.01; 
          ty += 0.01;
  }
}
