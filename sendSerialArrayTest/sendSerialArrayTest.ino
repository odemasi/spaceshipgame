/*
This is a test code. It sends a constant vector of integers (1,2,3) 
from the Arduio over serial. It seemed possible to read this into Processing with 
int myX = 0;
int myY = 0;
int myZ = 0;

void serialEvent(Serial p){
  String inString;
  try{
    inString = (myPort.readString());
    myX = xValue(inString);
    myY = yValue(inString);
    myZ = zValue(inString);
  }catch(Exception e){
   println(e);
  }
  redraw();
}
int xValue(String inString){
  int pipeIndex = inString.indexOf('|');
  return int(inString.substring(0,pipeIndex));
}
int yValue(String inString){
  int pipeIndex = inString.indexOf('|');
  int colonIndex = inString.indexOf(':');
  return int(inString.substring(pipeIndex+1, colonIndex)); 
}
int zValue(String inString){
  int colonIndex = inString.indexOf(':');
  return int(inString.substring(colonIndex + 1, inString.length() - 2));
}

*/

#define X_AXIS 0
#define Y_AXIS 1
#define Z_AXIS 2
 
void setup() {
  Serial.begin(9600); 
}
 
void loop() {
  int x = 1;//analogRead(X_AXIS);
  int y = 2;//analogRead(Y_AXIS);
  int z = 3;//analogRead(Z_AXIS);
 
  Serial.print(x);
  Serial.print('|');
  Serial.print(y);
  Serial.print(':');
  Serial.println(z);
} 
