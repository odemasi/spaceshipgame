/*
 The circuit:
 analog 0: accelerometer self test
 analog 1: z-axis
 analog 2: y-axis
 analog 3: x-axis

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

int Offset = 20;
int Scaling = 5;


void setup()
{
  // initialize the serial communications:
  Serial.begin(9600);
}



void loop()
{
 
  //Gather Sensor Data;
  //Note: at 1G, values will range from -69 to +69 around these centerpoints.
  //Reasonable tilt angles will range from about -45 to +45, but use 50 to be safe.
  X1value = analogRead(X1pin);// - 330 ;
  Y1value = analogRead(Y1pin);// - 330 ;
  Z1value = analogRead(Z1pin);// - 330 ;
  
  X2value = analogRead(X2pin);// - 330 ;
  Y2value = analogRead(Y2pin);// - 330 ;
  Z2value = analogRead(Z2pin);// - 330 ;

  
  
  //Graph all data:
          // Note: this SHOULD work, but Arduino doesn't understand parentheses in math!
          // Serial.print( ((Z1value + Z2value)/2)*(90/67) );
          // Serial.print("\t");
//  
//  Serial.print( ((Z1value + Z2value)/2)*90/67 ); Serial.print(" degrees");
//  Serial.print("\t");
//  Serial.print("\t");
//  
//  Serial.print(Z1value);
//  Serial.print("\t");
//  Serial.print(Z2value);
//  Serial.print("\t");
//  
  
  
  Serial.print((X1value + X2value)/2);
  Serial.print('|');
  Serial.print((Y1value + Y2value)/2);
  Serial.print(':');
  Serial.println((Z1value + Z2value)/2);
  
  
//  
//  //graph Z1 value:
//  if (Z1value > 0) {
//      for(int i = 0; i < (Offset); i++) {  Serial.print(" ");  }
//      for(int i = 0; i < (Z1value/Scaling); i++) {  Serial.print("|");  }
//      for(int i = 0; i < (Offset - Z1value/Scaling); i++) {  Serial.print(" ");  }
//      }
//  else { 
//      for(int i = 0; i < (Offset + Z1value/Scaling); i++) {  Serial.print(" ");  }
//      for(int i = 0; i < (-Z1value/Scaling); i++) {  Serial.print("-");  }
//      for(int i = 0; i < (Offset); i++) {  Serial.print(" ");  }
//      }
//  Serial.print("Z");
//
//
//  Serial.print("  <-- #1  |  #2 -->  ");
//
//
//  //graph Z2 value:
//  if (Z2value > 0) {
//      for(int i = 0; i < (Offset); i++) {  Serial.print(" ");  }
//      for(int i = 0; i < (Z2value/Scaling); i++) {  Serial.print("|");  }
//      for(int i = 0; i < (Offset - Z2value/Scaling); i++) {  Serial.print(" ");  }
//      }
//  else { 
//      for(int i = 0; i < (Offset + Z2value/Scaling); i++) {  Serial.print(" ");  }
//      for(int i = 0; i < (-Z2value/Scaling); i++) {  Serial.print("-");  }
//      for(int i = 0; i < (Offset); i++) {  Serial.print(" ");  }
//      }
//
//
// 
//  //print a linefeed:
//  Serial.println();
  
  
  
  // delay before next reading:
  delay(100);
}

