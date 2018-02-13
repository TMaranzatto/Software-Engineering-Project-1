import java.util.LinkedList;
TextBox t;
void setup(){
 size(600,800); 
 LinkedList<String> a = new LinkedList<String>();
 a.add("x");
 a.add("y");
 a.add("rotate");
 //a.add("scale");
 //a.add("z");
 a.add("bullshit");
 t = new TextBox(200,200, 500, 100, a);
}

void mousePressed(){
  t.mouseUpdate(mouseX,mouseY);
}

void keyPressed(){
  t.keyUpdate(key);
}

void draw(){
  t.display();
}