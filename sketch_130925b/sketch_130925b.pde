import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import processing.serial.*;

// The serial port:
Serial myPort;

Block[] blocks = new Block[500];
GameSynth synth = new GameSynth(this);
boolean blasted=false;
int blastcount=0;
boolean pset=false;
class Stage
{
  public String message;
  public color skyColor;
  public int scoreNeeded;
  public float startingSpeed;
  public int numBlocks;
  public int ammoUps;

  public void initialize()
  {
    ammoColor = color(random(180, 255), random(0, 80), random(80, 180));
    scoreColor = color(random(0, 80), random(30, 120), random(150, 255));
    completeColor = color(random(255), random(255), random(255));//for the progress bar
    incompleteColor = color(random(255), random(255), random(255));//for the progress bar
    msgColor = color(random(200, 255), random(0, 80), random(0, 80));
    mountainColor = color(random(5, 250));
    triangleHeight = random(.5, 10);

//    msg("LEVEL: "+lvl+"\n"+message, 50);
    speed = startingSpeed;
    ammo = max(ammo, 3);

    for (int n=0;n<numBlocks;n++)//for each block
      blocks[n] = new Block(color(random(255), random(255), random(255)));//creates the blocks with random color
    for (int n=numBlocks;n<numBlocks+ammoUps;n++)
      blocks[n] = new AmmoUp(color(255, 0, 0, 100));//creates the boosts
    for (int n=numBlocks+ammoUps;n<blocks.length;n++)
      blocks[n] = null;//clears the rest of the array
  }
}

Stage[] level = new Stage[7];//how many stages there are in the game plus 2?
//
color groundColor;
color ammoColor;
color scoreColor;
color completeColor;//for the progress bar
color incompleteColor;//for the progress bar
color msgColor;
color mountainColor;

int lives;
int[] mntRnd;
final float startingRadius = 2;//the size of stuff when it appears
int ammo;
final int ptsPerPad = 100;//the number of pts recieved for each booster pad
float speed;
final int shipWidth = 50;
int centerX;//the X value of the center of the screen
int centerY;//the Y value of the center of the screen
int score;//your total score
int lvl;//the current level
final int textY = 40;//the Y value of all the info at the top of the screen
String msg;
int msgTime;//the duration of the message
float triangleHeight;
PImage shipimg;
String sketchdir = "/Users/odemasi/Dropbox/Courses/cs294-Bjoern/hw3/Slalom2D_May_12_10/";
//
void crash()//if you died
{
  lives--;
//  synth.boom(0);//OAD
//  synth.pw.acycling=4; //OAD
  synth.square2.acycling=4;
  pset=false;
  delay(1000);//waits a second
  msg("Score: "+score, 30);//shows your score
  score = level[lvl].scoreNeeded;//resets your score
  level[lvl].initialize();//resets the level

  if (lives<0)
  {
    setup();
    lvl = 0;
  }
}


void setup()
{
  size(480, 120);
  println(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, "/dev/tty.usbserial-AM01QMOX", 9600);
  myPort.bufferUntil(10);

  //import data
  frameRate(40);
  String[] dirarray = {sketchdir, "data/Spaceship.jpg"};
  shipimg = loadImage(join(dirarray, ""));

  //game setup
  lives = 2;
  mntRnd = new int[100];
  ammo = 3;
  score = -200;
  lvl = 0;

  //mountains
  for (int n=0;n<100;n++)
    mntRnd[n] = (int)random(100);
//  synth.comp.setLevel(0.7); // OAD I took this out. Is the problem with compmanderFiler class? 
  // always start Minim first
  //  minim = new Minim(this); 
  // load a file into an AudioSnippet
  // it must be in this sketches data folder
  //song = minim.loadFile("song.mp3",512);/********************************************************/
  //song.play();

  // The font must be located in the sketch's
  // "data" directory to load successfully
  PFont font = createFont("Serif", 48);//loadFont("Monospaced-48.vlw"); 
  textFont(font);
  //  textFont(loadFont("Bauhaus93-48.vlw"));
//
  size(800, 500);
  centerX = width/2;



  smooth();
  cursor(CROSS);//makes the mouse arrow into a cross-hairs

  for (int n=0;n<level.length;n++)
    level[n] = new Stage();

  level[0].message = "Slalom, by Rafael Cosman";
  level[0].skyColor = color(255, 200, 200);
  level[0].scoreNeeded = 0;
  level[0].startingSpeed = 5.5;
  level[0].numBlocks = 0;
  level[0].ammoUps = 0;

  //LEVEL 1
  level[1].message = "Just dodge.";
  level[1].skyColor = color(255, 200, 200);
  level[1].scoreNeeded = 0;
  level[1].startingSpeed = 5.5;
  level[1].numBlocks = 30;
  level[1].ammoUps = 0;

  //LEVEL 2
  level[2].message = "Click to shoot!";
  level[2].skyColor = color(0, 0, 255);
  level[2].scoreNeeded = 500;
  level[2].startingSpeed = 3.5;
  level[2].numBlocks = 120;
  level[2].ammoUps = 10;

  //LEVEL 3
  level[3].message = "Ready to go FAST?";
  level[3].skyColor = color(200, 20, 80);
  level[3].scoreNeeded = 2500;
  level[3].startingSpeed = 7;
  level[3].numBlocks = 30;
  level[3].ammoUps = 5;

  //LEVEL 4
  level[4].message = "You still alive?";
  level[4].skyColor = color(0);
  level[4].scoreNeeded = 5000;
  level[4].startingSpeed = 6;
  level[4].numBlocks = 130;
  level[4].ammoUps = 10;

  //LEVEL 5
  level[5].message = "LAST LEVEL!";
  level[5].skyColor = color(255, 200, 200);
  level[5].scoreNeeded = 7000;
  level[5].startingSpeed = 10;
  level[5].numBlocks = 30;
  level[5].ammoUps = 5;

  //WIN!!!
  level[6].message = "YOU WIN!!!";
  level[6].scoreNeeded = 10000;//score needed to win the game

  level[0].initialize();
  println("setup is done");
}

void msg(String message, int time)
{
  msg = message;
  msgTime = time;
}

void showIntro()
{
  msg("Slalom, by Rafael Cosman", 2);
  if (mousePressed)
    score=0;
}
//
//void showSoundCredit()
//{
//  msg("Sound By Chris Ball", 2);
//  //  if(mousePressed)
//  //    score=0;
//}
void showGround()
{
  fill(groundColor);
  rect(-width, centerY, width*3, height);
}
//
void showMountains()
{  
  fill(mountainColor);
  int mntNum=0;
  for (int d=-width;d<width;d+=mntRnd[mntNum])
  {
    mntNum++;
    triangle(centerX+d, centerY, centerX+2*d, centerY-2*abs(d), centerX+4*d, centerY);
  }
}
//
void showBlocks()
{
//  for (int n=0;blocks[n]!=null;n++)//for each block
//    blocks[n].move();

  float increment = 2;

  for (int size=0;size<height*2;size+=increment)//for each size
    for (int n=0;blocks[n]!=null;n++)//for each block
      if (blocks[n].r > size && blocks[n].r <= size+increment)//if the radius is inbetween size and size+decrement
          blocks[n].act();
}
//
//void showMsg()
//{
//  textAlign(CENTER);
//  fill(msgColor);
//  float msgY = centerY+msgTime*2;
//  if (msgTime>0)
//    text(msg, centerX, msgY);
//  msgTime--;
//}
//
//void showShip()
//{
//  image(shipimg, 0, 0);
//  fill(100, 200, 250);
//  ellipse(centerX, height-20, shipWidth/2, shipWidth/2);
//  line(centerX-shipWidth/2, height-5, centerX-shipWidth/3, height-50);
//  line(centerX+shipWidth/2, height-5, centerX+shipWidth/3, height-50);
//  fill(200, 200, 60);
//  ellipse(centerX, height-20, shipWidth, 5);
//  line(centerX, height-20, centerX, height-80);
//  fill(100, 200, 200);
//  ellipse(centerX, height-80, 5, 5);
//  fill(255, 0, 0);
//  triangle(centerX-shipWidth/3+3, height-50, centerX-shipWidth/3-3, height-50, centerX-shipWidth/3+2, height-60);
//  triangle(centerX+shipWidth/3+3, height-50, centerX+shipWidth/3-3, height-50, centerX+shipWidth/3-2, height-60);
//}
//
//void showAmmo()
//{
//  textAlign(LEFT);
//  int ammoSize = 25;
//  fill(ammoColor);//the color of the ammo
//  if (ammo<=0)
//    text("NO ammo!", 0, textY);
//  else if (ammo>=5)//5 is the max ammo
//    text("MAX ammo", 0, textY);
//  else
//    for (int a=ammo;a>0;a--)//for each ammo
//      ellipse(2*a*ammoSize, textY-ammoSize/2, ammoSize, ammoSize);//shows how much ammo you have
//}
//
//void showStats()
//{
//  showAmmo();  
//  showBar();
//  showLives();
//
//  fill(scoreColor);//the color of the text
//  textAlign(RIGHT);
//  text(nf(score, 5)+" pts", width, textY);//shows the score
//
//  fill(speed*20, 255-speed*20, 100-speed*20);//goes from green to orange to red
//  if (speed>10)
//    fill((score*20)%255, 0, 0);//flashes red/black
//  textAlign(CENTER);
//  text("Mach "+nfc(speed, 2), width/2, textY);//show the speed
//}
//
//void showBar()
//{
//  int barTop = textY+20;
//  int barHeight = height-textY-60;
//  int barX = width-60;
//  fill(incompleteColor);
//  rect(barX, barTop, 30, barHeight);
//
//  if (lvl+1<level.length)//if you haven't won already
//  {
//    float h = map(score, level[lvl].scoreNeeded, level[lvl+1].scoreNeeded, barHeight+barTop, barTop);
//    fill(completeColor);
//    rect(barX, h, 30, barHeight-h+60);
//  }
//}
//
//void showLives()
//{
//  textAlign(LEFT);
//  fill(255-lives*80, lives*80, 0);
//  if (lives>0)
//    text("Lives: "+lives, 20, height);
//  else
//    text("Lives: "+lives+"!", 20, height);
//}
//
void efx()
{
  //adds a slight tint when you go fast
  fill(255, 0, 0, speed*2);
  rect(0, 0, width, height);

  //shakes the screen when you go fast
  float shake = speed/3;
  if (speed>10)
    centerY+=random(-shake, shake);
}

void draw()
{
  if (myPort.available() > 1) {
//    int inByte = myPort.read();
    println(myPort.readString());
//    Integer state = myPort.read();
//    println(state);
//    msg(state.toString(), 2);
  };
//
  synth.update();
  if (mouseX < 0)
    mouseX = 0;
  if (mouseX > width-100)
    mouseX = width-100;

  centerY = height-(mouseY+height/2)/2;
  centerX += (mouseX-centerX)/50;

  efx();

//  pushMatrix();//stores the settings //OAD
  float angle = ((float)mouseX-centerX)/width;
  rotate(angle);
  translate(0, -sin(angle)/2*width);
  if (lvl<level.length-1&&score>level[lvl+1].scoreNeeded)//if you beat the stage
  {
    groundColor = color(random(0, 200), random(50, 255), random(0, 200));
    lvl++;//go to the next level
    lives++;
    level[lvl].initialize();//begin the level
  }
  background(level[lvl].skyColor);
  showGround();
  showMountains();
  showBlocks();  
//  showMsg();
//  showShip();  
  if (score<=0)
    if (score<(-70)) {
      showIntro();
    }
  else {
//    showSoundCredit();
  }
//  popMatrix();//restores the previous settings //OAD
//  showStats();
//
//  speed*=1.0008;//increases the speed
//  score++;//gives you pts for survivng
//  if (score>0) {
//    if (!pset) {
//      synth.paranoids1((int)round(speed*2));
//      pset=true;
//    }
//    else {
//      synth.pw.SETFreq((55+speed*2)/1.25);
//      synth.square2.SETFreq((55+speed*2)/1.25);
//      if (speed>10) {
//        synth.pw.setLFO(10+speed, 1.0);
//        synth.square2.setLFO(13+speed, 1.0);
//      }
//      else {
//        synth.pw.setLFO(speed, 0.3);
//        synth.square2.setLFO(3.0+speed, 0.3);
//      }
//    }
//    synth.comp.setLP(constrain(900-speed*100-score*3, 20, 300));
//  };
//  if (blastcount>0) {
//    blastcount--;
//    if (blastcount==0) {
//      blasted=false;
//    }
//  }
}

//void stop() {
//  synth.stop();
//  super.stop();
//}

