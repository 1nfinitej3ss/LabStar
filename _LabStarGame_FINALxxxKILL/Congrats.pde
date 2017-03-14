void congratsPage() {
  background(248, 185, 81);
  camera();  
  println(secOutput+","+minOutput+","+millisOutput);
  
  PFont f;
  PFont fontA = loadFont("KarmaticArcade-48.vlw");
  textAlign(CENTER);
  fill(255);
  rect(0,height/2-115,width,230);
  fill(#392F12);    
  textFont(fontA, 40);  
  text("----------------------------------------------------------------------------------------------------------------------------------------------------", width/2, height/2-100);
  textFont(fontA, 50);
  text("Congratulations", width/2, height/2-40);
  textFont(fontA, 30);
  text("You Finished the Maze In", width/2, height/2+20);
  textFont(fontA, 20);
  text(minOutput+" Minutes, "+secOutput+" Seconds, and "+millisOutput+" Milliseconds", width/2, height/2+70);
  textFont(fontA, 40);  

  PImage rat;
  rat = loadImage("RATHEADbig.png");
  imageMode(CENTER);
  image(rat, width/2-500, height/2);  
  PImage ratR;
  ratR = loadImage("RATHEADbig right.png");
  imageMode(CENTER);
  image(ratR, width/2+500, height/2);  

  text("----------------------------------------------------------------------------------------------------------------------------------------------------", width/2, height/2+122);

  if (congratsDelay < 30){
    congratsDelay++;
    println(congratsDelay);
  } 

  if (congratsDelay == 30){
  congratsPIDList();
  
  //rerun setup params
  newSetup();

  //restart shit  
  splash=true;
  congrats=false;
  }  

  }

void sorryPage() {
  background(248, 185, 81);
  camera();  
  println(secOutput+","+minOutput+","+millisOutput);
  
  PFont f;
  PFont fontA = loadFont("KarmaticArcade-48.vlw");
  textAlign(CENTER);
  fill(255);
  rect(0,height/2-115,width,230);
  fill(#392F12);    
  textFont(fontA, 40);  
  text("----------------------------------------------------------------------------------------------------------------------------------------------------", width/2, height/2-100);
  textFont(fontA, 80);
  text("-- SORRY --", width/2, height/2-30);
  textFont(fontA, 30);
  text("You Did Not Finish The Maze", width/2, height/2+20);
  textFont(fontA, 50);
  text("Please Try Again", width/2, height/2+80);
  textFont(fontA, 40);  

  PImage rat;
  rat = loadImage("RATHEADbig.png");
  imageMode(CENTER);
  image(rat, width/2-500, height/2);  
  PImage ratR;
  ratR = loadImage("RATHEADbig right.png");
  imageMode(CENTER);
  image(ratR, width/2+500, height/2);  

  text("----------------------------------------------------------------------------------------------------------------------------------------------------", width/2, height/2+122);

  if (sorryDelay < 30){
    sorryDelay++;
  } 

  if (sorryDelay == 30){

  sorryPIDList();
  
  //rerun setup params
  newSetup();

  //restart shit  
  splash=true;
  sorry=false;
  }  
 }
 

void congratsPIDList() {
  getLastLine();  
  getTimestamp();
  FileWriter file;
  mode = (" Finished Maze in "+minOutput+" Minutes, "+secOutput+" Seconds, and "+millisOutput+" Milliseconds");
  String test = ("\n"+pidtxt+mode+" on "+timestamp);
  try  
  {  
    file = new FileWriter("/Users/jessicatankersley/Documents/Processing/_LabStarGame_FINAL/allPIDS.txt", true); //bool tells to append
    file.write("\n"+test); //(string, start char, end char)
    file.close();
//    println("file updated");
  }  
  catch(Exception e)  
  {  
    println("Error: Can't open file!");
  }
}

void sorryPIDList() {
  getLastLine();  
  getTimestamp();
  FileWriter file;
  mode = (" Did Not Complete Maze.  Total playtime: "+minOutput+" Minutes, "+secOutput+" Seconds, and "+millisOutput+" Milliseconds");
  String test = ("\n"+pidtxt+mode+" on "+timestamp);
  try  
  {  
    file = new FileWriter("/Users/jessicatankersley/Documents/Processing/_LabStarGame_FINAL/allPIDS.txt", true); //bool tells to append
    file.write("\n"+test); //(string, start char, end char)
    file.close();
//    println("file updated");
  }  
  catch(Exception e)  
  {  
    println("Error: Can't open file!");
  }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void newSetup(){
    
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
  button1 = new ADbutton(300,575, 700, 60, 15, "DIAL 1 to: Enter Player ID");
  button2 = new ADbutton(300,675, 700, 60, 15, "DIAL 2 to: Create Player ID");
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
    .setPosition(575, 290)
     .setSize(100, 80)
      .setFont(fontA)
       .setLabel("")      
        .setFocus(true)
         .hide()
            ;            
  
gen =  cp5.addTextfield("Gender")
    .setPosition(width/2-50, 290)
       .setLabel("")      
       .setSize(50, 80)
        .setFont(fontA)
          .hide()       
           ;

 hei =  cp5.addTextfield("Height")
    .setPosition(width/2-50, 290)
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
gameTimerWindow = controlP5.addControlWindow("gameTimerWindow", -100, 1500, 200, 115, 10);
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


