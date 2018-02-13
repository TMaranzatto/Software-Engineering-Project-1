class Canvas
{
  
  private ArrayList<Drawable> shapes;
  
  Canvas(){
    shapes = new ArrayList<Drawable>();
  }
  
  void add(Drawable shape){
    println("Canvas add shape");
    shapes.add(shape);
  }
  
  void display(){
    println("Canvas display");
    for(int i = 0; i < shapes.size(); i++)
    {
      shapes.get(i).display();
    }
  }
}