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

void setup()
{
  // initialize the serial communications:
  Serial.begin(9600);
}



void loop()
{
 
  //Gather Sensor Data;
  X1value = analogRead(X1pin);
  Y1value = analogRead(Y1pin);
  Z1value = analogRead(Z1pin);
  
  X2value = analogRead(X2pin);
  Y2value = analogRead(Y2pin);
  Z2value = analogRead(Z2pin);

  
  
  //Graph bars:
  for(int i = 0; i < (X1value/20); i++) {
      Serial.print("|");
      }
  for(int i = 0; i < (30 - X1value/20); i++) {
      Serial.print(" ");
      }

  for(int i = 0; i < (Y1value/20); i++) {
      Serial.print("|");
      }
  for(int i = 0; i < (30 - Y1value/20); i++) {
      Serial.print(" ");
      }

  for(int i = 0; i < (Z1value/20); i++) {
      Serial.print("|");
      }
  for(int i = 0; i < (30 - Z1value/20); i++) {
      Serial.print(" ");
      }


  Serial.print("  <--sensor 1  |  sensor 2 -->       ");


  for(int i = 0; i < (X2value/20); i++) {
      Serial.print("|");
      }
  for(int i = 0; i < (30 - X2value/20); i++) {
      Serial.print(" ");
      }

  for(int i = 0; i < (Y2value/20); i++) {
      Serial.print("|");
      }
  for(int i = 0; i < (30 - Y2value/20); i++) {
      Serial.print(" ");
      }

  for(int i = 0; i < (Z2value/20); i++) {
      Serial.print("|");
      }
  for(int i = 0; i < (30 - Z2value/20); i++) {
      Serial.print(" ");
      }

 
  //print a linefeed:
  Serial.println();
  
  
  
  // delay before next reading:
  delay(100);
}

