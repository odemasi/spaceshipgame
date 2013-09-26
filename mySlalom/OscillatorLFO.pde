//public class OscillatorLFO extends Oscillator{
//  float tremLFO = 1.0; 
//  float gain = 1.0;
//  float tremRate = 0.00;
//  float tremCount = 0.0;
//  float tremDepth=0.0;
//  float freqLFO = 0.0; 
//  float freqRate = 0.0;
//  float freqCount = 0.0;
//  float freqDepth=0.0;
//  float val;
//  int trigger=0;
//  int cycling=0; 
//  float attack=0.01;
//  float release = 0.5;
//  float att = 0.0; 
//  float rel = 0.5;
//  float freqEnv=0.;
//  boolean enveloped = false;
//  float detune=0.0;
//  float theLast =0.0;
//  float upperFreq = 200;
//  float lowerFreq=80;
//  float freqRange=120;
//  float[] blips;
//  float blipRate =0.; 
//  int blipLoops = 0; 
//  int numBlips =0; 
//  boolean blipped =false;
//  float blipPeriod = 0.;
//  float blipCount=0.;
//  int currBlip = 0;
//  OscillatorLFO(float frequency, float amplitude, float sampleRate){
//
//    super(frequency, amplitude, sampleRate);
//    this.noPortamento();
//  } 
//  protected float value(float step){
//    return(0.0); 
//  }
//  void updateLFO(){
//    this.noPortamento();
//
//    tremCount = (tremCount + tremRate)%360.;
//    freqCount = (freqCount + freqRate)%360.;
//    //   if(tremCount>360){tremCount-=360;}
//
//    tremLFO = abs(sin(radians(tremCount))*tremDepth+1.0)/2.0;
//
//    //  if(freqRate!=0){
//    freqLFO = abs(sin(radians(freqCount))*freqDepth+1.0)/2.0;
//    //  *freqRange)+lowerFreq,20,100000);
//
//    //  }else{freqLFO=lowerFreq;}
//    //    setFreq(freqLFO);
//    // val = super.value(step);
//    //     this.setAmp(tremLFO);
//    if(trigger==1){
//      //println("ARtrig");
//      cycling = 1;
//      att = 0; 
//      trigger=0;
//    }
//    if(cycling ==1){
//      if(att<1.0){
//        att += (0.0001/attack);
//        rel=att;
//      } 
//      else{
//        cycling=0;
//        rel=att;
//      }
//    }
//    else{
//      // rel -= (0.0001/release);
//      rel /= (1+(0.0001/release)*(1+(rel/5)));
//      if(rel<0){
//        rel=0.0;
//      }
//    }
//    if(enveloped){
//      gain = rel; 
//    }
//    //  if(freqRate != 0.){
//    this.setFreq(lowerFreq+(freqRange*freqLFO)+freqEnv);
//    //}
//    //if((gain+tremLFO)>0.9){tremLFO -= abs(tremLFO-gain);}
//    //if((gain+tremLFO)<0.){tremLFO += abs(gain+tremLFO);}
//
//  }//updateLFO
//
//  void setLFO(float rate, float depth){
//    tremRate=rate/100;
//    tremDepth = depth;
//  }
//  void setFreqLFO(float rate, float depth, float lower,float upper){
//    freqRate=rate/100;
//    freqDepth = depth;
//    upperFreq = upper;
//    lowerFreq = lower;
//    if(lowerFreq<40){
//      lowerFreq=40; 
//    }
//    if(upperFreq>7000){
//      upperFreq=7000;
//    }
//    freqRange = upperFreq-lowerFreq;
//  }
//
//  void setFreqLFO(float rate, float depth){
//    SETFreq(this.frequency());
//    freqRate=rate/100;
//    freqDepth = depth;
//    upperFreq = lowerFreq*1.65;
//    lowerFreq = lowerFreq*0.95;
//    freqRange = upperFreq-lowerFreq;
//
//  }
//  void trigger(){
//    trigger = 1;
//    enveloped = true; 
//    freqCount=0; tremCount=0;
//  }
//  void setEnv(float thAttack,float thRelease){
//    attack = thAttack;
//    release=thRelease; 
//    enveloped=true;
//  }
//
//  void SETFreq(float thFreq){
//    lowerFreq=thFreq;
//    freqRange=0;
//    freqDepth=0;
//    this.setFreq(thFreq);
//  }
//    void resetFreq(float thFreq){
//      tremDepth=0.0;
//      tremCount=0.0;
//      tremRate=0.0;
//      
//      freqCount=0.0;
//      freqDepth=0.0;
//      freqRate=0.0;
// //     this.stopBlip();
//  //    ampEnveloped=false;
//  //    freqEnveloped=false;
//  cycling =0;
//  blipped=false;
//  enveloped=false;
//  this.noPortamento();
//    lowerFreq=thFreq;
//    freqRange=0;
//    freqDepth=0;
//    this.setFreq(thFreq);
//  }
//}//class
//
//
//
//public class OscillatorLFOADSR extends OscillatorLFO{
//  float freqA = 0.0; 
//  float freqD = 0.0; 
//  float freqS = 0.0;
//  float freqR=0.0;
//  float fenv=100;
//  float freqMin=100.;
//  float freqMax=200;
//  float freqSus=180;
//  float startFreq=100;
//  float susCount=0;
//  float envCount=0;
//  int fcycling=0;
//  int ftrigger=0;
//  boolean freqEnveloped=false;
//
//  float ampA = 0.0; 
//  float ampD = 0.0; 
//  float ampS = 0.0;
//  float ampR=0.0;
//  float ampEnv=100;
//  float ampMin=0.;
//  float ampMax=1.;
//  float ampSus=0.7;
//  float startAmp=0.0;
//  float ampSusCount=0;
//  float ampEnvCount=0;
//  int acycling=0;
//  int atrigger=0;
//  boolean ampEnveloped = false;
//int freqLoops=0;int ampLoops=0;
//
//
//  OscillatorLFOADSR(float frequency, float amplitude, float sampleRate){
//
//    super(frequency, amplitude, sampleRate);
//    this.SETFreq(frequency);
//  } 
//  protected float value(float step){
//    return(0.0); 
//  }
//
//
//
//
//  void updateLFO(){
//        blupdate();
//    super.updateLFO();
//    if(freqEnveloped){
//
//      // freqRate=0;
//      if(ftrigger==1){
//        fenv = startFreq;
//        //    this.setFreq(fenv);
//        fcycling=1;  
//        ftrigger=0;
//
//      }
//      if(fcycling==1){
//        envCount = envCount+0.00005;
//        //   fenv = fenv +(0.005/freqA);
//        fenv = fenv+((freqMax-startFreq)/(freqA/0.00005));
//        if(envCount>freqA){
//          fenv=freqMax;
//          fcycling=2;
//          envCount=0;
//
//        } 
//      }
//      if(fcycling==2){
//        envCount = envCount+0.00005;
//        fenv = fenv+((freqSus-freqMax)/(freqD/0.00005));
//        // fenv = fenv -(0.005/freqD);
//        if(envCount>freqD){
//          fenv=freqSus;
//          fcycling=3;
//          envCount=0.;
//        } 
//      }
//      if(fcycling==3){
//        susCount = susCount +0.00005;
//        if(susCount>=freqS){
//          //        //println(fenv);
//          //        println(freqEnv);
//          //        println(freqLFO);
//          //        println(freqLFO+freqEnv);
//          //        println(this.frequency());
//          susCount=0;
//          fcycling=4;
//          envCount=0.;
//        } 
//      }
//      if(fcycling==4){
//        envCount = envCount+0.00005;
//        fenv = fenv+((freqMin-freqSus)/(freqR/0.00005));
//        //    fenv = fenv -(0.005/freqR);
//        if(envCount>freqR){
//          //   fenv=freqMin;
//          fcycling=0;
//          envCount=0;
//          if(freqLoops>0){
//           freqLoops--;
//          ftrigger=1; 
//          }
//        } 
//      }
//      //this.setFreq(fenv);
//      freqEnv=fenv;
//    }
//
//
//
//
//    if(ampEnveloped){
//
//      if(atrigger==1){
//        ampEnv = startAmp;
//        gain=constrain(ampEnv,0.0,0.95);
//        acycling=1;  
//        atrigger=0;
//
//      }
//      if(acycling==1){
//
//        ampEnvCount = ampEnvCount+0.00005;
//        ampEnv = ampEnv+((ampMax-startAmp)/(ampA/0.00005));
//        if(ampEnvCount>ampA){
//          ampEnv=ampMax;
//          acycling=2;
//          ampEnvCount=0;
//
//        } 
//      }
//      if(acycling==2){
//        ampEnvCount = ampEnvCount+0.00005;
//        ampEnv = ampEnv+((ampSus-ampMax)/(ampD/0.00005));
//        if(ampEnvCount>ampD){
//          ampEnv=ampSus;
//          acycling=3;
//          ampEnvCount=0.;
//        } 
//      }
//      if(acycling==3){
//        ampSusCount = ampSusCount +0.00005;
//        if(ampSusCount>=ampS){
//          ampSusCount=0;
//          acycling=4;
//          ampEnvCount=0.;
//        } 
//      }
//      if(acycling==4){
//        ampEnvCount = ampEnvCount+0.00005;
//        ampEnv = ampEnv+((ampMin-ampSus)/(ampR/0.00005));
//        if(ampEnvCount>ampR || ampEnv<0.00000001){
//
//          ampEnv=0.0;
//          acycling=0;
//          ampEnvCount=0;
//          ampSusCount=0;
//                    ampLoops--;
//                    if(ampLoops>0){
// 
//          atrigger=1; 
//          }else{
//           ampEnveloped=false;
//        //  ampEnv=0.0;
//        ampLoops=0;
//         acycling=0; 
//         this.resetFreq(this.frequency());
//       //  gain=0.0;
//          }
//        } 
//      }
//      gain=constrain(ampEnv,0.0,0.95);
//    }
//  } /// update
//
//
//
//  void trigger(){
//    if(freqEnveloped){
//      ftrigger=1;
//      fenv=startFreq;
//      susCount=0;
//      envCount=0.;
//    }
//    if(ampEnveloped){
//      acycling=0;
//      ampSusCount=0;
//      ampEnvCount=0.;
//      gain=startAmp;
//      atrigger=1;
//    }
//    super.trigger(); 
//  }
//
//void sweepDown(){
//float totaltime = ampA+ampD+ampS+ampR;
//float ctrFreq=lowerFreq;
//  freqA=totaltime/3;
//  freqD=totaltime/3;
//  freqS=0.0001;
//  freqR=totaltime/2;
//  
//  
//    startFreq=ctrFreq*0.3;
//    freqMax=ctrFreq*0.1;
//    freqSus=0;
//    freqMin=ctrFreq* -(0.3);
//
//    //println((startFreq));
//    freqEnveloped=true;
// 
//}
//
//void sweepUp(){
//float totaltime = ampA+ampD+ampS+ampR;
//float ctrFreq=lowerFreq;
//  freqA=totaltime/3;
//  freqD=totaltime/3;
//  freqS=0.0001;
//  freqR=totaltime/2;
//  
//  
//    startFreq=ctrFreq*(-0.3);
//    freqMax=ctrFreq*(-0.1);
//    freqSus=0;
//    freqMin=ctrFreq* (0.3);
//
//    //println((startFreq));
//    freqEnveloped=true;
// 
//}
//void sweep(float thSweep, int thLoops){
//freqLoops = thLoops;
//if(freqLoops==0) freqLoops = 1;
//freqLoops = freqLoops*ampLoops;
//  float totaltime = (ampA+ampD+ampS+ampR)/thLoops;
//float ctrFreq=lowerFreq;
//  freqA=totaltime/3;
//  freqD=totaltime/3;
//  freqS=0.0001;
//  freqR=totaltime/2;
//  
//  
//    startFreq=constrain((ctrFreq*(-0.3)*thSweep),-ctrFreq+30,ctrFreq*4);
//    freqMax=constrain((ctrFreq*(-0.1)*thSweep),-ctrFreq+30,ctrFreq*4);
//    freqSus=0;
//    freqMin=constrain((ctrFreq* (0.3)*thSweep),-ctrFreq+30,ctrFreq*4);
//
//    //println((startFreq));
//    freqEnveloped=true;
//  if(ampLoops>0) freqLoops *= ampLoops;
//}
//void sweepAmp(float levelA, float levelB, float period, int thLoops){
//ampLoops = thLoops;
//if(thLoops==0) ampLoops = 1;
// // float totaltime = (ampA+ampD+ampS+ampR)/thLoops;
////float ctrFreq=lowerFreq;
//  ampA=0.010;
//  ampD=abs(period)+0.0001;
//  ampS=0.01;
//  ampR=0.01;
//  
//  
//    startAmp=levelA;
//    ampMax= levelA;
//    ampSus=levelB;
//     ampMin=0.0;
//    //this.setAmp(ampMax);
//    ampEnveloped=true;
//
//}
//
//  void setFreqADSR(float atta, float deca, float susa, float rela,float startf, float maxf,float sustain,float minf){
//    freqA=abs(atta)+0.0001;
//    freqD=abs(deca)+0.0001;
//    freqS=abs(susa)+0.0001;
//    freqR=abs(rela)+0.0001;
//    freqMin=minf-lowerFreq;
//
//    freqMax=maxf-lowerFreq;
//    freqSus=sustain-lowerFreq;
//    startFreq=startf-lowerFreq;
//    //println((startFreq));
//    freqEnveloped=true;
//    this.noPortamento();
//    //freqDepth=0;
//    //if(freqDepth==0.){
//    // lowerFreq=0.; 
//    //}
//
//  }//setFreq
//  void setAmpADSR(float atta, float deca, float susa, float rela,float starta, float maxa,float sustaina,float mina){
//    ampA=abs(atta)+0.0001;
//    ampD=abs(deca)+0.0001;
//    ampS=abs(susa)+0.0001;
//    ampR=abs(rela)+0.0001;
//    ampMin=mina/3;
//    ampMax=maxa/3;
//    ampSus=sustaina/3;
//    startAmp=starta/3;
//    //this.setAmp(ampMax);
//    ampEnveloped=true;
//    //this.noPortamento();
//
//  }//setAmp
//  void setAmpADSR(float atta, float deca, float susa, float rela){
//    ampA=abs(atta)+0.0001;
//    ampD=abs(deca)+0.0001;
//    ampS=abs(susa)+0.0001;
//    ampR=abs(rela)+0.0001;
//    ampMin=0.0;
//    ampMax=1.0;
//    ampSus=0.9;
//    startAmp=0.0;
//    //this.setAmp(ampMax);
//    ampEnveloped=true;
//    //this.noPortamento();
//
//  }//setAmp
//  
//  void setEnv(float atk, float rels){
//
//
//    ampEnveloped=false;
//    enveloped=true;
//    super.setEnv(atk,rels);
//  }//setEnv(float,float)
//
//  void setBlip(float[] thblips,float thblipRate, int thblipLoops){
//    //      float[] blips;float blipRate =0.; int blipLoops = 0; int numBlips =0; boolean blipped =false;
//    //  float blipPeriod = 0.;float blipCount=0.;int currBlip = 0;
//    numBlips = thblips.length;
//    blips = new float[numBlips];
//    for(int i=0;i<numBlips;i++){
//      blips[i]=thblips[i]; 
//    }
//    blipRate = thblipRate;
//    blipLoops=thblipLoops;
//    currBlip = 0;
//
//    if(blipRate>10.1){//it must be a tempo, eh?
//      blipPeriod = 44100/((blipRate/60.));//bpm?
//    }
//    else{//it must be in seconds, eh?
//      blipPeriod = 44100*blipRate;
//    }
//    blipCount=blipPeriod+0.3;
//    blipped=true;
//    this.SETFreq(blips[0]);
//blupdate();
//  }
// void blupdate(){
//    if(blipped){
//      blipCount++;//wait, does this happen every sample?
//      if(blipCount>=blipPeriod){
//        blipCount-=blipPeriod;
//        if(blips[currBlip] >40.0 ){// 0.0 == a rest. 1.0 = stacatto rest
//        lowerFreq=blips[currBlip];upperFreq=blips[currBlip]+freqRange;
//        this.trigger();
//        }else{
//         if(blips[currBlip]==1.0){ // a 'hard rest'
//         if(acycling!=0){
//          ampEnv=ampSus;acycling=4;
//         }
//         } 
//        }
//        currBlip++;
//    //    currBlip%=numBlips;
//        if(currBlip==numBlips){
//          currBlip=0;
//          blipLoops--;
//          if(blipLoops<=0){
//            blipped=false;
//          }
//        } 
//      }
//    } 
//  }
//void blipStop(){
//           if(acycling!=0){
//          ampEnv=ampSus;acycling=4;
//         }
//              blipped=false;
//}
//void blipPlay(){
//
//           //   blipped=true;
//                  blipCount=blipPeriod+0.3;
//    blipped=true;
//              //blupdate();
//}
//   void resetFreq(float thFreq){
//      tremDepth=0.0;
//      tremCount=0.0;
//      tremRate=0.0;
//      freqLoops=0;ampLoops=0;
//      freqCount=0.0;
//      freqDepth=0.0;
//      freqRate=0.0;
//      blipStop();
//      ampEnveloped=false;
//      freqEnveloped=false;
//  cycling =0;
//  blipped=false;
//  enveloped=false;
//  this.noPortamento();
//    lowerFreq=thFreq;freqEnv=0;
//    freqRange=0;
//    freqDepth=0;
//    this.setFreq(thFreq);
//  }
//
//}//class 
//

