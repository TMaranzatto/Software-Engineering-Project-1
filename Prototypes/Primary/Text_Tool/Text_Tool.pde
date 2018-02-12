//text tool

float textX = 0, textY = 0;

void setup()
{
  size(400,400);
  background(255);
  fill(0);
  textSize(32);
}

void draw()
{}

void mouseClicked()
{
  textX = mouseX;
  textY = mouseY;
}

void keyTyped()
{
  background(255);
  text(key, textX, textY);
}