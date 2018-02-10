//dynamic implementation for curve
//fix adjusting - has to do with x1, y1, x4, y4
//take not the coordinates but distance from middle of the curve? supposedly

int turn = 1; //no idea yet
float x1 = 0, x2 = 0, x3 = 0, x4 = 0;
float y1 = 0, y2 = 0, y3 = 0, y4 = 0;
float s = 4;

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
    turn++; 
  }
  else if(turn == 3)
  {
    x1 = x4 = mouseX;
    y1 = y4 = mouseY; 
    curve(x1 * s, y1 * s, x2, y2, x3, y3, x4 * s, y4 * s);
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
    curve(mouseX * s, mouseY * s, x2, y2, x3, y3, mouseX * s, mouseY * s);
  }
  
}