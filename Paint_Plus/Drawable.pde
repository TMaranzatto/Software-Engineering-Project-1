public class Drawable
{
  
  private int posX;
  private int posY;
  private int rotation;
  private int scale;
  private color col;
  private int white;
  private int eraser_size;
  private boolean done;
  private PShape shap;
  
  public Drawable(){
    rotation = 100;
    scale = 100;
    col = color(myColor);
    white = 255;
    eraser_size = 15;
    done = false;
    shap = createShape(GROUP);
  }
  
  void mouseP(int x, int y){}
  void mouseD(int x, int y){}
  void mouseR(int x, int y){}
  void display(){}
  void keyT(Character c){}
  void sl(){}
  
  boolean isDone(){return done;}
  color getColor(){return col;}
}

class canvasSave extends Drawable{
  
  canvasSave(){}
  
  void sl(){
    println("saving...");
    myCanvas.exportPNG();
    super.done = true;
  }
  
}

class canvasLoad extends Drawable{
  
  canvasLoad(){}
  
  void sl(){
    myCanvas.loadPNG();
    println("loading...");
    super.done = true;
  }
  
}

class floodFill extends Drawable{
  //0 north -- 1 east -- 2 south -- 3 west
  floodFill(){}
  
  void flood(int x, int y, color rep){
    
  }
  
  void mouseP(int x, int y){
   stroke(super.col);
   loadPixels();
   
  }
}

class Pencil extends Drawable
{ 
  Pencil(){}
  void mouseP(int x, int y){
    super.posX = x;
    super.posY = y;
    //line(x, y, x, y);
    point(x,y);
  }
  
  void mouseD(int x, int y){
    stroke(super.col);
    if(super.posX != 0 && super.posY != 0){
      line(super.posX, super.posY, x, y);
    }
     super.posX = x;
     super.posY = y;
  }
  
  void mouseR(int x, int y){
    super.done = true;  
  }
  
  void display(){
    
  }
  
}

class Eraser extends Drawable
{ 
  int eraser_size = 15;
  int eraser_color = 255;
  Eraser(){}
  void mouseP(int x, int y){
    super.posX = x;
    super.posY = y;
    //line(x, y, x, y);
    point(x,y);
  }
  
  void mouseD(int x, int y){
    stroke(eraser_color);
    if(super.posX != 0 && super.posY != 0){
      strokeWeight(eraser_size);
      line(super.posX, super.posY, x, y);
    }
     super.posX = x;
     super.posY = y;
  }
  
  void mouseR(int x, int y){
    super.done = true; 
    strokeWeight(1);
    stroke(0);
  }
  
  void display(){
    
  }
}


class Paint extends Drawable
{
  //Scraped From: https://stackoverflow.com/questions/26604685/trying-to-make-a-paintbrush-effect-for-my-drawing-app-but-it-starts-too-thick
  //Thank you stackoverflow user v.k.!
  float max = 6;
  float thickness = 1;
  Paint(){}
  
  void mouseP(int x, int y){
    super.posX = x;
    super.posY = y;
    strokeWeight(thickness);
    point(x,y);
  }
  
  void mouseD(int x, int y){
    strokeWeight(thickness);
    stroke(super.col);
    //myCanvas.cacheDisplay();
    if(super.posX != 0 && super.posY != 0){
      if(thickness < max){
        line(super.posX, super.posY, x, y);
        //shape(super.shap);
        thickness += 0.25;
      }
      else{
        line(super.posX, super.posY, x, y);
        strokeWeight(max);
      }
    }
     super.posX = x;
     super.posY = y;
  }
  
  void mouseR(int x, int y){
    super.done = true;
    strokeWeight(1);
    thickness = 1;
  }
  
  void display(){
    
  }
  
}


class Line extends Drawable //DONE
{
  boolean isfirst = true; 
  void mouseP(int x1, int y1){
    stroke(super.col);
    if(isfirst == true){
     point(x1, y1);
     super.posX = x1;
     super.posY = y1;
     isfirst = false;
    }
    else{
      line(super.posX, super.posY, x1, y1);
      super.done = true;
    }
  }
  /*private int posX2;
  private int posY2;
  
  Line(){}
  
  void mouseP(int x, int y){
    stroke(super.col);
    super.posX = x;
    super.posY = y;
    point(super.posX, super.posY);
  }
  
  void mouseD(int x, int y){
    stroke(super.col);
    myCanvas.cacheDisplay();
    line(super.posX, super.posY, x, y);
  }
  
  void mouseR(int x, int y){
    posX2 = x;
    posY2 = y;
    super.done = true;
    myCanvas.cacheDisplay();
    stroke(super.col);
    line(super.posX, super.posY, posX2, posY2);
  }
  
  void display(){
    if(super.done){
      stroke(super.col);
      //fill(super.col);
      line(super.posX, super.posY, posX2, posY2);
    }
  }
  */
}


class Curve extends Drawable
{
  private int turn;
  private int x1, x3, x4;
  private int y1, y3, y4;
  private int middleX, middleY;
  private int scale;
  private int tempx, tempy;
  
  Curve(){
    turn = 1;
    x1 = x3 = x4 = 0;
    y1 = y3 = y4 = 0;
    middleX = middleY = 0;
    scale = 6;
  }
  
  void mouseP(int x, int y){
    stroke(super.col);
    fill(255, 255, 255, 0);
    if(turn == 1){
      super.posX = x;
      super.posY = y;
      point(super.posX, super.posY);
    }
    else if(turn == 2){
      x1 = x4 = mouseX - middleX;
      y1 = y4 = mouseY - middleY; 
      myCanvas.cacheDisplay();
      curve(x1 * scale, y1 * scale, super.posX, super.posY, x3, y3, x4 * scale, y4 * scale);
    }
  }
  
  void mouseD(int x, int y){
    myCanvas.cacheDisplay();
    fill(255, 255, 255, 0);
    stroke(super.col);
    if(turn == 1){
      line(super.posX, super.posY, x, y);
    }
    else if(turn == 2){
      x1 = x4 = x - middleX;
      y1 = y4 = y - middleY; 
      curve(x1 * scale, y1 * scale, super.posX, super.posY, x3, y3, x4 * scale, y4 * scale);
    }
  }
  
  void mouseR(int x, int y){
    myCanvas.cacheDisplay();
    //fill(super.col);
    stroke(super.col);
    fill(255, 255, 255, 0);
    if(turn == 1){
      //myCanvas.cacheState();
      line(super.posX, super.posY, x, y);
      x3 = x; 
      y3 = y;
      //line(super.posX, super.posY, x3, y3);
      middleX = (super.posX + x3) / 2;
      middleY = (super.posY + y3) / 2;
      turn++;
    }
    else if(turn == 2){
      //myCanvas.cacheDisplay();
      fill(255, 255, 255, 0);
      x1 = x4 = x - middleX;
      y1 = y4 = y - middleY; 
      super.done = true;
      stroke(super.col);
      //myCanvas.cacheDisplay();
      curve(x1 * scale, y1 * scale, super.posX, super.posY, x3, y3, x4 * scale, y4 * scale);
    }
  }
}


class Ellipse extends Drawable //DONE
{
  private int w, h;
  
  Ellipse(){}
  
  void mouseP(int x1, int y1){
    ellipseMode(CENTER);
    stroke(super.col);
    fill(255, 255, 255, 0);
    //fill(super.col);
    super.posX = x1;
    super.posY = y1;
    point(super.posX, super.posY);
  }
  
  void mouseD(int x1, int y1){
    fill(255, 255, 255, 0);
    stroke(super.col);
    ellipseMode(CENTER);
    myCanvas.cacheDisplay();
    ellipse(super.posX, super.posY, (x1 - super.posX)* 2, (y1 - super.posY)* 2);
  }
  
  void mouseR(int x1, int y1){
    fill(255, 255, 255, 0);
    stroke(super.col);
    ellipseMode(CENTER);
    w = (x1 - super.posX) * 2;
    h = (y1 - super.posY) * 2;
    super.done = true;
    myCanvas.cacheDisplay();
    ellipse(super.posX, super.posY, w, h);
    myUI.display();
  }
  
  void display(){
    if(super.done){
      stroke(super.col);
      fill(255, 255, 255, 0);
      //fill(super.col);
      ellipse(super.posX, super.posY, w, h);
    }
  }
}


class Rect extends Drawable  //DONE
{
  private int w, h;
  
  Rect(){}
  
  void mouseP(int x1, int y1){
    stroke(super.col);
    fill(255, 255, 255, 0);
    super.posX = x1;
    super.posY = y1;
    point(super.posX, super.posY);
  }

  void mouseD(int x1, int y1){
   myCanvas.cacheDisplay();
   fill(255, 255, 255, 0);
   stroke(super.col);
   rect(super.posX, super.posY, x1 - super.posX, y1 - super.posY);
  }

  void mouseR(int x1, int y1){
   fill(255, 255, 255, 0);
   stroke(super.col);
   super.done = true;
   w = x1 - super.posX; 
   h = y1 - super.posY;
   myCanvas.cacheDisplay();
   rect(super.posX, super.posY, w, h);
  }
  
  void display(){
    if(super.done){
      stroke(super.col);
      fill(255, 255, 255, 0);
      rect(super.posX, super.posY, w, h);
    }
  }

}

class Polygon extends Drawable
{
  private int x0, y0;
  private boolean isfirst = true;
  
  Polygon(){}
  
  void mouseP(int x1, int y1){
    //myCanvas.cacheDisplay();
    //fill(255, 255, 255, 0);
    stroke(super.col);
    if(isfirst == true){
     //print("first");
     this.x0 = x1;
     this.y0 = y1;
     point(x1, y1);
     super.posX = x1;
     super.posY = y1;
     isfirst = false;
    }
    else if(dist(x0,y0,x1,y1) > 50){
      //super.posX = x1;
      //super.posY = y1;
      line(super.posX, super.posY, x1, y1);
      super.posX = x1;
      super.posY = y1;
    }
    else{
      line(super.posX, super.posY, x0, y0);
      super.done = true;
    }
  }

  void mouseR(int x1, int y1){
   //myCanvas.cacheDisplay();
   if(super.done == false){
   line(super.posX, super.posY, x1, y1);
   super.posX = x1;
   super.posY = y1;
   }
  }
  
  void keyT(Character t){
   if(t == ENTER || t == RETURN){
      super.done = true;
   }
  }
  
  void display(){
    }

}

class Text extends Drawable
{
  String text = "";
  
  Text(){}
  
  void mouseP(int x, int y){
      textSize(15);
      fill(super.col);
      text = "";
      //super.done = false;
      super.posX = x;
      super.posY = y;
      text(text, super.posX, super.posY);
  }
  
  void keyT(Character c){
    myCanvas.cacheDisplay();
      if(c != BACKSPACE && c != RETURN && c != ENTER){
        text += c;
        text(text, super.posX, super.posY);
      }
      else if(c == BACKSPACE && text.length() != 0){
        //myCanvas.cacheDisplay();
        text = text.substring(0, text.length() - 1);
        text(text, super.posX, super.posY); 
      }
      else if(c == RETURN || c == ENTER){
        super.done = true;
        text(text, super.posX, super.posY); 
        text = "";
      }
      //text(text, super.posX, super.posY); 
    }
  
  void display(){
    fill(0);
    text(text, super.posX, super.posY); 
  }
}