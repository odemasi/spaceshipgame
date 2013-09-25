// these constants describe the pins. They won't change:
const int X1pin = A0;                  // x-axis sensor 1
const int Y1pin = A1;                  // y-axis sensor 1
const int Z1pin = A2;                  // z-axis sensor 1

const int X2pin = A3;                  // x-axis sensor 2
const int Y2pin = A4;                  // y-axis sensor 2
const int Z2pin = A5;                  // z-axis sensor 2



void setup()
{
  // initialize the serial communications:
  Serial.begin(9600);
}




void loop()
{
  // print the sensor values:
      Serial.print(analogRead(X1pin));
      Serial.print("\t");    // this prints a tab between values
      Serial.print(analogRead(Y1pin));
      Serial.print("\t");    // this prints a tab between values
      Serial.print(analogRead(Z1pin));
      Serial.print("\t");    // this prints a tab between values
      Serial.print("\t");    // this prints a tab between values
      
      Serial.print(analogRead(X2pin));
      Serial.print("\t");    // this prints a tab between values
      Serial.print(analogRead(Y2pin));
      Serial.print("\t");    // this prints a tab between values
      Serial.print(analogRead(Z2pin));
      Serial.println();      // this prints a linefeed

  // delay before next reading:
  delay(100);
}

