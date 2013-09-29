/*
 The circuit:
 analog 0: accelerometer self test
 analog 1: z-axis
 analog 2: y-axis
 analog 3: x-axis

Script sends accelerometer output over serial to Software. Used for game. 
Fall 2013
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

int sensorX1Min = 1023;
int sensorX1Max = 0;

int sensorX2Min = 1023;
int sensorX2Max = 0;

int sensorZ1Min = 1023;
int sensorZ1Max = 0;

int sensorZ2Min = 1023;
int sensorZ2Max = 0;

void setup()
{
  
  // turn on LED to signal the start of the calibration period:
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);

  // calibrate during the first five seconds 
  while (millis() < 5000) {
    //sensorValue = analogRead(sensorPin);
  X1value = analogRead(X1pin);
  Y1value = analogRead(Y1pin);
  Z1value = analogRead(Z1pin);
  
  X2value = analogRead(X2pin);
  Y2value = analogRead(Y2pin);
  Z2value = analogRead(Z2pin);


    // record the maximum x1 value
    if (X1value > sensorX1Max) {
      sensorX1Max = X1value;
    }

    // record the minimum x1 value
    if (X1value < sensorX1Min) {
      sensorX1Min = X1value;
    }
    
        // record the maximum x2 value
    if (X2value > sensorX2Max) {
      sensorX2Max = X2value;
    }

    // record the minimum x2 value
    if (X2value < sensorX2Min) {
      sensorX2Min = X2value;
    }


    // record the maximum x1 value
    if (Z1value > sensorZ1Max) {
      sensorZ1Max = Z1value;
    }

    // record the minimum x1 value
    if (Z1value < sensorZ1Min) {
      sensorZ1Min = Z1value;
    }
    
        // record the maximum x2 value
    if (Z2value > sensorZ2Max) {
      sensorZ2Max = Z2value;
    }

    // record the minimum x2 value
    if (Z2value < sensorZ2Min) {
      sensorZ2Min = Z2value;
    }


    
  }

  // signal the end of the calibration period
  digitalWrite(13, LOW);
  
  // initialize the serial communications:
  Serial.begin(9600);
}



void loop()
{
 
  //Gather Sensor Data;
  //Note: at 1G, values will range from -69 to +69 around these centerpoints.
  //Reasonable tilt angles will range from about -45 to +45, but use 50 to be safe.
  X1value = analogRead(X1pin);
  Y1value = analogRead(Y1pin);
  Z1value = analogRead(Z1pin);
  
  X2value = analogRead(X2pin);
  Y2value = analogRead(Y2pin);
  Z2value = analogRead(Z2pin);

  // apply the calibration to the sensor reading
  X1value = map(X1value, sensorX1Min, sensorX1Max, 0, 255);

  // in case the sensor value is outside the range seen during calibration
  X1value = constrain(X1value, 0, 255);
  
  // apply the calibration to the sensor reading
  X2value = map(X2value, sensorX2Min, sensorX2Max, 0, 255);

  // in case the sensor value is outside the range seen during calibration
  X2value = constrain(X2value, 0, 255);

//  // apply the calibration to the sensor reading
//  Z1value = map(Z1value, sensorZ1Min, sensorZ1Max, 0, 255);
//
//  // in case the sensor value is outside the range seen during calibration
//  Z1value = constrain(Z1value, 0, 255);

  // fade the LED using the calibrated value:
  analogWrite(13, X2value);

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
  
  
  Serial.print(X1value);
  Serial.print('|');
  Serial.print(Y1value);
  Serial.print(':');
  Serial.println(Z2value);
  
  
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
//  delay(100);
}

