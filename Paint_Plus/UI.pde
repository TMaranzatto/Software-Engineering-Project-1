//draws UI that scales to the window size

class UI 
{

  private ArrayList<Button> buttons;
  
  UI()
  {
    buttons = new ArrayList<Button>();
    
    //left toolbar
    int size = 50;
    int barHeight = 401;
    int startX = 0;
    int startY = (height - barHeight) / 2 + 1;
    buttons.add(new Button("Pencil_Tool", startX, startY +  size * 0, "Icons/Pencil_Tool.png",0));
    buttons.add(new Button("Paint_Tool", startX, startY + size * 1, "Icons/Paint_Tool.png",0));
    buttons.add(new Button("Line_Tool", startX, startY + size * 2, "Icons/Line_Tool.png",0));
    buttons.add(new Button("Curve_Tool", startX, startY + size * 3, "Icons/Curve_Tool.png",0));
    buttons.add(new Button("Ellipse_Tool", startX, startY + size * 4, "Icons/Ellipse_Tool.png",0));
    buttons.add(new Button("Rectangle_Tool", startX, startY + size * 5, "Icons/Rect_Tool.png",0));
    buttons.add(new Button("Polygon_Tool", startX, startY + size * 6, "Icons/Polygon_Tool.png",0));
    buttons.add(new Button("Text_Tool", startX, startY + size * 7, "Icons/Text_Tool.png",0));
  
    //right toolbar
    startX = width - (size + 1) + 1;
    buttons.add(new Button("White_Button", startX, startY + size * 0, "none", 1));
    buttons.add(new Button("Black_Button", startX, startY + size * 1, "none", 2));
    buttons.add(new Button("Red_Button", startX, startY + size * 2, "none", 3));
    buttons.add(new Button("Green_Button", startX, startY + size * 3, "none", 4));
    buttons.add(new Button("Blue_Button", startX, startY + size * 4, "none", 5));
    buttons.add(new Button("Yellow_Button", startX, startY + size * 5, "none", 6));
    buttons.add(new Button("Cyan_Button", startX, startY + size * 6, "none", 7));
    buttons.add(new Button("Magenta_Button", startX, startY + size * 7, "none", 8));
    
    //bottom toolbar
    startX = 0;
    startY += barHeight + size;
    buttons.add(new Button("Group_Button", startX +  size * 0, startY, "Icons/Group_Tool.png",0));
    buttons.add(new Button("Ungroup_Button", startX + size * 1, startY, "Icons/Ungroup_Tool.png",0));
    buttons.add(new Button("Bucket_Button", startX + size * 2, startY, "Icons/Bucket_Tool.png",0));
    buttons.add(new Button("Magnifier_Button", startX + size * 3, startY, "Icons/Magnify_Tool.png",0));
}
  
  void display()
  {
    drawPropertiesBar(); //top
    drawNavigationBar();     //bottom
    drawToolBar();       //left
    drawColorBar();      //right
    for(int i = 0; i < buttons.size(); i++)
    {
      buttons.get(i).display();
    }
  }
  
  private void drawToolBar()
  {
    int barWidth = 51;
    int barHeight = 401;
    int startX = -1;
    int startY = (height - barHeight) / 2;
    fill(230);
    rect(startX, startY, barWidth, barHeight);
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