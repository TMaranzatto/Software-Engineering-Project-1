//this sketch doesn't store each lines on canvas, just the implementation of 
//drawing interactive line with two clicks

int turn = 1; //first click + second click
float x1 = 0, x2 = 0, y1 = 0, y2 = 0;


void setup()
{
  size(400,400);
  background(255);
}

void draw()
{}

void mouseClicked()
{
  if(turn == 1) //first click
  {
    x1 = mouseX; 
    y1 = mouseY; 
    turn++; //move on to second click
  }
  else if(turn == 2) //second click
  {
    x2 = mouseX; y2 = mouseY;
    line(x1, y1, x2, y2);
    turn = 1; //reset the turn
  }
}

void mouseMoved()
{
  if(turn == 2)
  {
    background(255);
    line(x1, y1, mouseX, mouseY);
  }
}