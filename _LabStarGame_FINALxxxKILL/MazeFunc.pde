void mazeSetup(){  
  
  try {
    robot = new Robot();    
    robot.mousePress( InputEvent.BUTTON1_MASK );
    robot.mouseRelease( InputEvent.BUTTON1_MASK );
  }
  catch(Throwable e) {
  } 
  
  //mouse starting position (center of the maze)
  xpos = 400;
  ypos = 360;
  zpos = 150;
  
}

void mazeDraw(){
  
  background(0);
  stroke(0);
  
  finishBOX();
  plane();  // Floor
  walls () ;
  getcolor();
  getcolorRED();
  
  if (mouseOnRed){
    camera();
    congrats=true;
    secOutput=sec;
    minOutput=min;
    millisOutput=millis;
    gameTimerWindow.hide();            
  }

  // very important that this is last in draw()
  checkJoystick();  
  CheckCameraMouse (); 
  CheckVirtualMouse ();
  
  //replace with red button input
  String stopButton = "stop";
  if (serialInput.equals(stopButton) == true && serial == 1) {    
     sorry=true;
     serial=0;
  }      
  
}
 
void CheckCameraMouse () {
  // Mouse 
  // note: Makes use of the values of Robot-Mouse.
  float Radius = 450.0;  // Anfangsradius des Kreises
 
  // command map: See Help.
  angle = map(rmx,width,0,0,359); // left right
 
  xlookat = Radius*sin(radians(angle)) + xpos;
  ylookat = map(rmy,-300,floorLevel-120,-270,height); // look up / down
  zlookat = Radius*cos(radians(angle)) + zpos;

  camera (xpos,ypos,zpos,
  xlookat, ylookat, zlookat,
  0.0, 1.0, 0.0
    );
}
 
// -------------------------------------------------------------------------------------------
 
void CheckVirtualMouse () {

  //even though this occurs in MAIN DRAW, it has to appear here as well for the mouse to stay hidden during maze.  
  if(mousePressed == false) {
    noCursor();
  } else {
    cursor(HAND);
  }
  
  if (mousePress1 < 20){
  robot.mousePress( InputEvent.BUTTON1_MASK );
  robot.mouseRelease( InputEvent.BUTTON1_MASK );
  mousePress1++;
  }  
  
  //line moves mouse pos to center of canvas 
  //frame.getX() is the horizontal pos of the window top left (or so) 
  //this.getX (or just getX()) gets offset from window frame to canvas 
  //required because robot's coords are global not relative to canvas 
  robot.mouseMove(
  frame.getX()+this.getX()+round(width/2), 
  frame.getY()+this.getY()+round(height/2));
 
  //mouse pos is locked in center of canvas 
  //above lines subtract the centering, get whatever offset from 
  //center user creates by moving mouse before robot resets it, then 
  //continously adds that to our new mouse pos variables 
  rmx += mouseX-width/2; 
  rmy += mouseY-height/2; 
 
  //these lines are just shortened conditionals to handle 
  //wrapping of our mouse pos variables when they go outside canvas 
  //first one: 
  //if rmx>width? set rmx to rmx-width else : set rmx to rmx 
  rmx = rmx>width?rmx-width:rmx; 
  rmx = rmx<0?width+rmx:rmx; 
  // check ceiling
  if (rmy<-300) {
    rmy= -300;
  }
  // check floor
  if (rmy>floorLevel-20) {
    rmy= floorLevel-20;
  }
} // CheckVirtualMouse
 
// -----------------------------------------------------------

void checkJoystick(){
  
 //movement speed
  float Radius = 50;  
   
  String strUP = "UP";
  String strDOWN = "DOWN";  
  String strRIGHT = "RIGHT";
  String strLEFT = "LEFT";  
  
  if(serialInput.equals(strUP) == true && serial == 1) {
//      xpos =   Radius*sin(radians(angle)) + xpos;
//      zpos =   Radius*cos(radians(angle)) + zpos;
    robot.keyPress(KeyEvent.VK_W);
    robot.keyRelease(KeyEvent.VK_W);
    serial = 0;
  }
  
  if(serialInput.equals(strDOWN) == true && serial == 1) {
//      xpos =   Radius*sin(radians(angle)) + xpos;
//      zpos =   Radius*cos(radians(angle)) + zpos;
    robot.keyPress(KeyEvent.VK_S);
    robot.keyRelease(KeyEvent.VK_S);
    serial = 0;
  }

  if(serialInput.equals(strRIGHT) == true && serial == 1) {
//      xpos =   Radius*sin(radians(angle)) + xpos;
//      zpos =   Radius*cos(radians(angle)) + zpos;
    robot.keyPress(KeyEvent.VK_D);
    robot.keyRelease(KeyEvent.VK_D);
    serial = 0;
  }

  if(serialInput.equals(strLEFT) == true && serial == 1) {
//      xpos =   Radius*sin(radians(angle)) + xpos;
//      zpos =   Radius*cos(radians(angle)) + zpos;
    robot.keyPress(KeyEvent.VK_A);
    robot.keyRelease(KeyEvent.VK_A);
    serial = 0;
  }
}
 
void keyPressed() {
 
  //movement speed
  float Radius = 50;  
 
  if((keyPressed) && (isMouseOver == !true)) {
 
    // ----------------------------   
    // forward & backward
    if (key == 'w' || key == 'W') {
      // forward : should be running towards lookat
      xpos =   Radius*sin(radians(angle)) + xpos;
      zpos =   Radius*cos(radians(angle)) + zpos;
    }
    if (key == 's' || key == 'S') {
      // backward
      xpos =  xpos- (Radius*sin(radians(angle))) ;
      zpos =  zpos- (Radius*cos(radians(angle))) ;
    }
    // ----------------------------   
    // left & right
    if (key == 'a' || key == 'A') {
      // left
      xpos =   xpos- Radius*sin(radians(angle-90)) ;
      zpos =   zpos- Radius*cos(radians(angle-90)) ;
    }
    if (key == 'D' || key == 'd') {
      // right
      xpos =   Radius*sin(radians(angle-90)) + xpos;
      zpos =   Radius*cos(radians(angle-90)) + zpos;
    }
 }
     if (key == 'r' || key == 'R') {
      ypos-=4;  // fly up
    }
    if (key == 'f' || key == 'F') {
      ypos+=4;  // down 
      if (ypos > floorLevel-120) {  // check Floor
        ypos = floorLevel-120;
      }
    }     
    // ----------------------------    

}

// ------------------------------------------------------------------------

void getcolor() {
  color c3 = get((int)rmx, (int)rmy);
  if (c3 == #FFFFFF) {
    isMouseOver=true;
  } 
  else {   
    isMouseOver=false;
  }
}

void getcolorRED(){
  color c3 = get((int)rmx, (int)rmy);
  if (c3 == #3FFF00) {
    mouseOnRed=true;
  } 
}  
  
// ===========================================================================================
// the level stuff
 
void plane () {
  // plane aka floor
  pushMatrix();
  fill (#5F5D5D);  
  translate(0, floorLevel, -90);
  box(4200, 2, 6175);
  popMatrix();
  
  // plane aka ceiling
  pushMatrix();
  fill (#5F5D5D);  
  translate(0, 200, -90);
  box(4200, 2, 6175);
  popMatrix();
}
 
void walls () {
 
  // 4 outside walls
  final float height1 = 300;
  stroke(255);
  strokeWeight(5);
  fill (#FFFFFF);
 
  pushMatrix();
  translate(-2100, floorLevel-(height1/2), -90);
  box(10, height1, wallX);
  popMatrix();
 
  pushMatrix();
  translate(2100, floorLevel-(height1/2), -90);
  box(10, height1, wallX);
  popMatrix();  
 
  pushMatrix();
  translate(0, floorLevel-(height1/2), -3175);
  box(wallY, height1, 0);
  popMatrix();  
 
  pushMatrix();
  translate(0, floorLevel-(height1/2), 3000);
  box(wallY, height1, 0);
  popMatrix();
  
  //inside walls

  //wall 001
  pushMatrix();
  translate(1750, floorLevel-(height1/2), -265);
  box(10, height1, wallX-352);
  popMatrix();    

  //wall 002
  pushMatrix();
  translate(0, floorLevel-(height1/2), -3000);
  box(10, height1, 352);
  popMatrix();    

  //wall 003
  pushMatrix();
  translate(0, floorLevel-(height1/2), 2824);
  box(10, height1, 352);
  popMatrix();    

  //wall 004
  pushMatrix();
  translate(1050, floorLevel-(height1/2), 2650);
  box(1400, height1, 0);
  popMatrix();    

  //wall 005
  pushMatrix();
  translate(350, floorLevel-(height1/2), 2472);
  box(10, height1, 352);
  popMatrix();    
  
  //wall 006
  pushMatrix();
  translate(0, floorLevel-(height1/2), 2300);
  box(700, height1, 0);
  popMatrix();     
  
  //wall 007
  pushMatrix();
  translate(-350, floorLevel-(height1/2), 2472);
  box(10, height1, 352);
  popMatrix();   
  
  //wall 008
  pushMatrix();
  translate(-1050, floorLevel-(height1/2), 2650);
  box(1400, height1, 0);
  popMatrix();    

  //wall 009
  pushMatrix();
  translate(-1750, floorLevel-(height1/2), 2110);
  box(10, height1, 1056);
  popMatrix();     

  //wall 010
  pushMatrix();
  translate(-1750, floorLevel-(height1/2), 1056);
  box(700, height1, 0);
  popMatrix();       
  
  //wall 011
  pushMatrix();
  translate(-1925, floorLevel-(height1/2), 0);
  box(350, height1, 0);
  popMatrix();    
  
  //wall 012
  pushMatrix();
  translate(-1750, floorLevel-(height1/2), 350);
  box(10, height1, 700);
  popMatrix();       

  //wall 013
  pushMatrix();
  translate(-1400, floorLevel-(height1/2), 0);
  box(10, height1, 700);
  popMatrix();       

  //wall 014
  pushMatrix();
  translate(-1750, floorLevel-(height1/2), -550);
  box(10, height1, 352);
  popMatrix();       

  //wall 015
  pushMatrix();
  translate(-1400, floorLevel-(height1/2), -725);
  box(700, height1, 0);
  popMatrix();       

  //wall 016
  pushMatrix();
  translate(-1400, floorLevel-(height1/2), 700);
  box(700, height1, 0);
  popMatrix();       

  //wall 017
  pushMatrix();
  translate(-1050, floorLevel-(height1/2), 0);
  box(700, height1, 0);
  popMatrix();    

  //wall 018
  pushMatrix();
  translate(-1400, floorLevel-(height1/2), 1672);
  box(10, height1, 1232);
  popMatrix();     
  
  //wall 019  
  pushMatrix();
  translate(-1050, floorLevel-(height1/2), 2298);
  box(700, height1, 0);
  popMatrix();        
  
  //wall 020
  pushMatrix();
  translate(-1050, floorLevel-(height1/2), 1140);
  box(10, height1, 1575);
  popMatrix();       
  
  //wall 021
  pushMatrix();
  translate(0, floorLevel-(height1/2), 1925);
  box(2100, height1, 0);
  popMatrix();        
 
  //wall 022
  pushMatrix();
  translate(350, floorLevel-(height1/2), 1575);
  box(2100, height1, 0);
  popMatrix();        

  //wall 023
  pushMatrix();
  translate(0, floorLevel-(height1/2), 1225);
  box(2100, height1, 0);
  popMatrix();        

  //wall 024
  pushMatrix();
  translate(1050, floorLevel-(height1/2), 2298);
  box(700, height1, 0);
  popMatrix();        

  //wall 025
  pushMatrix();
  translate(1400, floorLevel-(height1/2), 1498);
  box(10, height1, 1600);
  popMatrix();       
  
  //wall 026
  pushMatrix();
  translate(1225, floorLevel-(height1/2), 700);
  box(360, height1, 0);
  popMatrix();          

  //wall 027
  pushMatrix();
  translate(1050, floorLevel-(height1/2), 960);
  box(10, height1, 525);
  popMatrix();       
  
  //wall 028
  pushMatrix();
  translate(0, floorLevel-(height1/2), 875);
  box(1400, height1, 0);
  popMatrix();    

  //wall 029
  pushMatrix();
  translate(0, floorLevel-(height1/2), -700);
  box(1400, height1, 0);
  popMatrix();    
  
  //wall 030
  pushMatrix();
  translate(-700, floorLevel-(height1/2), 85);
  box(10, height1, 1575);
  popMatrix();       
  
  //wall 031
  pushMatrix();
  translate(700, floorLevel-(height1/2), 610);
  box(10, height1, 525);
  popMatrix();       
  
  //wall 032
  pushMatrix();
  translate(700, floorLevel-(height1/2), -350);
  box(10, height1, 700);
  popMatrix();       

  //wall 033
  pushMatrix();
  translate(-1050, floorLevel-(height1/2), -700);
  box(10, height1, 700);
  popMatrix();       

  //wall 034
  pushMatrix();
  translate(1050, floorLevel-(height1/2), -700);
  box(10, height1, 700);
  popMatrix();       

  //wall 035
  pushMatrix();
  translate(0, floorLevel-(height1/2), -1050);
  box(2100, height1, 0);
  popMatrix();    

  //wall 036
  pushMatrix();
  translate(1050, floorLevel-(height1/2), 0);
  box(700, height1, 0);
  popMatrix();        

  //wall 037
  pushMatrix();
  translate(1225, floorLevel-(height1/2), 350);
  box(1050, height1, 0);
  popMatrix();     

  //wall 038
  pushMatrix();
  translate(1400, floorLevel-(height1/2), -1400);
  box(10, height1, 2800);
  popMatrix();           
  
  //wall 039
  pushMatrix();
  translate(-1750, floorLevel-(height1/2), -1050);
  box(700, height1, 0);
  popMatrix();

  //wall 040
  pushMatrix();
  translate(0, floorLevel-(height1/2), -1400);
  box(2100, height1, 0);
  popMatrix();       

  //wall 041
  pushMatrix();
  translate(175, floorLevel-(height1/2), -1750);
  box(2450, height1, 0);
  popMatrix();       

  //wall 042
  pushMatrix();
  translate(-175, floorLevel-(height1/2), -2100);
  box(1750, height1, 0);
  popMatrix();       

  //wall 043
  pushMatrix();
  translate(-1050, floorLevel-(height1/2), -1750);
  box(10, height1, 700);
  popMatrix();       
  
  //wall 044
  pushMatrix();
  translate(-1400, floorLevel-(height1/2), -1750);
  box(10, height1, 1400);
  popMatrix();     
  
  //wall 045
  pushMatrix();
  translate(-1750, floorLevel-(height1/2), -2100);
  box(10, height1, 1400);
  popMatrix();     

  //wall 046
  pushMatrix();
  translate(-1050, floorLevel-(height1/2), -2800);
  box(1400, height1, 0);
  popMatrix();    
  
  //wall 047
  pushMatrix();
  translate(-350, floorLevel-(height1/2), -2625);
  box(10, height1, 352);
  popMatrix();      
  
  //wall 048
  pushMatrix();
  translate(-1050, floorLevel-(height1/2), -2450);
  box(700, height1, 0);
  popMatrix();      
  
  //wall 049
  pushMatrix();
  translate(350, floorLevel-(height1/2), -2450);
  box(1400, height1, 0);
  popMatrix();        
  
  //wall 050
  pushMatrix();
  translate(1050, floorLevel-(height1/2), -2100);
  box(10, height1, 700);
  popMatrix();       
  
  //wall 049
  pushMatrix();
  translate(875, floorLevel-(height1/2), -2800);
  box(1050, height1, 0);
  popMatrix();        

  
/* reference only:
--HORIZONTAL WALL
--box(10, height1, 700);      
--VERTICAL WALL
--box(700, height1, 0);
*/
}

////=====================================================================
void finishBOX () {
  fill(#3FFF00);
  stroke(#3FFF00);  
  pushMatrix();
  translate ( 1900, 350, -2980 );
  scale (5); 
  sphere (20);
  popMatrix();

if (flashUP==false){
  flash-=10;
  if (flash==0){
        flashUP=true;
  }
}

if (flashUP==true){
  flash+=10;
  if (flash==300){
        flashUP=false;
  }
 }  
}

