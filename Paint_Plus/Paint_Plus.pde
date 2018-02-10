//UI creation

void setup(){
  //canvas is 800x600 pixels
  size(800,600);
  
  
  //WE SET THE GENERAL SPACES FOR OUR BUTTONS
  
  //setting toolbar colors
  fill(230);
  //top toolbar for saving and loading
  rect(0,0, 799,50);
  //toolbar for selecting lines, curves, etc.
  rect(10,70, 140, 401);
  //drawing area
  rect(170, 70, 570, 401);
  stroke(0,255,0);
  strokeWeight(2);
  stroke(0,0,0);
  strokeWeight(1);
  //this is color select area
  rect(740,70, 50, 401);
  //this is reserved space for future features
  rect(170, 500, 620, 69);
  
  //WE MAKE OUR BUTTONS
  
  //color selection
  noStroke();
  //white
  fill(color(255,255,255));
  rect(741,71, 49, 50);
  //black
  fill(color(0,0,0));
  rect(741, 121, 49, 50);
  //red
  fill(color(255,0,0));
  rect(741, 171, 49,50);
  //green
  fill(color(0,255,0));
  rect(741, 221, 49, 50);
  //blue
  fill(color(0,0,255));
  rect(741, 271, 49,50);
  //yellow
  fill(color(255,255,0));
  rect(741, 321, 49, 50);
  //cyan
  fill(color(0,255,255));
  rect(741, 371, 49, 50);
  //magenta
  fill(color(255,0,255));
  rect(741, 421, 49,50);
  
  fill(0);
  
  //buttons for lines, polygons, and curves
  textAlign(LEFT,TOP);
  textSize(32);
  text("LINE", 43, 70);
  text("CIRCLE", 25, 120);
  text("RECT", 40, 170);
  text("POLY", 40, 220);
  text("CURVE", 30, 270);
  text("TEXT", 40, 320);
  text("GROUP", 30, 370);
  text("DELETE", 25, 420);
  
  text("SAVE", 10, 0);
  text("LOAD", 110, 0);
  
  
  
  
  
  
  
  
  
  
  
}