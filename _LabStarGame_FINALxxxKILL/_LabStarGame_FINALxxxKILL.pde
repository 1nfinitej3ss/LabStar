/* 
[info]
 * Created: April, 30 2012
 * By: Jessica Tankersley
 * For: The project "Lab Star, the game".  For more information visit jtankersley.com.
 * Contact: jesstankersley@gmail.com 

[credits]
 * Coding this game was made possible by using/tweaking the following examples:
   * Floating Strands (on the splash page): http://www.openprocessing.org/sketch/177
   * First Person Environment (for the maze): http://www.openprocessing.org/sketch/25255
   * ControlP5 Library Examples (GUI): http://www.sojamo.de/libraries/controlP5/
   * Large Buttons: http://www.openprocessing.org/sketch/57555
   * Timer: http://www.openprocessing.org/sketch/7747
*/

//----------------------------Import Libraries--------------------------------------
import processing.opengl.*;
import controlP5.*;
import processing.serial.*;

import java.awt.Robot; 
import java.awt.AWTException;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

import fullscreen.*; 
FullScreen fs; 
//----------------------------Import Libraries--------------------------------------


//----------------------------Serial Comm-------------------------------------------
Serial myPort;  // Create object from Serial class
String serialInput;
int serial;
String str0;
String str1;
String str2;
String str3;
String str4;
String str5;
String str6;
String str7;
String str8;
String str9;
String startButton;
String stopButton;
String yellowButton;
String credit;
//----------------------------Serial Comm-------------------------------------------

//----------------------------Toggle Game Screens-----------------------------------
boolean splash;
boolean createPID;
boolean maze;
boolean selectStart;
boolean enterPID;
boolean congrats, sorry;
String currentPlayerPID;
int fileCreateloop;
//----------------------------Toggle Game Screens-----------------------------------

//----------------------------Splash Page-------------------------------------------
float mouseMass=30;
float translateY;
int flash;
boolean flashGO;
boolean flashUP;
int vel=1;    //how quickly they spawn at the beginning
ArrayList ns; ArrayList as; ArrayList ns1; ArrayList as1;
ArrayList ns2; ArrayList as2; ArrayList ns3; ArrayList as3;
ArrayList ns4; ArrayList as4;
float k, k2;
int t;
float tMass;
int curn, nn;
float curMass;
int im;
//----------------------------Splash Page-------------------------------------------

//----------------------------Select Start Page-------------------------------------
ADbutton button1; 
ADbutton button2;
float a=2.5,b=3.144;
int x=10,y=20;
boolean bool=true;
int loadImageOneTime;
String s="This is a string.";
//----------------------------Select Start Page-------------------------------------

//----------------------------Enter PID Page----------------------------------------
ControlP5 cp5a;
Textfield pid;
Bang finA, start;
boolean valid;
boolean invalid;
boolean pidClear;
int updateOnce;
int clear1, clear2;
String message;
float arclength; 
float arcpos;
float r = 190;  
int serialReset, serialReset1;
int newClear;
//----------------------------Enter PID Page----------------------------------------

//----------------------------Create PID Page---------------------------------------
ControlP5 cp5;
Textfield age, gen, hei;
Slider edu, vid, exe;
Bang fin;
String mode;
String pidtxt;
String lastLine;
String timestamp;
int eduPosY1 = 310;
int eduPosY2 = 340;
int vidPosY1 = 375;
int vidPosY2 = 406;
int exePosY1 = 440;
int exePosY2 = 472;
boolean ageComplete, genComplete, heiComplete, eduComplete, vidComplete, exeComplete, allComplete;
boolean ageFocus, genFocus, heiFocus, eduFocus, vidFocus, exeFocus, allFocus;
boolean ageResults, genResults, heiResults, eduResults, vidResults, exeResults, allResults;
boolean highschool, college, undergraduate, graduate, doctorate;
boolean never, month4, month8, month12, month13;
boolean exenever,week1,week4,week6,week7;
int fwd;
String textValue = "";
String ageOutput, genOutput;
String heiOutput;
String eduOutput, vidOutput, exeOutput;
//----------------------------Create PID Page---------------------------------------


//----------------------------MAZE Page---------------------------------------------
int oneWindow;
int mousePress, mousePress1;
boolean isMouseOver = false;
boolean mouseOnRed;
// Floor has y-value
final float floorLevel = 500.0;
final float wallX = 6175;
final float wallY = 4200;   
// camera / where you are
float xpos,ypos,zpos, xlookat,ylookat,zlookat;
float angle=0.0; // (angle left / right; 0..359)
// player is crouching yes / no
boolean isCrouching = false;
Robot robot; 
float rmx, rmy;   // virtual mouse values
// Buildings: color for figures
color colWhite = 253;
color colBlack = 72;
// Buildings: values for position of figures on the screen
int calculationForScreenPositionX = 0;  //
int calculationForScreenPositionY = 46; //
int calculationForScreenPositionZ = 0;  //
int mazeSetupChk;
int sec, min, millis;
int secOutput, minOutput, millisOutput;
ControlP5 controlP5;
ControlWindow gameTimerWindow;
ControlWindowCanvas cc;
//----------------------------MAZE Page---------------------------------------------

//----------------------------CONGRATS Page---------------------------------------------
int refreshSETUP;
int congratsDelay;
int sorryDelay;
//----------------------------CONGRATS Page---------------------------------------------


/*############################################################################
################ SETUP BEGIN SETUP BEGIN SETUP ###############################                           
##############################################################################*/
void setup(){  
//----------------------------Screen Setup--------------------------------------
  size(screen.width, screen.height, OPENGL);    
  smooth();
  frameRate(45);
  
  splash=true;
  maze=false;
  createPID=false;
  selectStart=false;
  enterPID=false;
  congrats=false;
  sorry=false;
  fileCreateloop = 0;
  
//----------------------------Screen Setup--------------------------------------

//----------------------------Serial Comm---------------------------------------
  myPort = new Serial(this, "/dev/tty.usbmodem411", 9600);
  serialInput = "start"; // this is required to initialize string
  serial = 0;
//----------------------------Serial Comm---------------------------------------

//----------------------------Splash Page Setup---------------------------------
  translateY=50;
  flash=200;  
  flashUP=false;
  flashGO=true;
  ns=new ArrayList(); as=new ArrayList();  ns1=new ArrayList();  as1=new ArrayList();
  ns2=new ArrayList();  as2=new ArrayList();  ns3=new ArrayList();  as3=new ArrayList();
  ns4=new ArrayList();
  as4=new ArrayList();
  prepare();
  curMass=mouseMass;
  tMass=1;
  curn=0;
//----------------------------Splash Page Setup--------------------------------

//----------------------------Select Start Page-------------------------------------
  button1 = new ADbutton(300,555, 700, 60, 15, "DIAL 1 to: Enter Player ID");
  button2 = new ADbutton(300,655, 700, 60, 15, "DIAL 2 to: Create Player ID");
  loadImageOneTime=0;
//----------------------------Select Start Page-------------------------------------

//----------------------------Enter PID Page----------------------------------------
  valid=false;
  invalid=false;
  serialReset=0;  
  serialReset1=0;
  pidClear=false;
  updateOnce=0;
  clear1=0;
  clear2=0;  
  PFont fontA = loadFont("KarmaticArcade-48.vlw");
  cp5a = new ControlP5(this);
  arcpos=10;
  message  = "DIAL YOUR 4 DIGIT PLAYER ID ---------------------";

pid = cp5a.addTextfield("")
    .setPosition(-100, -50)
    .setColorBackground(#392F12)   
    .setColorActive(#392F12)    
    .setSize(200, 100)
    .setFont(fontA)
    .hide()
     ;            

//----------------------------Enter PID Page----------------------------------------


//----------------------------Create PID Page---------------------------------------
  ageComplete = false;
  genComplete = false;
  heiComplete = false;
  eduComplete = false;
  vidComplete = false;
  exeComplete = false;
  allComplete = false;

  highschool = false;
  college = false;
  undergraduate = false;
  graduate = false;
  doctorate = false;

  never = false;
  month4 = false;
  month8 = false;
  month12 = false;
  month13 = false;

  exenever = false;
  week1 = false;
  week4 = false;
  week6 = false;
  week7 = false;
  
  ageFocus = true;
  genFocus = false;
  heiFocus = false;
  eduFocus = false;
  vidFocus = false;
  exeFocus = false;
  allFocus = false;

  ageResults = false;
  genResults = false;
  heiResults = false;
  eduResults = false;
  vidResults = false;
  exeResults = false;
  allResults = false;
  
  PFont font = createFont("arial", 20);
  cp5 = new ControlP5(this);

age = cp5.addTextfield("Age")
    .setPosition(575, 330)
     .setSize(100, 80)
      .setFont(fontA)
       .setLabel("")      
        .setFocus(true)
         .hide()
            ;            
  
gen =  cp5.addTextfield("Gender")
    .setPosition(width/2-50, 330)
       .setLabel("")      
       .setSize(50, 80)
        .setFont(fontA)
          .hide()       
           ;

 hei =  cp5.addTextfield("Height")
    .setPosition(width/2-50, 330)
       .setLabel("")      
      .setSize(100, 80)
        .setFont(fontA)
           .hide()        
            ;
  
  textFont(font);
  int fwd=0;
//----------------------------Create PID Page---------------------------------------

//----------------------------MAZE Page---------------------------------------------
mazeSetupChk=0;
//must setup on demand, or fucks everything else up :(
mousePress = 0;
mousePress1 = 0;
mouseOnRed=false;

controlP5 = new ControlP5(this);
gameTimerWindow = controlP5.addControlWindow("gameTimerWindow", 0, 0, 1500, 100, 10);
gameTimerWindow.papplet().frame.setAlwaysOnTop(true);  
gameTimerWindow.setUpdateMode(ControlWindow.NORMAL);
gameTimerWindow.hide();
cc = new MyCanvas();
cc.pre();
gameTimerWindow.addCanvas(cc);
oneWindow=0;


//----------------------------MAZE Page---------------------------------------------

//----------------------------CONGRATS or SORRY Page-----------------------------------------
refreshSETUP = 0;
congratsDelay=0;
sorryDelay=0;
//----------------------------CONGRATS or SORRY Page-----------------------------------------  
}

/*############################################################################
#################### SETUP END SETUP ENd SETUP ###############################                           
##############################################################################*/

/*############################################################################
################## DRAW BEGIN DRAW BEGIN DRAW ################################                           
##############################################################################*/
void draw(){

  if(mousePressed == false) {
    noCursor();
  } else {
    cursor(HAND);
  }
  
checkGameScreen();
checkSerial();

if (splash){
  splashDraw();  
}

if (selectStart){

  selectStartDraw();

} 

if (createPID){
  selectStart=false;  //this needs to be here (for now anyways) because it comes AFTER keyrelease 
  serialListen();

    //keeps 2 from showing in age text field
//    if (clear2 < 5){
//    serial=0;
//    clear2++;
//    }         

  createPIDDraw(); 
 }
 
if (enterPID){
  selectStart=false;  //this needs to be here (for now anyways) because it comes AFTER keyrelease   
  pid.show().setFocus(true);  

  serialListen();
  enterPIDDraw();  
  //empy any values if coming from create PID page

  if (newClear < 1){
  pid.clear();  
  newClear++;
  }  
  
  
}

if (maze){
  pid.hide(); 
  serialListen();

  if (oneWindow < 1){
  gameTimerWindow.show();  
  oneWindow++;
  }

 if (mazeSetupChk<1){ 
  mazeSetup();
  mazeSetupChk++;
 }
  
 mazeDraw();

  if (mousePress < 20){
  robot.mousePress( InputEvent.BUTTON1_MASK );
  robot.mouseRelease( InputEvent.BUTTON1_MASK );
  mousePress++;
  }  
   
 }
 
if (congrats){

  congratsPage();  

 }

if (sorry){
  camera();
  maze=false;
  gameTimerWindow.hide();            
  sorryPage();  

 }

}

  
/*############################################################################
###################### DRAW END DRAW END DRAW ################################                           
##############################################################################*/

void checkGameScreen(){

  if (selectStart){
   splash=false;
   congrats=false;   
   createPID=false;
   maze=false;
   enterPID=false;  
   sorry=false; 
 }
 
  if (splash){
   selectStart=false;
   createPID=false;
   enterPID=false;   
   maze=false;
   congrats=false;
   sorry=false; 
 }
 
 if (createPID){
   selectStart=false;
   splash=false;
   maze=false;
   enterPID=false;
   congrats=false;   
   sorry=false; 
 }
 
 if (maze){
   selectStart=false;
   createPID=false;
   splash=false;
   enterPID=false;
   congrats=false;   
   sorry=false; 
 }
 
if (enterPID){
   maze=false;
   selectStart=false;
   createPID=false;
   splash=false;
   congrats=false;
   sorry=false; 
 }

if (congrats){
   selectStart=false;
   createPID=false;
   splash=false;
   enterPID=false;
   maze=false;
   sorry=false; 
 }
  
if (sorry){
   selectStart=false;
   createPID=false;
   splash=false;
   enterPID=false;
   maze=false;
   congrats=false; 
 }
}

///below, hides title bar, in lieu of full screen:
// overriding PApplet.init() to add a hack of our own
void init() {
 
  // trick to make it possible to change the frame properties
  frame.removeNotify(); 
 
  // comment this out to turn OS chrome back on
  frame.setUndecorated(true); 
 
  // comment this out to not have the window "float"
  frame.setAlwaysOnTop(false); 
 
  frame.setResizable(true);  
  frame.addNotify(); 
 
  // making sure to call PApplet.init() so that things 
  // get  properly set up.
  super.init();
}
//

void checkSerial(){
    if(myPort.available() > 0) {
     String inBuffer = myPort.readString();   
     serialInput = inBuffer;
      if (inBuffer != null) {
      //printing buffer slows things down
      println(inBuffer);
      serial = 1;
      } else {
        serial = 0;
      }
 }

}

//convert incoming serial messages to key presses for form fields
void serialListen() {
  str0 = "n0";  
  str1 = "n1";
  str2 = "n2";  
  str3 = "n3";  
  str4 = "n4";  
  str5 = "n5";  
  str6 = "n6";  
  str7 = "n7";  
  str8 = "n8";  
  str9 = "n9";  
  
  if (enterPID == true && serialReset<1){
    serial=0;
    serialReset++;
  }
  if (createPID == true && serialReset1<1){
    serial=0;
    serialReset1++;
  }
  
  if(serialInput.equals(str0) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_0);
      robot.keyRelease(KeyEvent.VK_0);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 

  if(serialInput.equals(str1) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_1);
      robot.keyRelease(KeyEvent.VK_1);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 

  if(serialInput.equals(str2) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_2);
      robot.keyRelease(KeyEvent.VK_2);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 
    
  if(serialInput.equals(str3) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_3);
      robot.keyRelease(KeyEvent.VK_3);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 

  if(serialInput.equals(str4) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_4);
      robot.keyRelease(KeyEvent.VK_4);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 

  if(serialInput.equals(str5) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_5);
      robot.keyRelease(KeyEvent.VK_5);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 

  if(serialInput.equals(str6) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_6);
      robot.keyRelease(KeyEvent.VK_6);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 

  if(serialInput.equals(str7) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_7);
      robot.keyRelease(KeyEvent.VK_7);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 
  if(serialInput.equals(str8) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_8);
      robot.keyRelease(KeyEvent.VK_8);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 
  if(serialInput.equals(str9) == true && serial == 1) {
    try {
      robot = new Robot();    
      robot.keyPress(KeyEvent.VK_9);
      robot.keyRelease(KeyEvent.VK_9);
      } catch(Throwable e) {
     }     
     serial = 0;
    } 
    
//

}

