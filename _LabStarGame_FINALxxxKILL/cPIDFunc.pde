void createPIDfocus() {

  //  if (ageFocus == true) {
  //    age.setFocus(true);
  //  }


  startButton = "start";
  serialListen();

  //red button press to backspace keypress
  stopButton = "stop";  
  if(serialInput.equals(stopButton) == true && serial == 1) {
  try {
    Robot rob = new Robot();
    rob.keyPress(KeyEvent.VK_BACK_SPACE);
    rob.keyRelease(KeyEvent.VK_BACK_SPACE);
      }
  catch(Throwable e) {
      } 
    }  
  
  //replace mousePressed with START BUTTON or something ...
  if (serialInput.equals(startButton) == true && serial == 1 && ageComplete) {    
    genFocus = true;
    if (fwd==0){
      serial=0;
      fwd++;
    }
}

  if (serialInput.equals(startButton) == true && serial == 1 && genComplete) {   
      heiFocus = true;
    if (fwd==1){
      serial=0;
      fwd++;
     }
    }    
  
  if (serialInput.equals(startButton) == true && serial == 1 && heiComplete) {   
    eduFocus = true;
    if (fwd==2){
      serial=0;
      fwd++;
     }    
  }      
  
  if (serialInput.equals(startButton) == true && serial == 1 && eduComplete == true) {   
    vidFocus = true;
    if (fwd==3){
      serial=0;
      fwd++;
     }        
  }   

  if (serialInput.equals(startButton) == true && serial == 1 && vidComplete == true) {   
    exeFocus = true;
    if (fwd==4){
      serial=0;
      fwd++;
     }        
  }        
  if (serialInput.equals(startButton) == true && serial == 1 && exeComplete == true) {   
    allComplete = true;
    if (fwd==5){
      serial=0;
      fwd++;
     }        
  }      
  if (serialInput.equals(startButton) == true && serial == 1 && allComplete == true) {   
    Finish();
    if (fwd==6){
      serial=0;
      fwd++;
     }        
  }      

  if (genFocus == true) {
    gen.setFocus(true);
    age.setFocus(false);
  }
  if (heiFocus == true) {
    hei.setFocus(true);
    gen.setFocus(false);
  }

  if (eduFocus == true) {
    hei.setFocus(false);
  }
}

void createPIDDraw() {  
  PFont font = createFont("arial", 20);
  textFont(font);
  background(248, 185, 81);
  textAlign(LEFT);

  PFont f;
  PFont fontA = loadFont("KarmaticArcade-48.vlw");
  textFont(fontA, 40);
  textAlign(CENTER);
  smooth();

  PFont g;  
  PFont fontB = loadFont("KarmaticArcade-48.vlw");
  textFont(fontB, 10);
  textAlign(CENTER);
  smooth();

  createPIDfocus();
  
  //  title
  textFont(fontA);  
  fill(255);
  rect(0, 26, width, 119);
  fill(#392F12);    
  text("----------------------------------------------------------------------------------------------------------------------------------------------------", width/2, 46);
  text("Create Player ID", width/2, 100);

  PImage rat;
  rat = loadImage("RATHEAD.png");
  imageMode(CENTER);
  image(rat, width/2-400, 85);  
  PImage ratR;
  ratR = loadImage("RATHEAD right.png");
  imageMode(CENTER);
  image(ratR, width/2+400, 85);  

  text("----------------------------------------------------------------------------------------------------------------------------------------------------", width/2, 150);

  //  unique player ID
  //  text("New Player Profile:", 20, 550);

  //  unique player ID
  //  first get it:
  getLastLine();
  //  then show it:
  textFont(fontA, 28);    
  text("[Remember Your Player ID For Future PLAY!]", width/2, 182);  
  textFont(fontA, 40);      
  text("YOUR UNIQUE PLAYER ID IS "+currentPlayerPID, width/2, 227);  
  textFont(fontA);    
  fill(255);
  rect(0, 250, width, 240);
  rect(0, height-10, width, 10);
  fill(#392F12);    
  text("----------------------------------------------------------------------------------------------------------------------------------------------------", width/2, 270);
  text("----------------------------------------------------------------------------------------------------------------------------------------------------", width/2, 495);
  text("----------------------------------------------------------------------------------------------------------------------------------------------------", width/2, height+10);

  textFont(fontA, 35);    
  textAlign(LEFT);
  text("AGE", 50, 530);
  text("GENDER", 50, 570);
  text("HEIGHT", 50, 610);
  text("EDUCATION", 50, 650);
  text("GAMING", 50, 690);
  text("EXERCISE", 50, 730);

  //  age
  ageOutput=age.getText();
  if (ageResults) {
    text("- "+age.getText(), 160, 530);
  }

  //  gender
  if (genResults) {
    text("- "+genOutput, 248, 570);
  }
  String gender=cp5.get(Textfield.class, "Gender").getText();
  if (gender.contains("1")) {
    genOutput=("Female");
  }
  else if (gender.contains("2")) {
    genOutput=("Male");
  } 
  else { 
    genOutput=("");
  }

  //  height
  heiOutput=hei.getText();
  if (heiResults) {
    text("- "+heiOutput, 225, 610);
  }

  //  education  
  //  text("[Education]"+eduOutput, 20, 675);
  if (highschool) {
    text(" - HIGHSCHOOL", 303, 650);
    eduOutput="highscool";    
  }  
  if (college) {
    text(" - SOME COLLEGE", 303, 650);
    eduOutput="some college";    
  }  
  if (undergraduate) {
    text(" - UNDERGRADUATE", 303, 650);
    eduOutput="undergraduate";        
  }  
  if (graduate) {
    text(" - GRADUATE", 303, 650);
    eduOutput="graduate";        
  }  
  if (doctorate) {
    text(" - DOCTORATE", 303, 650);
    eduOutput="doctorate";        
  }  

  //gaming      

  if (never) {
    text(" - Never", 225, 690);
    vidOutput="never";
  }    
  if (month4) {
    text(" - 1-4 Times a Month", 225, 690);
    vidOutput="1-4 times a month";
  }  
  if (month8) {
    text(" - 5-8 Times a Month", 225, 690);
    vidOutput="5-8 times a month";    
  }  
  if (month12) {
    text(" - 9-12 Times a Month", 225, 690);
    vidOutput="9-12 times a month";    
  }  
  if (month13) {
    text(" - Over 12 Times a Month", 225, 690);
    vidOutput="over 12 times a month";    
  }  

  //exercise
  if (exenever) {
    text(" - Never", 288, 730);
    exeOutput="never";    
  }    
  if (week1) {
    text(" - Once a Week", 288, 730);
    exeOutput="once a week";    
  }  
  if (week4) {
    text(" - 2-4 Times a Week", 288, 730);
    exeOutput="2-4 times a week";        
  }  
  if (week6) {
    text(" - 5-6 Times a Week", 288, 730);
    exeOutput="5-6 times a week";        
  }  
  if (week7) {
    text(" - Over 6 Times a Week", 288, 730);
    exeOutput="over 6 times a week";        
  }  

  //  If all fields complete, show Finish button:
  listen();
  

    PImage button;
    button = loadImage("backspace.png");
    imageMode(CENTER);
    image(button, width-200, height-50);    
}

void getLastLine() {
  String path = sketchPath + "/PIDS";
  String[] filenames = listFileNames(path);
  int goToLastLine = filenames.length-1;
  lastLine = filenames[goToLastLine];
  currentPlayerPID = lastLine.substring(3, 7);
  //  println(currentPlayerPID);
}
public void fileCreate() {  

  //   SAVE individual PID file
  Data data=new Data(); 
  data.beginSave();
  data.endSave(
  data.getIncrementalFilename(
  sketchPath("PIDS"+
    java.io.File.separator+
    "PID####.txt")));
}


void Finish() {  

  getTimestamp();
  Data data=new Data();

  //   SAVING
  data.beginSave();
  data.add("PID Created at "+timestamp);
  data.add(ageOutput);
  data.add(genOutput);  
  data.add(heiOutput);
  data.add(eduOutput);  
  data.add(vidOutput);
  data.add(exeOutput);  
  data.endSave(sketchPath("PIDS"+java.io.File.separator+lastLine));

  createPID=false;
  maze=true;
}

void getTimestamp() {

  int s = second();
  int m = minute();
  int h = hour();
  long d = day();
  long mon = month();
  long y = year();
  timestamp=(h+":"+m+":"+s+" on "+d+"-"+mon+"-"+y);
}
void listen() {  

  PFont f;
  PFont fontA = loadFont("KarmaticArcade-48.vlw");
  textFont(fontA, 30);
  textAlign(CENTER);

  if (ageFocus && !genFocus) {
    ageComplete = true;
    age.show();  
    age.setFocus(true);  
    text("Dial Age Then Press", 600, 310);
    PImage button;
    button = loadImage("greenBUTTON.png");
    imageMode(CENTER);
    image(button, 870, 300);
  }

  if (genFocus && !heiFocus && age.getIndex() > 0) {    
    age.hide();
    ageResults=true;
    gen.show();
    text("Dial Gender Then Press", 600, 310);
    textFont(fontA, 25);
    text("DIAL 1 for FEMALE - DIAL 2 for MALE", width/2, 450);
    textFont(fontA);
    PImage button;
    button = loadImage("greenBUTTON.png");
    imageMode(CENTER);
    image(button, 900, 300);      
    genComplete = true;
  }

  if (heiFocus && !eduFocus) {    
    gen.hide();
    genResults=true;
    hei.show();
    text("Dial Height Then Press", 595, 310);
    PImage button;
    button = loadImage("greenBUTTON.png");
    imageMode(CENTER);
    image(button, 880, 300);      
    textFont(fontA, 25);
    text("INCHES", width/2, 450);
    textFont(fontA);    
    heiComplete = true;
  }

  if (eduFocus && !vidFocus) {    
    hei.hide();
    heiResults=true;

    str1 = "n1";
    str2 = "n2";  
    str3 = "n3";  
    str4 = "n4";  
    str5 = "n5";  

    if(serialInput.equals(str1) == true) {
        highschool=true;   
        college=false;
        undergraduate=false;
        graduate=false;        
        doctorate=false;               
      }
    if(serialInput.equals(str2) == true) {
        college=true;  
        highschool=false;
        undergraduate=false;
        graduate=false;        
        doctorate=false;        
      }
    if(serialInput.equals(str3) == true) {
        undergraduate=true;
        highschool=false;
        college=false;
        graduate=false;        
        doctorate=false;               
      }
    if(serialInput.equals(str4) == true) {
        graduate=true;
        highschool=false;
        undergraduate=false;
        college=false;        
        doctorate=false;               
      }
    if(serialInput.equals(str5) == true) {
        doctorate=true;
        highschool=false;
        undergraduate=false;
        graduate=false;        
        college=false;               
    }   

    text("Dial Education Then Press", 600, 310);
    PImage button;
    button = loadImage("greenBUTTON.png");
    imageMode(CENTER);
    image(button, 930, 300);      
    textFont(fontA, 25);
    textAlign(LEFT);
    text("DIAL 1 - HIGHSCHOOL", 420, 350);
    text("DIAL 2 - SOME COLLEGE", 420, 375);    
    text("DIAL 3 - UNDERGRADUATE DEGREE", 420, 400);    
    text("DIAL 4 - GRADUATE DEGREE", 420, 425);    
    text("DIAL 5 - DOCTORATE", 420, 450);    
    textAlign(CENTER);

    textFont(fontA);    
    eduComplete = true;
  }

  if (vidFocus && !exeFocus) {    

    str1 = "n1";
    str2 = "n2";  
    str3 = "n3";  
    str4 = "n4";  
    str5 = "n5";  

    if(serialInput.equals(str1) == true) {
        never=true;  
        month4=false;  
        month8=false;  
        month12=false;  
        month13=false;          
      }
    if(serialInput.equals(str2) == true) {
        month4=true;  
        never=false;  
        month8=false;  
        month12=false;  
        month13=false;          
      }
    if(serialInput.equals(str3) == true) {
        month8=true;  
        month4=false;  
        never=false;  
        month12=false;  
        month13=false;          
      }
    if(serialInput.equals(str4) == true) {
        month12=true;  
        month4=false;  
        month8=false;  
        never=false;  
        month13=false;          
      }
    if(serialInput.equals(str5) == true) {
        month13=true;  
        month4=false;  
        month8=false;  
        month12=false;  
        never=false;          
      }

    text("Dial Gaming Then Press", 610, 310);
    PImage button;
    button = loadImage("greenBUTTON.png");
    imageMode(CENTER);
    image(button, 910, 300);      
    textFont(fontA, 25);
    textAlign(LEFT);
    text("DIAL 1 - Never", 420, 350);
    text("DIAL 2 - 1-4 Times a Month", 420, 375);    
    text("DIAL 3 - 5-8 Times a Month", 420, 400);    
    text("DIAL 4 - 9-12 Times a Month", 420, 425);    
    text("DIAL 5 - Over 12 Times a Month", 420, 450);    
    textAlign(CENTER);

    vidComplete = true;
  }

    if (exeFocus && !allComplete){    

    str1 = "n1";
    str2 = "n2";  
    str3 = "n3";  
    str4 = "n4";  
    str5 = "n5";  

    if(serialInput.equals(str1) == true) {
        exenever=true;        
        week1=false;  
        week4=false;  
        week6=false;  
        week7=false;  
      }
    if(serialInput.equals(str2) == true) {
        week1=true;  
        exenever=false;  
        week4=false;  
        week6=false;  
        week7=false;       }
    if(serialInput.equals(str3) == true) {
        week4=true;  
        week1=false;  
        exenever=false;  
        week6=false;  
        week7=false;         
      }
    if(serialInput.equals(str4) == true) {
        week6=true;  
        week1=false;  
        week4=false;  
        exenever=false;  
        week7=false;         
      }
    if(serialInput.equals(str5) == true) {
        week7=true;  
        week1=false;  
        week4=false;  
        week6=false;  
        exenever=false;         
      } 

    text("Dial Exercise Then Press", 600, 310);
    PImage button;
    button = loadImage("greenBUTTON.png");
    imageMode(CENTER);
    image(button, 920, 300);      
    textFont(fontA, 25);
    textAlign(LEFT);
    text("DIAL 1 - Never", 420, 350);
    text("DIAL 2 - Once a week", 420, 375);    
    text("DIAL 3 - 2-4 Times a Week", 420, 400);    
    text("DIAL 4 - 5-6 Times a Week", 420, 425);    
    text("DIAL 5 - Over 6 Times a Week", 420, 450);    
    textAlign(CENTER);

      exeComplete = true;
    }
  
  if (allComplete){
    text("YOUR PLAYER PROFILE IS COMPLETE!", width/2, 317);
    fill(248, 185, 81);        
    text(currentPlayerPID, width/2+365, 367);  
    fill(#392F12);    
    text("REMEMBER YOUR UNIQUE PLAYER ID - ", width/2-55, 367);  
    text("PRESS", 524, 427);    
    text("TO PLAY", 765, 427);    

    PImage button;
    button = loadImage("greenBUTTON.png");
    imageMode(CENTER);
    image(button, width/2, 417);      
  }
}

