import java.util.LinkedList;

public class Canvas
{
  private int posX, posY;
  private int w, h;
  private ArrayList<Drawable>  shapes;
  private PImage canvasCache;
  
  Canvas(){
    shapes = new ArrayList<Drawable>(100); //Array list with initial capacity
    posX = 51;
    posY = 52;
    w = width - 102;
    h = height - 102;
    cacheState();
  }
  
  public void add(Drawable shape){
    shapes.add(shape);
    cacheState();
  }
  
  public void delete(Drawable shape){
    shapes.remove(shape);
    rawDisplay();
    cacheState();
  }
  
  private void cacheState(){
    canvasCache = get(posX, posY, w, h);
  }
  
  public void cacheDisplay(){
    image(canvasCache, posX, posY);
  }
  
  public void rawDisplay(){
    fill(255);
    noStroke();
    rect(posX, posY, w, h);
    stroke(1);
    for(int i = 0; i < shapes.size() - 1; i++)
    {
      shapes.get(i).display();
    }
  }
}