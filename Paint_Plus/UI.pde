//draws UI that scales to the window size

class UI 
{

  UI(){}
  
  void display()
  {
    drawPropertiesBar(); //top
    drawNavigationBar();     //bottom
    drawToolBar();       //left
    drawColorBar();      //right
  }
  
  private void drawToolBar()
  {
    int size = 50;
    int barWidth = 51;
    int barHeight = 401;
    int startX = -1;
    int startY = (height - barHeight) / 2;
    fill(230);
    rect(startX, startY, barWidth, barHeight);
    
    //Pencil tool
    Button pencil = new Button("Pencil_Tool", startX + 1, startY + 1, "Icons/Pencil_Tool.png");
    pencil.display();
    
    //Line tool
    Button line = new Button("Line_Tool", startX + 1, startY + 1 + size * 1, "Icons/Line_Tool.png");
    line.display();
    
    //Ellipse tool
    Button ellipse = new Button("Ellipse_Tool", startX + 1, startY + 1 + size * 2, "Icons/Ellipse_Tool.png");
    ellipse.display();
    
    //Rect tool
    Button rect = new Button("Rect_Tool", startX + 1, startY + 1 + size * 3, "Icons/Rect_Tool.jpg");
    rect.display();
    
    //Curve tool
    Button curve = new Button("Curve_Tool", startX + 1, startY + 1 + size * 4, "Icons/Curve_Tool.png");
    curve.display();
    
    //Curve tool
    Button text = new Button("Text_Tool", startX + 1, startY + 1 + size * 5, "Icons/Text_Tool.png");
    text.display();
  }
  
  private void drawColorBar()
  {
    int size = 50;
    int barHeight = 401;
    int barWidth = 52;
    int startX = width - (size + 1);
    int startY = (height - barHeight) / 2;
    
    //color select area
    fill(0);
    rect(startX, startY, barWidth, barHeight);
    
    //color selection
    noStroke();
    //white
    fill(color(255,255,255));
    rect(startX + 1,startY+1, size, size);
    //black
    fill(color(0,0,0));
    rect(startX + 1, startY + size * 1 + 1, size, size);
    //red
    fill(color(255,0,0));
    rect(startX + 1, startY + size * 2 + 1, size,size);
    //green
    fill(color(0,255,0));
    rect(startX + 1, startY + size * 3 + 1, size, size);
    //blue
    fill(color(0,0,255));
    rect(startX + 1, startY + size * 4 + 1, size,size);
    //yellow
    fill(color(255,255,0));
    rect(startX + 1, startY + size * 5 + 1, size, size);
    //cyan
    fill(color(0,255,255));
    rect(startX + 1, startY + size * 6 + 1, size, size);
    //magenta
    fill(color(255,0,255));
    rect(startX + 1, startY + size * 7 + 1, size, size);
  }
  
  private void drawPropertiesBar()
  {
    int barHeight = 52;
    int startX = -1;
    int startY = -1;
    fill(230);
    rect(startX, startY, width + 1, barHeight);
  }
  
  private void drawNavigationBar()
  {
    int barHeight = 52;
    int startX = -1;
    int startY = height - barHeight;
    fill(230);
    rect(startX, startY, width + 1, height - barHeight);
  }
  
}