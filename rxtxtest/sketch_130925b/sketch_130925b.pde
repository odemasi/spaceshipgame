import processing.serial.*;

Serial g_port;

void setup() 
{
  size(480, 120);

  // This is the serial port that the Arduino opens  
  g_port = new Serial(this, "/dev/tty.usbmodem1421", 9600);
  g_port.bufferUntil('\n'); 
}

void draw() 
{
  // Nothing going on yet
}
