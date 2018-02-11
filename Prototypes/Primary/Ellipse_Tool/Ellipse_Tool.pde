//dynamic implementation for ellipse

// !!! Change to click and drag mechanics, with default size, if it wasn't dragged
// far enough

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
    ellipse(x1, y1, (mouseX - x1) * 2, (mouseY - y1) * 2);
    turn = 1; //reset the turn
  }
}

void mouseMoved()
{
  if(turn == 2)
  {
    background(255);
    ellipse(x1, y1, (mouseX - x1) * 2, (mouseY - y1) * 2);
  }
}