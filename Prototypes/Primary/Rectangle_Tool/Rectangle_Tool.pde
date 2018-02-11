// Rectangle with click and drag mechanics


float x = 0, y = 0;
float w = 0, h = 0;


void setup()
{
  size(400,400);
  background(255);
}

void draw()
{}

void mousePressed()
{
    x = mouseX; 
    y = mouseY; 
}

void mouseDragged()
{
    background(255);
    rect(x, y, mouseX - x, mouseY - y);
}

void mouseReleased()
{
  w = mouseX - x;
  h = mouseY - y;
  rect(x, y, w, h);
}