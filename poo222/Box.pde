
int tam=0;
class Box  {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;
  color col;
  
  

  // Constructor
  Box(float x, float y) {
    w = 10;
    h = 10;
    // Add the box to the box2d world
    makeBody(new Vec2(x,y),w,h);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    
    if( keyPressed){
      if(key=='1'){
      tam=0;
      
      }
    }
    
     if( keyPressed){
      if(key=='2'){
      tam=1;
    }
    }
    
     if( keyPressed){
      if(key=='3'){
      tam=2;
    }
    }
    
    if(tam==0){

   ellipseMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
     fill(col);
    noStroke();
    ellipse(0,0,w,h);
    popMatrix();
    }
    
        if(tam==1){

   ellipseMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
     fill(col);
    noStroke();
    ellipse(0,0,w+10,h+10);
    popMatrix();
    }
    
     if(tam==2){

   ellipseMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
     fill(col);
    noStroke();
    ellipse(0,0,w+30,h+30);
    popMatrix();
    }
    
    
    
    if( keyPressed){
      if((key=='a')||(key=='A')){
      col= color(0,0,random(200));
    }
    }
    
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float w_, float h_) {

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 1;
    fd.restitution = 0.5;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);
    col = color(random(50,210), random(50,210), random(50,210));
    //body.setMassFromShapes();

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-6, 6), random(2, 1)));
    body.setAngularVelocity(random(-20, 20));
    
  }

}