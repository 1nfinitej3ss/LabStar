// your controlWindowCanvas class
class MyCanvas extends ControlWindowCanvas {
  PFont AFont, AFont1;
  int index;
  char[] chars = {
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
  };

  public void draw(PApplet theApplet) {

    AFont = createFont("KarmaticArcade", 50.0f, true, chars);    
    AFont1 = createFont("KarmaticArcade", 30.0f, true, chars);    
    theApplet.textFont(AFont);        
    theApplet.background(#F8B951);
    gameTimerWindow.setUndecorated(true);
    theApplet.textAlign(CENTER);

    // display the time
    index = 60*millis()/1000;
    theApplet.fill(0); // gray
    millis = (millis())%1000;
    sec = (index/60)%60;//second(); //clock mode
    min = (index/3600)%60;    
    theApplet.text(nf(millis, 3)+"-"+nf(sec, 2)+"-"+nf(min, 2), 225, 75);
    theApplet.fill(#1C6F01); // green
    theApplet.textFont(AFont1);            
    theApplet.text("END OF MAZE MARKED", 655, 50);
    theApplet.text("WITH GREEN CIRCLE", 660, 80);    
    theApplet.fill(0); // white    
    theApplet.text("TO EXIT PUSH", 1050, 65);
    theApplet.rect(420,0,15,100);
    theApplet.rect(885,0,15,100);
    PImage redButton;
    redButton = loadImage("redButtonMed.png");
    imageMode(CENTER);
    theApplet.image(redButton, 1190, 35);  

    //stop message
  }
}

