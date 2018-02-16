//main file
import processing.pdf.*;

Name toolSelected = Name.LINE_TOOL;
UI myUI;
Canvas myCanvas;
Drawable myShape;
color myColor;

void setup()
{
  size(800,600);   //window size
  background(255); //white canvas
  //beginRecord(PDF, "Picture.pdf");

  myUI = new UI();
  myCanvas = new Canvas();
  myShape = null;
  myColor = color(0);
  myUI.selectTool(toolSelected);
  myUI.display();
}

void draw(){
  strokeWeight(1);
  myUI.display();
}

void keyPressed(){
  if (key=='q'){
    beginRecord(PDF, "Picture.pdf");
    myCanvas.cacheDisplay();
    endRecord();
  }
}

void mouseClicked()
{
  int size = 50;
  int startX = 0;
  int endX = width - size;
  int barHeight = 401;
  int startY = (height - barHeight) / 2 + 1;


  //check for buttons
  if(mouseX <= size && mouseX >= 0 && mouseY < barHeight + startY && mouseY > size) //on left side
  {
    if(mouseY >= startY && mouseY <= startY + size){                    toolSelected = Name.PENCIL_TOOL;}
    else if(mouseY >= startY + size * 1 && mouseY <= startY + size * 2){toolSelected = Name.PAINT_TOOL;}
    else if(mouseY >= startY + size * 2 && mouseY <= startY + size * 3){toolSelected = Name.LINE_TOOL;}
    else if(mouseY >= startY + size * 3 && mouseY <= startY + size * 4){toolSelected = Name.CURVE_TOOL;}
    else if(mouseY >= startY + size * 4 && mouseY <= startY + size * 5){toolSelected = Name.ELLIPSE_TOOL;}
    else if(mouseY >= startY + size * 5 && mouseY <= startY + size * 6){toolSelected = Name.RECT_TOOL;}
    else if(mouseY >= startY + size * 6 && mouseY <= startY + size * 7){toolSelected = Name.POLYGON_TOOL;}
    else if(mouseY >= startY + size * 7 && mouseY <= startY + size * 8){toolSelected = Name.TEXT_TOOL;}
  }
  else if(mouseX >= endX && mouseX <= width && mouseY < barHeight + startY && mouseY > size) //on right side
  {
    if(mouseY >= startY && mouseY <= startY + size){                    myColor = color(255, 255, 255);}
    else if(mouseY >= startY + size * 1 && mouseY <= startY + size * 2){myColor = color(  0,   0,   0);}
    else if(mouseY >= startY + size * 2 && mouseY <= startY + size * 3){myColor = color(255,   0,   0);}
    else if(mouseY >= startY + size * 3 && mouseY <= startY + size * 4){myColor = color(  0, 255,   0);}
    else if(mouseY >= startY + size * 4 && mouseY <= startY + size * 5){myColor = color(  0,   0, 255);}
    else if(mouseY >= startY + size * 5 && mouseY <= startY + size * 6){myColor = color(255, 255,   0);}
    else if(mouseY >= startY + size * 6 && mouseY <= startY + size * 7){myColor = color(  0, 255, 255);}
    else if(mouseY >= startY + size * 7 && mouseY <= startY + size * 8){myColor = color(255,   0, 255);}
  }
  else if(mouseY >= height - size)  //bottom bar
  {
    if(mouseX >= startX && mouseX <= size * 1){      toolSelected = Name.UNGROUP_TOOL;}
    else if(mouseX >= startX && mouseX <= size * 2){ toolSelected = Name.GROUP_TOOL;}
    else if(mouseX >= startX && mouseX <= size * 3){ toolSelected = Name.BUCKET_TOOL;}
    else if(mouseX >= startX && mouseX <= size * 4){ toolSelected = Name.ZOOM_TOOL;}
    else if(mouseX >= startX && mouseX <= size * 5){ toolSelected = Name.LOAD_TOOL;}
    else if(mouseX >= startX && mouseX <= size * 6){ toolSelected = Name.CURSOR_TOOL;}
    else if(mouseX >= startX && mouseX <= size * 7){ toolSelected = Name.PAN_TOOL;}
    else if(mouseX >= startX && mouseX <= size * 8){ toolSelected = Name.ERASER_TOOL;}
    else if(mouseX >= width - size && mouseX <= width){ toolSelected = Name.SAVE_TOOL;}
  }
  else if(toolSelected == Name.CURSOR_TOOL) //if cursor tool is selected
  {
    //code for selecting the drawable put here
  }

  myUI.setColorWindow(myColor);
  myUI.selectTool(toolSelected);
  myUI.display();
}

void assignShape(){
  if(toolSelected == Name.PENCIL_TOOL)      {myShape = new Pencil();}
  else if(toolSelected == Name.PAINT_TOOL)  {myShape = new Paint();}
  else if(toolSelected == Name.LINE_TOOL)   {myShape = new Line();}
  else if(toolSelected == Name.CURVE_TOOL)  {myShape = new Curve();}
  else if(toolSelected == Name.ELLIPSE_TOOL){myShape = new Ellipse();}
  else if(toolSelected == Name.RECT_TOOL)   {myShape = new Rect();}
  else if(toolSelected == Name.POLYGON_TOOL){myShape = new Polygon();}
  else if(toolSelected == Name.TEXT_TOOL)   {myShape = new Text();}
  else if(toolSelected == Name.ERASER_TOOL) {myShape = new Eraser();}
  else if(toolSelected == Name.SAVE_TOOL) {myShape = new canvasSave(); }
  else if(toolSelected == Name.LOAD_TOOL) {myShape = new canvasLoad();}
}


void mousePressed()
{
  //check if it's pressed on a canvas:
  if((mouseX > 51 && mouseX < width - 51 && mouseY > 51 && mouseY < height - 51)){
    //no previous shape created yet:
    if(myShape == null){
      assignShape();
      myShape.mouseP(mouseX, mouseY);
    }
    //some shape was created or in the process:
    else if(myShape != null){
      if(myShape.isDone()){
        assignShape();
      }
      myShape.mouseP(mouseX, mouseY);
    }
  }
}

void mouseDragged()
{
  if(mouseX > 51 && mouseX < width - 51 && mouseY > 51 && mouseY < height - 51){
    if(myShape != null){
      myShape.mouseD(mouseX, mouseY);
    }
  }
}

void mouseReleased()
{
  if(mouseX > 51 && mouseX < width - 51 && mouseY > 51 && mouseY < height - 51){
    if(myShape != null){
      myShape.mouseR(mouseX, mouseY);
      myCanvas.add(myShape);
    }
  }
}


void keyTyped(){
  //myCanvas.exportPNG();
  if(myShape != null){
    if(toolSelected == Name.TEXT_TOOL){
      if(myShape.done == false){
        myShape.keyT(key);
      }
      else{
        //myCanvas.saveState();   no idea if we actually need this crap
      }
    }
  }
}