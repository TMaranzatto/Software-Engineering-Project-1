class Button
{
  private String name;
  private int posX, posY;
  private PImage icon;
  private int size;
  
  Button(String n, int x, int y, String path)
  {
    name = n;
    posX = x;
    posY = y;
    icon = loadImage(path);
    size = 50;
  }
  
  String getName(){return name;}
  int getX(){return posX;}
  int getY(){return posY;}
  
  void display()
  {
    image(icon, posX, posY, size, size);
  }
}