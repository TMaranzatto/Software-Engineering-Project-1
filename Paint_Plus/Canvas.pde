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
    println("Canvas add shape");
    shapes.add(shape);
  }
  
  void display(){
    fill(255);
    noStroke();
    rect(posX, posY, w, h);
    stroke(1);
    println("Canvas display");
    for(int i = 0; i < shapes.size() - 1; i++)
    {
      shapes.get(i).display();
    }
  }
}