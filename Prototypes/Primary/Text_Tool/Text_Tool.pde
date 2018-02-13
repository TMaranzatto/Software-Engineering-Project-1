//text tool

float textX = 0, textY = 0;
ArrayList<Character> text;
void setup()
{
  size(400,400);
  background(255);
  fill(0);
  textSize(32);
  text = new ArrayList<Character>();
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
  text.add(key);
  text(text.toString().replaceAll("[,\\[\\]]", ""), textX, textY);
}