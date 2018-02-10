//TODO make UI that scales to the window size
//hugs left, top, and right portions of the window

class UI 
{

  UI(){}
  
  void display()
  {
    drawToolBar();
    drawPropertiesBar();
    drawColorBar();
  }
  
  private void drawToolBar()
  {
    fill(230);
    rect(10,70, 140, 401);
  }
  
  private void drawColorBar()
  {
    //this is color select area
    rect(740,70, 50, 401);
    //color selection
    noStroke();
    //white
    fill(color(255,255,255));
    rect(741,71, 49, 50);
    //black
    fill(color(0,0,0));
    rect(741, 121, 49, 50);
    //red
    fill(color(255,0,0));
    rect(741, 171, 49,50);
    //green
    fill(color(0,255,0));
    rect(741, 221, 49, 50);
    //blue
    fill(color(0,0,255));
    rect(741, 271, 49,50);
    //yellow
    fill(color(255,255,0));
    rect(741, 321, 49, 50);
    //cyan
    fill(color(0,255,255));
    rect(741, 371, 49, 50);
    //magenta
    fill(color(255,0,255));
    rect(741, 421, 49,50);
  }
  private void drawPropertiesBar()
  {
    fill(230);
    rect(0,0, 799,50);
  }
  
}