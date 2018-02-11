// Line tool with click and drag mechanics

float x1 = 0, x2 = 0, y1 = 0, y2 = 0;


void setup()
{
  size(400,400);
  background(255);
}

void draw()
{}

void mousePressed()
{
    x1 = mouseX; 
    y1 = mouseY; 
}

void mouseDragged()
{
  background(255);
  line(x1, y1, mouseX, mouseY);
}

void mouseReleased()
{
  x2 = mouseX;
  y2 = mouseY;
  line(x1, y1, x2, y2);
}