public class Block
{
  protected int x;//the X value of the CENTER of the block
  public float r;//the side length of the block
  protected color c;//the color of the block
//
  public Block(color c)
  {
    makeNew(c);
  }
//
  private void makeNew(color fillColor)//create a new block
  {
    x = (int)random(width);
    r = startingRadius;
    c = fillColor;
//    blasted=false;
  }
//
  public void act()
  {
    if(r*2>=height&&x+r>centerX-shipWidth/2&&x-r<centerX+shipWidth/2)//if you crashed into the block
      crash();

    else if(x-r>width||x+r<0||r*2>height)//if the block leaves the screen
      makeNew(c);

    fill(c);
    triangle(x-r, centerY+r, x, centerY-triangleHeight*r, x+r, centerY+r);//draws the block to the screen

    if(mousePressed&&get(mouseX,mouseY)==c && !blasted)//if you shoot the block //OAD
      shot();//OAD
  }
//
  public void move()
  {
    r+=r*speed/100;
    x+=(x-mouseX)*speed/100;

  }

  private void shot()
  {
    if(ammo<=0)
    {
      msg("NO AMMO!",20);
      synth.bubble(4);
      return;
    }


    ammo--;
blasted=true;
blastcount=3;
synth.zapB(5);
    makeNew(c);
    if(2*r>height-400)
      msg("Close one!",8);
    else
      msg("Good shot!",7);
  }
}
