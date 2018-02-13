//text tool

float textX = 0, textY = 0;
String text;
void setup()
{
  size(400,400);
  background(255);
  fill(0);
  textSize(32);
  text = "";
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
  if(key != BACKSPACE){
    text += key;
  }
  else if(key == BACKSPACE && text.length() != 0){
    text = text.substring(0, text.length() - 1);
  }
  text(text.toString().replaceAll("[,\\[\\]]", ""), textX, textY);
}