import java.util.LinkedList;
class Canvas
{
  private int posX, posY;
  private int w, h;
  private LinkedList<Drawable> shapes;
  //private ArrayList<Drawable> tempShapes;
  private PImage savedData;
  int count = 0;
  
  Canvas(){
    shapes = new LinkedList<Drawable>();
    //tempShapes = new ArrayList<Drawable>();
    posX = 51;
    posY = 52;
    w = width - 102;
    h = height - 104;
    savedData = get(51, 52, w, h);
    savedData.save("savedData.jpg");
  }
  
  void add(Drawable shape){
    //println("Canvas added shape");
    shapes.add(shape);
  }
  
  //testing how your canvas implementation works
  void delete(Drawable shape){
    shapes.remove(shape);
  }
  void saveState(){
    savedData = get(51, 52, w, h);
    savedData.save("savedData.jpg");
    shapes.clear();
  }
  void display(){
    fill(255);
    noStroke();
    image(savedData, posX, posY);
    //rect(posX, posY, w, h);
    stroke(1);
    //println("Canvas display");
    for(int i = 0; i < shapes.size() - 1; i++)
    {
      //println(shapes.size());
      shapes.get(i).display();
    }
    if(shapes.size() > 4 || count % 500 == 0){
      this.saveState();
    }
    count ++;
    println(count);
  }
}