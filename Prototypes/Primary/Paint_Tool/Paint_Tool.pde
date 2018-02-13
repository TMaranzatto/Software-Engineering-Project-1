//Scraped From: https://stackoverflow.com/questions/26604685/trying-to-make-a-paintbrush-effect-for-my-drawing-app-but-it-starts-too-thick
//Thank you stackoverflow user v.k.!

float max = 6;
float thickness = 1;
void setup()
{ 
  size(500, 500);
  smooth();
  background(255);
}
void draw() 
{ 
  if (mousePressed) 
  { 
    if (thickness < max) 
    { 
      strokeWeight(thickness); // <<<<<<<<<<<<<<<< THIS! :)
      line(mouseX, mouseY, pmouseX, pmouseY); 
      thickness = thickness+0.25;
    }
    else 
    { 
      line(mouseX, mouseY, pmouseX, pmouseY);
      strokeWeight(max);
    }
  }
}
void mouseReleased() 
{ 
  thickness = thickness/thickness;
}