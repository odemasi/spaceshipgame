/*
 The circuit:
 analog 0: accelerometer self test
 analog 1: z-axis
 analog 2: y-axis
 analog 3: x-axis

code graphs all output from accelerometers. Used for debugging 
*/

// these constants describe the pins. They won't change:
const int X1pin = A0;                  // x-axis 
const int Y1pin = A1;                  // y-axis
const int Z1pin = A2;                  // z-axis

const int X2pin = A3;                  // x-axis 
const int Y2pin = A4;                  // x-axis 
const int Z2pin = A5;                  // x-axis 


int X1value = 0;
int Y1value = 0;
int Z1value = 0;

int X2value = 0;
int Y2value = 0;
int Z2value = 0;

void setup()
{
  // initialize the serial communications:
  Serial.begin(9600);
}



void loop()
{
 
  //Gather Sensor Data;
  //Note: at 1G, values will range from -69 to +69 around these centerpoints:
  X1value = analogRead(X1pin) - 330 ;
  Y1value = analogRead(Y1pin) - 330 ;
  Z1value = analogRead(Z1pin) - 330 ;
  
  X2value = analogRead(X2pin) - 330 ;
  Y2value = analogRead(Y2pin) - 345 ;
  Z2value = analogRead(Z2pin) - 330 ;

  
  
  //Graph all data:
  
  //graph X1 value:
  if (X1value > 0) {
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (X1value/5); i++) {  Serial.print("|");  }
      for(int i = 0; i < (20 - X1value/5); i++) {  Serial.print(" ");  }
      }
  else { 
      for(int i = 0; i < (20 + X1value/5); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (-X1value/5); i++) {  Serial.print("-");  }
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      }
  Serial.print("X");

  //graph Y1 value:
  if (Y1value > 0) {
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (Y1value/5); i++) {  Serial.print("|");  }
      for(int i = 0; i < (20 - Y1value/5); i++) {  Serial.print(" ");  }
      }
  else { 
      for(int i = 0; i < (20 + Y1value/5); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (-Y1value/5); i++) {  Serial.print("-");  }
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      }
  Serial.print("X");

  //graph Z1 value:
  if (Z1value > 0) {
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (Z1value/5); i++) {  Serial.print("|");  }
      for(int i = 0; i < (20 - Z1value/5); i++) {  Serial.print(" ");  }
      }
  else { 
      for(int i = 0; i < (20 + Z1value/5); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (-Z1value/5); i++) {  Serial.print("-");  }
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      }
  Serial.print("X");


  Serial.print("  <-- #1  |  #2 -->  ");


  //graph X2 value:
  if (X2value > 0) {
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (X2value/5); i++) {  Serial.print("|");  }
      for(int i = 0; i < (20 - X2value/5); i++) {  Serial.print(" ");  }
      }
  else { 
      for(int i = 0; i < (20 + X2value/5); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (-X2value/5); i++) {  Serial.print("-");  }
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      }
  Serial.print("X");

  //graph Y2 value:
  if (Y2value > 0) {
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (Y2value/5); i++) {  Serial.print("|");  }
      for(int i = 0; i < (20 - Y2value/5); i++) {  Serial.print(" ");  }
      }
  else { 
      for(int i = 0; i < (20 + Y2value/5); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (-Y2value/5); i++) {  Serial.print("-");  }
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      }
  Serial.print("X");

  //graph Z2 value:
  if (Z2value > 0) {
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (Z2value/5); i++) {  Serial.print("|");  }
      for(int i = 0; i < (20 - Z2value/5); i++) {  Serial.print(" ");  }
      }
  else { 
      for(int i = 0; i < (20 + Z2value/5); i++) {  Serial.print(" ");  }
      for(int i = 0; i < (-Z2value/5); i++) {  Serial.print("-");  }
      for(int i = 0; i < (20); i++) {  Serial.print(" ");  }
      }
  Serial.print("X");

 
  //print a linefeed:
  Serial.println();
  
  
  
  // delay before next reading:
  delay(100);
}

