//main file

int toolSelected = 0;
UI myUI;
Canvas myCanvas;
Drawable shape;

void setup()
{
  size(800,600);   //window size
  background(255); //white canvas
  
  myUI = new UI();
  myCanvas = new Canvas();
  myUI.display();
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
  shape = new Line();
  shape.mouseP(mouseX, mouseY);
}

void mouseDragged()
{
  shape.mouseD(mouseX, mouseY);
}

void mouseReleased()
{
  shape.mouseR(mouseX, mouseY);
}