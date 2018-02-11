class Button
{
  private String name;
  private int posX, posY;
  private PImage icon;
  private int size;
  private color col;
  private boolean isColor;
  
  Button(String n, int x, int y, String path, int c)
  {
    name = n;
    posX = x;
    posY = y;
    size = 50;
    if(c == 0){ icon = loadImage(path); isColor = false;}
    else if(c >= 1 && c <= 8)
    {
      isColor = true;
      switch(c){
      case 1:
        col = color(255,255,255);
        break;
      case 2:
        col = color(0,0,0);
        break;
      case 3:
        col = color(255,0,0);
        break;
      case 4:
        col = color(0,255,0);
        break;
      case 5:
        col = color(0,0,255);
        break;
      case 6:
        col = color(255,255,0);
        break;
      case 7:
        col = color(0,255,255);
        break;
      case 8:
        col = color(255,0,255);
        break;
      }
    }
  }
  
  String getName(){return name;}
  int getX(){return posX;}
  int getY(){return posY;}
  
  void display()
  {
    if(isColor == false){
      image(icon, posX, posY, size, size);
    }
    else{
      fill(col);
      noStroke();
      rect(posX, posY, size, size);
      stroke(1);
    }
    
  }
}