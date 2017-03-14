void selectStartDraw(){
//  background(248,185,81);

  if (loadImageOneTime<1){
  PImage b;
  b = loadImage("LabStarCircleLogo2.png");
  loadImageOneTime++;
  imageMode(CENTER);
  image(b, width/2, height/2-100);
  }
  //this may seem pointless, but it is actually, some how, for some reason, drawing the buttons.  
  if (button1.update() || button2.update()){
  }
  
// if(keyPressed) {
//    if (key == '1') {    //go to game with player ID
//    enterPID=true;
//  }
// }

  str1 = "n1";
  str2 = "n2";  
  
  if(serialInput.equals(str1) == true) {
    enterPID=true;      
  }

  if(serialInput.equals(str2) == true) {
//   if(keyPressed) {
//    if (key == '2') {    //go to create player ID
    //create new ind. player PID file
    createPID=true;
    while (fileCreateloop < 1){
      mode=" Created On: ";
      fileCreate();
      getLastLine();
      pidtxt=lastLine;
      updatePIDList();
      fileCreateloop++;
//     } 
    }
  }  
}


void updatePIDList() {
  getLastLine();  
  getTimestamp();
  FileWriter file;
  String test = ("\n"+pidtxt+mode+timestamp);
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




