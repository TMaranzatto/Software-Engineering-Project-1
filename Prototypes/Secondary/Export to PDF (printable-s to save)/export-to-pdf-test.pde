//dynamic implementation for curve

// !!! Change the parts to click and drag scheme

import processing.pdf.*;
int turn = 1; //no idea yet
float x1 = 0, x2 = 0, x3 = 0, x4 = 0;
float y1 = 0, y2 = 0, y3 = 0, y4 = 0;
float middleX = 0, middleY = 0;
float scale = 6;


void setup()
{
  size(400,400);
  background(255);
  beginRecord(PDF, "Picture.pdf");
}

void draw()
{}

void keyPressed(){
  if (key=='q'){
    endRecord();
  }
}

void mousePressed()
{
  if(turn == 1) //first click, draw line by dragging
  {
    x2 = mouseX; 
    y2 = mouseY; 
  }
  else if(turn == 2) //second click, adjust curve by dragging
  {
    background(255);
    x1 = x4 = mouseX - middleX;
    y1 = y4 = mouseY - middleY; 
    curve(x1 * scale, y1 * scale, x2, y2, x3, y3, x4 * scale, y4 * scale);
  }
}

void mouseDragged()
{
  if(turn == 1)
  {
    background(255);
    line(x2, y2, mouseX, mouseY);
  }
  else if(turn == 2)
  {
    background(255);
    x1 = x4 = mouseX - middleX;
    y1 = y4 = mouseY - middleY; 
    curve(x1 * scale, y1 * scale, x2, y2, x3, y3, x4 * scale, y4 * scale);
  }
  
}

void mouseReleased()
{
  if(turn == 1)
  {
    x3 = mouseX; 
    y3 = mouseY;
    line(x2, y2, x3, y3);
    middleX = (x2 + x3) / 2;
    middleY = (y2 + y3) / 2;
    turn++;
  }
  else if(turn == 2)
  {
    x1 = x4 = mouseX - middleX;
    y1 = y4 = mouseY - middleY; 
    curve(x1 * scale, y1 * scale, x2, y2, x3, y3, x4 * scale, y4 * scale);
    turn = 1; //reset the turn
    x1 = x2 = x3 = x4 = y1 = y2 = y3 = y4 = 0; //reset all!
  }
}