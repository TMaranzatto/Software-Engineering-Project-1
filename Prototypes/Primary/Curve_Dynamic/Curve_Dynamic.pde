//dynamic implementation for curve

int turn = 1; //no idea yet
float x1 = 0, x2 = 0, x3 = 0, x4 = 0;
float y1 = 0, y2 = 0, y3 = 0, y4 = 0;
float middleX = 0, middleY = 0;
float scale = 6;
void setup()
{
  size(400,400);
  background(255);
}

void draw()
{}

void mouseClicked()
{
  if(turn == 1) //first click, start of the curve
  {
    x2 = mouseX; 
    y2 = mouseY; 
    turn++; //move on to second click
  }
  else if(turn == 2) //second click, end of the curve
  {
    x3 = mouseX; 
    y3 = mouseY;
    middleX = (x2 + x3) / 2;
    middleY = (y2 + y3) / 2;
    turn++; 
  }
  else if(turn == 3)
  {
    x1 = x4 = mouseX - middleX;
    y1 = y4 = mouseY - middleY; 
    curve(x1 * scale, y1 * scale, x2, y2, x3, y3, x4 * scale, y4 * scale);
    turn = 1; //reset the turn
  }
  
}

void mouseMoved()
{
  if(turn == 2)
  {
    background(255);
    line(x2, y2, mouseX, mouseY);
  }
  else if(turn == 3)
  {
    background(255);
    x1 = x4 = mouseX - middleX;
    y1 = y4 = mouseY - middleY; 
    curve(x1 * scale, y1 * scale, x2, y2, x3, y3, x4 * scale, y4 * scale);
  }
  
}