

public class bitNoise extends OscillatorLFOADSR
{
  float filterMush = 0.0;
float nse = 0.0;
  public bitNoise(float frequency, float amplitude, float sampleRate)
  {
    super(frequency, amplitude, sampleRate);

  }
 
   protected float value(float step)
   {
updateLFO();
if(round((step*100))%64==0){
 nse = (random(10.)-5.0)/10.; 
}



     filterMush = (nse*tremLFO*gain);

      return (filterMush);
   }
}


public class bitNoise2 extends OscillatorLFOADSR
{
  float filterMush = 0.0;
float nse = 0.0;
  public bitNoise2(float frequency, float amplitude, float sampleRate)
  {
    super(frequency, amplitude, sampleRate);
  }
   protected float value(float step)
   {
     
     
updateLFO();
if(round((step))%4==0){
 nse = (random(10.)-5.0)/10.; 
}
   filterMush = (nse*tremLFO*gain);
      return (filterMush);
   }
}


public class bitNoiseBP extends OscillatorLFOADSR
{
  float filterMush = 0.0;
float nse = 0.0;
float freq=200.0;
float lowPass=0.0;
float hiPass =0.0;
//int numPass = 4;
//lowPass.length;
float sine=0.0;
  public bitNoiseBP(float frequency, float amplitude, float sampleRate)
  {
    super(frequency, amplitude, sampleRate);
  }
   protected float value(float step)
   {
     
     freq = 44100/this.frequency();
updateLFO();
//if(((step))%0.1==0){
 nse = (random(100.)-50.0)/50.; 
//}
sine= (sin(step)*0.02);
lowPass = (lowPass*(freq*1.03) +nse +sine )/ (freq*1.03+1);

hiPass = ((hiPass*(freq*0.97) +nse+sine )/ (freq*0.97+1));

   filterMush = (hiPass-lowPass)*80.  ;
      return (filterMush*tremLFO*gain);
   }
}
