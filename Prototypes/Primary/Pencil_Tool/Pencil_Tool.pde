//pencil tool

float prevX = 0, prevY = 0;

void setup()
{
  size(400,400);
  background(255);
  noSmooth(); //should be used here
  strokeWeight(4); //default will be 1
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
  //point(mouseX, mouseY);   bad implementation
  
  line(prevX, prevY, mouseX, mouseY);
  prevX = mouseX;
  prevY = mouseY;
}