//public class SquareMush extends OscillatorLFOADSR
//{
//  float filterMush = 0.0;
//  float a =0.0;  float b =0.0;
//  float detuna=0.0;float last =0.0;
//  public SquareMush(float frequency, float amplitude, float sampleRate)
//  {
//    //filterMush = 0.0;
//   // a=0.0;
//    super(frequency, amplitude, sampleRate);
//    //detuna = 0.0;last=0.0;
//  }
// 
//   protected float value(float step)
//   {
//     if(step>0.5){a=0.5;}else{a=(-0.5);}
//     detuna =detuna+((step-last)*1.8);
//
//     last=step;
//          if((detuna)>0.55 ||(detuna>0.0 && detuna<0.05)){b=0.3;}else{b=(-0.3);}
//     filterMush = (2*filterMush + (a+b))/3.;
//
//      return (filterMush);
//   }
//}
//
public class SquareZap extends OscillatorLFOADSR
{
  float filterMush = 0.0;
  float a =0.0;  float b =0.0;
  float detuna=0.0;float last =0.0;
  float freqy;
  float amp;float zamp;
  public SquareZap(float frequency, float amplitude, float sampleRate)
  {
    //filterMush = 0.0;
   // a=0.0;

    super(frequency, amplitude, sampleRate);
    freqy=frequency;amp =amplitude;
    this.noPortamento();
    //detuna = 0.0;last=0.0;
  }
 
   protected float value(float step)
   {
     if(step>0.5){a=0.5;}else{a=(-0.5);}
     detuna =detuna+((step-last)*1.8);

     last=step;
          if((detuna)>0.55 ||(detuna>0.0 && detuna<0.05)){b=0.3;}else{b=(-0.3);}
     filterMush = (4*filterMush + ((a+b)*amp))/5.;
if(freqy>80){freqy *=0.9996;}else{amp *=0.9;}
if(amp>0.0){amp -= 0.0001;}
//if(zamp>0.0){zamp -= 0.00095;}else{zamp=amp;}
this.setFreq(freqy);//this.setAmp(amp);
      return (filterMush);
   }
}


public class SquareHat extends OscillatorLFOADSR
{
  float filterMush = 0.0;
  float a =0.0;  float b =0.0;
  float detuna=0.0;float last =0.0;
  public SquareHat(float frequency, float amplitude, float sampleRate)
  {

    super(frequency, amplitude, sampleRate);

  }
 
   protected float value(float step)
   {
           updateLFO();

     if(step>0.5){a=0.5;}else{a=(-0.5);}
     detuna =detuna+((step-last)*1.8);//detuna %=1.0;

     last=step;
          if((detuna)>0.75 ||(detuna>0.25 && detuna<0.5)){b=0.5;}else{b=(-0.5);}
     filterMush = (5*filterMush + ((a+b)*tremLFO*gain))/6.;

      return (filterMush);
   }
}
//
public class SquareTriangle extends OscillatorLFOADSR
{
  float filterMush = 0.0;
  float a =0.0;  float b =0.0;
  float detuna=0.0;float last =0.0;
  public SquareTriangle(float frequency, float amplitude, float sampleRate)
  {
    //filterMush = 0.0;
   // a=0.0;
    super(frequency, amplitude, sampleRate);
    //detuna = 0.0;last=0.0;
  }
 
   protected float value(float step)
   {
     if(step>0.5){a=0.5;}else{a=(-0.5);}
     detuna =detuna+((step-last)*1.8);//detuna %=1.0;
 //    if(detuna>=1.0){detuna = (detuna-1.0);}
     last=step;
          if((detuna)>0.65 ||(detuna>0.04 && detuna<0.15)){b=0.5;}else{b=(-0.5);}
     filterMush = (7*filterMush + a+b)/8.;
      //   if(detuna>=1.0){detuna = (detuna-1.0);}
      updateLFO();
      return (filterMush*gain*tremLFO);
   }
}


public class SquareSpike extends OscillatorLFOADSR
{
  float filterMush = 0.0;
  float a =0.0;  float b =0.0;
  float detuna=0.0;float last =0.0;
  public SquareSpike(float frequency, float amplitude, float sampleRate)
  {
    //filterMush = 0.0;
   // a=0.0;
    super(frequency, amplitude, sampleRate);
    //detuna = 0.0;last=0.0;
  }
 
   protected float value(float step)
   {
           updateLFO();
      //     step +=(1/freqLFO);
     if(step>0.5){a=0.5;}else{a=(-0.5);}
     detuna =detuna+((step-last)*1.1);//detuna %=1.0;
 //    if(detuna>=1.0){detuna = (detuna-1.0);}
     last=step;
          if((detuna)>0.85 ||(detuna>0.35 && detuna<0.4)){b=0.5;}else{b=(-0.5);}
     filterMush = (5*filterMush + ((a+b)*tremLFO*gain))/6.;
      //   if(detuna>=1.0){detuna = (detuna-1.0);}

    //  this.setFreq(freqLFO);
      return (filterMush);
   }
}
//
//public class SquareBzerker extends OscillatorLFOADSR
//{
//  float filterMush = 0.0;
//  float subSonic=0.0;
//  float a =0.0;  float b =0.0;float c =0.0;float d=0.0;float e=0.0;
//  float detuna=0.0;float last =0.0;
//  public SquareBzerker(float frequency, float amplitude, float sampleRate)
//  {
//    //filterMush = 0.0;
//   // a=0.0;
//    super(frequency, amplitude, sampleRate);
//    //detuna = 0.0;last=0.0;
//  }
// 
//   protected float value(float step)
//   {
//           updateLFO();
//      //     step +=(1/freqLFO);
//     if(step>0.5){a=0.5;}else{a=(-0.5);}
//     detuna =((detuna)+((step-last)*(0.1+tremLFO-gain)));//detuna %=1.0;
// //    if(detuna>=1.0){detuna = (detuna-1.0);}
//     last=step;
//          if((detuna)>0.95 ||(detuna>0.25 && detuna<0.3)){b=0.5;}else{b=(-0.15);}
//          d=(abs(a-b));
//c = (a-b)*(d+0.01)/(d+0.0000001);
//e = (c)*((d+0.01)/(d+0.0000001))+(abs(d-0.1));
//     filterMush = (3*filterMush + ((e)*tremLFO*gain))/6.;
//     subSonic =(2300*subSonic + filterMush)/2301;
//           // this.setFreq(100+100*detuna);
//      //   if(detuna>=1.0){detuna = (detuna-1.0);}
//
//    //  this.setFreq(freqLFO);
//      return ( filterMush -(subSonic));
//   }
//}
//
public class SquareBoink extends OscillatorLFOADSR
{
  float filterMush = 0.0;
  float a =0.0;  float b =0.0;
  float detuna=0.0;float last =0.0;
  public SquareBoink(float frequency, float amplitude, float sampleRate)
  {
    //filterMush = 0.0;
   // a=0.0;
    super(frequency, amplitude, sampleRate);
    //detuna = 0.0;last=0.0;
  }
 
   protected float value(float step)
   {
     if(step>0.5){a=0.5;}else{a=(-0.5);}
     detuna =detuna+((step-last)*1.8);

     last=step;
          if((detuna)>0.55 ||(detuna>0.0 && detuna<0.05)){b=0.3;}else{b=(-0.3);}
     filterMush = (2*filterMush + a+b)/3.;
updateLFO();
      return (filterMush*tremLFO*gain);
   }
}


public class SquarePhase extends OscillatorLFOADSR
{
  float filterMush = 0.0;
  float a =0.0;  float b =0.0;
  float detuna=0.0;float last =0.0;
  float DCleak =0.0;
  public SquarePhase(float frequency, float amplitude, float sampleRate)
  {
    //filterMush = 0.0;
   // a=0.0;
    super(frequency, amplitude, sampleRate);
    //detuna = 0.0;last=0.0;
  }
 
   protected float value(float step)
   {
     if((step>0.5)&&(step<0.85) ){a=0.5;}else{a=(-0.2);}
     detune =detune+(this.frequency()/44100);
detune %= 0.9991-(gain/50.);
   //  theLast=step;
          if((detune > 0.5)&&(detune < 0.85) ){b=-0.5;}else{b=(0.2);}
     filterMush = ((2*filterMush + a+b)/3.)*tremLFO;
     DCleak = ((2000*DCleak) +filterMush)/2001;
updateLFO();
      return ((filterMush-DCleak)*gain*3.0);
   }
}
