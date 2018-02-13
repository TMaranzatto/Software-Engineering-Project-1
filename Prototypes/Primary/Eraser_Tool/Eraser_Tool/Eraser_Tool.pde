//eraser tool
//might not be the "right" eraser - we may need an eraser that erases the object,
//not just pixels on the screen

//may implement both types, but saving the changes to an object might be too complex
//for the time we have

float prevX = 0, prevY = 0;

void setup()
{
  size(400,400);
  background(255); 
  noSmooth(); //should be used here
}

void draw()
{}

void mousePressed()
{
  point(mouseX, mouseY);
  prevX = mouseX;
  prevY = mouseY;
}

void mouseDragged()
{ 
  stroke(255);
  line(prevX, prevY, mouseX, mouseY);
  prevX = mouseX;
  prevY = mouseY;
}