//main file

int toolSelected = 0;
UI myUI;
Canvas myCanvas;
Drawable shape;
HashMap<Integer, Drawable> tools;
void setup()
{
  size(800,600);   //window size
  background(255); //white canvas
  
  myUI = new UI();
  myCanvas = new Canvas();
  myUI.display();
  tools = new HashMap<Integer, Drawable>();
  tools.put(1, new Pencil()); tools.put(2, new Paint()); tools.put(3, new Line()); tools.put(4, new Curve());
  tools.put(5, new Ellipse()); tools.put(6, new Rectangle()); tools.put(7, new Polygon()); tools.put(8, new Text());
}

void draw(){}


void mouseClicked()
{
  
  int startX = 50;
  int endX = width - startX;
  int barHeight = 401;
  int startY = (height - barHeight) / 2 + 1;
  int size = 50;
  
  //check for buttons
  if(mouseX <= startX && mouseX >= 0) //on left side
  {
    println("left toolbar");
    if(mouseY >= startY && mouseY <= startY + size){ toolSelected = 1;}
    else if(mouseY >= startY + size * 1 && mouseY <= startY + size * 2){toolSelected = 2;}
    else if(mouseY >= startY + size * 2 && mouseY <= startY + size * 3){toolSelected = 3;}
    else if(mouseY >= startY + size * 3 && mouseY <= startY + size * 4){toolSelected = 4;}
    else if(mouseY >= startY + size * 4 && mouseY <= startY + size * 5){toolSelected = 5;}
    else if(mouseY >= startY + size * 5 && mouseY <= startY + size * 6){toolSelected = 6;}
    else if(mouseY >= startY + size * 6 && mouseY <= startY + size * 7){toolSelected = 7;}
    else if(mouseY >= startY + size * 7 && mouseY <= startY + size * 8){toolSelected = 8;}
    println(toolSelected);
  }
  else if(mouseX >= endX && mouseX <= width) //on right side
  {
    println("color toolbar");
    if(mouseY >= startY && mouseY <= startY + size){ toolSelected = 9;}
    else if(mouseY >= startY + size * 1 && mouseY <= startY + size * 2){toolSelected = 10;}
    else if(mouseY >= startY + size * 2 && mouseY <= startY + size * 3){toolSelected = 11;}
    else if(mouseY >= startY + size * 3 && mouseY <= startY + size * 4){toolSelected = 12;}
    else if(mouseY >= startY + size * 4 && mouseY <= startY + size * 5){toolSelected = 13;}
    else if(mouseY >= startY + size * 5 && mouseY <= startY + size * 6){toolSelected = 14;}
    else if(mouseY >= startY + size * 6 && mouseY <= startY + size * 7){toolSelected = 15;}
    else if(mouseY >= startY + size * 7 && mouseY <= startY + size * 8){toolSelected = 16;}
    println(toolSelected);
  }
  else //if clicked not on the tool
  {
    
  }
}

void mousePressed()  
{
  shape = tools.get(toolSelected);
  //this is problematic!!!
  //some shapes need multiple mouse presses for them to be constructed
  //ie polygons and curves
  if(shape != null){
    myCanvas.add(shape);
    shape.mouseP(mouseX, mouseY);
  }
}

void mouseDragged()
{
  if(shape != null){
    shape.mouseD(mouseX, mouseY);
  }
}

void mouseReleased()
{
  if(shape != null){
    shape.mouseR(mouseX, mouseY);
  }
}

void keyTyped(){
  if(shape != null){
    if(shape == tools.get(8)){
      if(shape.done == false){
        shape.keyT(key);
      }
      else{
        myCanvas.saveState();
      }
    }
  }
}