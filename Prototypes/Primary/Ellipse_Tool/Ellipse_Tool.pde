// Ellipse tool with click and drag mechanics


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
    ellipse(x, y, (mouseX - x) * 2, (mouseY - y) * 2);
}

void mouseReleased()
{
  w = (mouseX - x) * 2;
  h = (mouseY - y) * 2;
  ellipse(x, y, w, h);
}