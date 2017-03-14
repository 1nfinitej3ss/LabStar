void enterPIDDraw() {
  background(248, 185, 81);
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

  PImage b;
  b = loadImage("circles1.png");
  imageMode(CENTER);
  image(b, width/2, height/2-20);
  
    PImage backspace1;
    backspace1 = loadImage("backspace.png");
    imageMode(CENTER);
    image(backspace1, width-200, 100);    
  

  PFont f;
  PFont fontA = loadFont("KarmaticArcade-48.vlw");
  textFont(fontA, 40);
  textAlign(CENTER);
  smooth();

    textFont(fontA, 40);
    text("OR Press", 310, 700);
    text("To Create Player ID", 825, 700);
    PImage button;
    button = loadImage("greenBUTTON.png");
    imageMode(CENTER);
    image(button, 492, 688);
    textFont(fontA, 40);  
    
    
  // Start in the center and draw the circle
  translate(width/2, height/2-20);

  arclength = arcpos;  


    
  // For every box
  for (int i = 0; i < message.length(); i ++ ) {

    // The character and its width
    char currentChar = message.charAt(i);
    // Instead of a constant width, we check the width of each character.
    float w = textWidth(currentChar);
    // Each box is centered so we move half the width
    arclength += w/2;

    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    float theta = PI + arclength / r;

    pushMatrix();

    // Polar to Cartesian conversion allows us to find the point along the curve. See Chapter 13 for a review of this concept.
    translate(r*cos(theta), r*sin(theta));
    // Rotate the box (rotation is offset by 90 degrees)
    rotate(theta + PI/2);

    // Display the character


    fill(#392F12);  
    text(currentChar, 0, 0);

    popMatrix();

    //    // Move halfway again
    arclength += w/2;
  }

  arcpos+=3;

  ///////////  ///////////  ///////////  ///////////  ///////////  ///////////  ///////////  ///////////

  pid.getIndex();    

  if (pid.getIndex() == 4 && !valid) {
    message  = "PRESS YELLOW TO VERIFY ID ----------------------";
  }
  if (pid.getIndex() < 4 && invalid) {
    message = "INVALID ID, TRY AGAIN -------------------------------";
  }  
  if (pid.getIndex() > 4) {
    invalid=true;
  }

  
  if (valid) {
    message  = "VALID ID -- PRESS GREEN TO BEGIN -------------";  
    invalid=false;
  }
  if (invalid) {
    valid=false;

    if (clear1 < 1){
    pid.clear();        
    clear1++;
    }    
  } 


    //replace mousePressed with START BUTTON or something ...
//    if (mousePressed == true && valid) {    //go to game with player ID
//      maze=true;
//    }
//  
  stopButton = "stop";
  yellowButton = "yellow";
  startButton = "start";  
  
  if(serialInput.equals(startButton) == true && valid == true) {
    maze=true;     
  }

  if(serialInput.equals(startButton) == true && valid == false) {
  //restart shit  
  createPID=true;
  enterPID=false;  
  serial=0;  
  }
  
  if(serialInput.equals(yellowButton) == true && serial == 1) {    
      valid=false;
      invalid=false;
      String chkPID=pid.getText();
      int lengthPID = chkPID.length();
      String lines[] = loadStrings("allPIDS.txt");
      for (int i=0; i < lines.length; i++) {
        String allPIDS=(lines[i]); 
        if (allPIDS.contains(chkPID)&&lengthPID==4) {
          mode=" Played On: ";
          valid=true;
          invalid=false;
          currentPlayerPID = chkPID;
          pidtxt=currentPlayerPID;
          if (updateOnce < 1) {
            updatePIDList();
            updateOnce++;
          }
        } 
        else { 
          invalid=true;
          valid=false;
        }
      }
    }

}

