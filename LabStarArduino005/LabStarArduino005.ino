//joystick variables
int switchPin0 = 8;   // momentary switch on 13, other side connected to ground
int switchPin1 = 9;   // momentary switch on 13, other side connected to ground
int switchPin2 = 10;   // momentary switch on 13, other side connected to ground
int switchPin3 = 11;   // momentary switch on 13, other side connected to ground

//buttons
int yellowButton = 6;     // the number of the pushbutton pin
int redButton = 12;     // the number of the pushbutton pin
int greenButton = 13;     // the number of the pushbutton pin
int yellowButtonState = 0;         // variable for reading the pushbutton status
int redButtonState = 0;         // variable for reading the pushbutton status
int greenButtonState = 0;         // variable for reading the pushbutton status

//coin mech
int coinMech = 3;
int coinMechState = 0;

//rotary dial
boolean running = false;
int needToPrint = 0;
int count;
int in = 7;
int lastState = LOW;
int trueState = LOW;
long lastStateChangeTime = 0;
int cleared = 0;
int dialHasFinishedRotatingAfterMs = 100;
int debounceDelay = 10;

void setup() {

  //joystick setup
  pinMode(switchPin0, INPUT);
  digitalWrite(switchPin0, HIGH);      // turn on pullup resistor

  pinMode(switchPin1, INPUT);
  digitalWrite(switchPin1, HIGH);      // turn on pullup resistor

  pinMode(switchPin2, INPUT);
  digitalWrite(switchPin2, HIGH);      // turn on pullup resistor

  pinMode(switchPin3, INPUT);
  digitalWrite(switchPin3, HIGH);      // turn on pullup resistor

  // initialize the pushbutton pin as an input:
  pinMode(redButton, INPUT);     
  pinMode(greenButton, INPUT);     
  
  // initialize the coinMech pin as an input:
  pinMode(coinMech, INPUT);     

  //rotary setup
  pinMode(in, INPUT);

  //serial
  Serial.begin(9600);
}

void loop(){

  // read the state of the pushbutton value:
  yellowButtonState = digitalRead(yellowButton);
  redButtonState = digitalRead(redButton);
  greenButtonState = digitalRead(greenButton);

  // read the state of the coinMech value:
  coinMechState = digitalRead(coinMech);
  if (coinMechState == HIGH) {     
    Serial.print("c");
  }


  // check if the pushbutton is pressed.
  if (yellowButtonState == HIGH) {     
    Serial.print("yellow");
    delay(500);
  }  if (redButtonState == HIGH) {     
    Serial.print("stop");
    delay(500);
  }
  if (greenButtonState == HIGH) {     
    Serial.print("start");    
    delay(500);
  }
  
  
  //joystick loop
  if (digitalRead(switchPin0) == LOW)
  {  // switch is pressed - pullup keeps pin high normally
    delay(100);                        // delay to debounce switch
    Serial.print("DOWN"); //pin8
  }

  if (digitalRead(switchPin1) == LOW)
  {  // switch is pressed - pullup keeps pin high normally
    delay(100);                        // delay to debounce switch
    Serial.print("UP"); //pin9
  }

  if (digitalRead(switchPin2) == LOW)
  {  // switch is pressed - pullup keeps pin high normally
    delay(100);                        // delay to debounce switch
    Serial.print("LEFT"); //pin10
  }

  if (digitalRead(switchPin3) == LOW)
  {  // switch is pressed - pullup keeps pin high normally
    delay(100);                        // delay to debounce switch
    Serial.print("RIGHT"); //pin11
  }
  //joystick loop end
  ///////////////////////////////////////////////////
  //rotary loop begin
  int reading = digitalRead(in);

  if ((millis() - lastStateChangeTime) > dialHasFinishedRotatingAfterMs) {
    // the dial isn't being dialed, or has just finished being dialed.
    if (needToPrint) {
      // if it's only just finished being dialed, we need to send the number down the serial
      // line and reset the count. We mod the count by 10 because '0' will send 10 pulses.
//    Serial.print(count % 10, DEC);
//    Serial.print('\n');     //new line

      int number0 = (int(count));
//      Serial.print(number0);     //new line
      
      if (number0 == 10){
      Serial.print("n0");              
      }
      if (count == 1){
      Serial.print("n1");              
      }

      if (count == 2){
      Serial.print("n2");              
      }
      if (count == 3){
      Serial.print("n3");              
      }
      if (count == 4){
      Serial.print("n4");              
      }
      if (count == 5){
      Serial.print("n5");              
      }      
      if (count == 6){
      Serial.print("n6");              
      }      
      if (count == 7){
      Serial.print("n7");              
      }
      if (count == 8){
      Serial.print("n8");              
      }
      if (count == 9){
      Serial.print("n9");              
      }      
      
      needToPrint = 0;
      count = 0;
      cleared = 0;
    }
  } 

  if (reading != lastState) {
    lastStateChangeTime = millis();
  }
  if ((millis() - lastStateChangeTime) > debounceDelay) {
    // debounce - this happens once it's stablized
    if (reading != trueState) {
      // this means that the switch has either just gone from closed->open or vice versa.
      trueState = reading;
      if (trueState == HIGH) {
        // increment the count of pulses if it's gone high.
        count++; 
        needToPrint = 1; // we'll need to print this number (once the dial has finished rotating)
      } 
    }
  }
  lastState = reading;
  //rotary loop end

}

