//this sketch doesn't store each shape on canvas, just the implementation of 
//dynamic shape with two clicks
//the sceme should work for basically every shape(with some adjacements)
//really similar to how dynamic lines are drawn, basically the same =)

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
    rect(x1, y1, x2 - x1, y2 - y1);
    turn = 1; //reset the turn
  }
}

void mouseMoved()
{
  if(turn == 2)
  {
    background(255);
    rect(x1, y1, mouseX - x1, mouseY - y1);
  }
}