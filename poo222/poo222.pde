




import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import ddf.minim.*;



Minim son1;
AudioPlayer sond;

Minim son2;
AudioPlayer sond2;





Box2DProcessing box2d;


int pant=0;
ArrayList<Box> boxes;

void setup() {
  size(1200,600);
  smooth();
  
  son1 = new Minim(this);
  
  sond = son1.loadFile("ambient1.mp3");
  
   son2 = new Minim(this);
  
  sond2 = son2.loadFile("crash.mp3");
  
 
 
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  
 	
  boxes = new ArrayList<Box>();
}



void draw(){  
  background(0);
   fill(0,200,150);
  noStroke();
  rect(0,0,200,600);
    fill(50);
    textSize(15);
    text("Herramientas de dibujo",10,80);
    fill(80);
    textSize(12);
    text("-Para dibujar, presiona el mouse",5,120);
     fill(80);
    textSize(12);
    text("-Para aumentar el tamaño de",5,160);
    text("los círculos, presiona: 1,2,3",12,180);
     text("-Para activar la gravedad en",5,200);
      text("el dibujo,presiona 'a' ",12,220);
      text("-Para desactivar la gravedad",5,240);
      text("en el trazado, presiona 'z' ",12,260);
      
     
 
  if(keyPressed){
    if((key=='a')||(key=='A')){
       sond2.play();
       
    pant = 2;
    
    
  }
  }

  if(pant == 2){
    box2d.step();
   
  }
  
  if(keyPressed){
    if((key=='z')||(key=='Z')){
      pant =0;
      ;
    }
  }

  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
     sond.play();
     
    

  }
  
 


      
  

  for (Box b: boxes) {
    b.display();
  }
}
