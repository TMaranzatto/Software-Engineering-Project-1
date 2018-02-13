class Canvas
{
  private int posX, posY;
  private int w, h;
  private ArrayList<Drawable> shapes;
  
  Canvas(){
    shapes = new ArrayList<Drawable>();
    posX = 51;
    posY = 52;
    w = width - 102;
    h = height - 104;
  }
  
  void add(Drawable shape){
    //println("Canvas added shape");
    shapes.add(shape);
  }
  
  //testing how your canvas implementation works
  void delete(Drawable shape){
    shapes.remove(shape);
  }
  
  void display(){
    fill(255);
    noStroke();
    rect(posX, posY, w, h);
    stroke(1);
    //println("Canvas display");
    for(int i = 0; i < shapes.size() - 1; i++)
    {
      //println(shapes.size());
      shapes.get(i).display();
    }
  }
}