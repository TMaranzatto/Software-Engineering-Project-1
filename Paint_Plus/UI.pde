//draws UI that scales to the window size

class UI
{

  private ArrayList<Button> buttons;
  private Button color_window;

  UI()
  {
    buttons = new ArrayList<Button>();

    //left toolbar
    int size = 50;
    int barHeight = 401;
    int startX = 0;
    int startY = (height - barHeight) / 2 + 1;
    buttons.add(new Button(Name.PENCIL_TOOL, startX, startY +  size * 0, "data/Pencil_Tool.png",0));
    buttons.add(new Button(Name.PAINT_TOOL, startX, startY + size * 1, "data/Paint_Tool.png",0));
    buttons.add(new Button(Name.LINE_TOOL, startX, startY + size * 2, "data/Line_Tool.png",0));
    buttons.add(new Button(Name.CURVE_TOOL, startX, startY + size * 3, "data/Curve_Tool.png",0));
    buttons.add(new Button(Name.ELLIPSE_TOOL, startX, startY + size * 4, "data/Ellipse_Tool.png",0));
    buttons.add(new Button(Name.RECT_TOOL, startX, startY + size * 5, "data/Rect_Tool.png",0));
    buttons.add(new Button(Name.POLYGON_TOOL, startX, startY + size * 6, "data/Polygon_Tool.png",0));
    buttons.add(new Button(Name.TEXT_TOOL, startX, startY + size * 7, "data/Text_Tool.png",0));

    //bottom toolbar
    startX = 0;
    startY += barHeight + size;
    buttons.add(new Button(Name.UNGROUP_TOOL, startX +  size * 0, startY, "data/Group_Tool.png",0));
    buttons.add(new Button(Name.GROUP_TOOL, startX + size * 1, startY, "data/Ungroup_Tool.png",0));
    buttons.add(new Button(Name.BUCKET_TOOL, startX + size * 2, startY, "data/Bucket_Tool.png",0));
    buttons.add(new Button(Name.ZOOM_TOOL, startX + size * 3, startY, "data/Magnify_Tool.png",0));
    buttons.add(new Button(Name.UNDO_TOOL, startX + size * 4, startY, "data/Undo_Tool.png", 0));
    buttons.add(new Button(Name.SAVE_TOOL, startX + size * 15, startY, "data/Save_Tool.png", 0));
    buttons.add(new Button(Name.CURSOR_TOOL, startX + size * 5, startY, "data/Click_Tool.png", 0));
    buttons.add(new Button(Name.PAN_TOOL, startX + size * 6, startY, "data/Pan_Tool.png", 0));
    buttons.add(new Button(Name.ERASER_TOOL, startX + size*7 , startY, "data/Eraser_Tool.png",0));

    //right toolbar
    startX = width - (size + 1) + 1;
    startY = (height - barHeight) / 2 + 1;
    buttons.add(new Button(Name.WHITE_COLOR, startX, startY + size * 0, "none", 1));
    buttons.add(new Button(Name.BLACK_COLOR, startX, startY + size * 1, "none", 2));
    buttons.add(new Button(Name.RED_COLOR, startX, startY + size * 2, "none", 3));
    buttons.add(new Button(Name.GREEN_COLOR, startX, startY + size * 3, "none", 4));
    buttons.add(new Button(Name.BLUE_COLOR, startX, startY + size * 4, "none", 5));
    buttons.add(new Button(Name.YELLOW_COLOR, startX, startY + size * 5, "none", 6));
    buttons.add(new Button(Name.CYAN_COLOR, startX, startY + size * 6, "none", 7));
    buttons.add(new Button(Name.MAGENTA_COLOR, startX, startY + size * 7, "none", 8));

    //top toolbar
    startX = width - size;
    startY = 0;
    color_window = new Button(Name.COLOR_WINDOW, startX, startY - size * 0, "none", 1);

    buttons.add(color_window);
  }

  void setColorWindow(color c) {
    color_window.setColor(c);
  }

  void display()
  {
    stroke(color(0));
    drawPropertiesBar(); //top
    drawNavigationBar(); //bottom
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
    rect(startX, startY, barWidth, barHeight);
  }

  private void drawPropertiesBar()
  {
    int barHeight = 51;
    int startX = -1;
    int startY = -1;
    fill(230);
    rect(startX, startY, width + 1, barHeight);
  }

  private void drawNavigationBar()
  {
    int barHeight = 52;
    int startX = -1;
    int startY = height - 50;
    fill(230);
    rect(startX, startY, width + 1, height - barHeight);
  }

  public void selectTool(Name t)
  {
    if(t == Name.UNGROUP_TOOL || t == Name.GROUP_TOOL || t == Name.UNDO_TOOL || t == Name.SAVE_TOOL){return;}
    for(int i = 0; i < buttons.size(); i++){
      if(buttons.get(i).getName() == t){buttons.get(i).select();}
      else{buttons.get(i).deSelect();}
    }
  }

}