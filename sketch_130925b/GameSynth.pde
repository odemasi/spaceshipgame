import ddf.minim.*; 
import ddf.minim.signals.*; 
import javax.sound.sampled.*; 

class GameSynth {

  Minim minim; 
  AudioOutput out; 
  SineWave sine;
  SineWave sineX; 
  SquareZap square;
  SquareHat square2;
  SquareSpike square3;
  SquarePhase bzerk;
  SquareBoink boink;
  bitNoise bnoise;
  bitNoiseBP oldnoise;
  SquareTriangle tri;
  boingyringer ring1;
//  noisyringer3 nring3;
//  nedsyringer ned;
//  pulseWidthBP pw;
//  AudioSample wave; 
  float[] samples = new float[1024*8]; 
  float amp = 0.; 
  float freq = 100.; 
  float noiseAmp = 0.;
  float pan = -0.0; 
  float panner = 0.0; 
  int wavecount = 0; 
  int synthFrame=0;
  float decay = 1.1;
  float portamento = 0;
  float lastport=0;
  CompanderFilter comp;
  GameSynth(PApplet thing) {
//    minim = new Minim(thing); 
//    out = minim.getLineOut(Minim.STEREO); 
//    comp = new CompanderFilter();
//    bnoise = new bitNoise(180, 0.0, 44100); 
//    bnoise.setAmp(noiseAmp);
//    oldnoise = new bitNoiseBP(180, 0.0, 44100); 
//    oldnoise.setAmp(0.0);
//    sineX = new SineWave(180, 1.0, 44100); 
//    sineX.generate(samples); 
//    float ampl=0.0; 
//    for (int i =0;i<samples.length;i++) { 
//      if (ampl>0. && i>20) {
//        ampl -= 0.0003;
//      }
//      else if (i<20) {
//        ampl +=0.03;
//      } 
//      samples[i] = (ampl*samples[i]); 
//      samples[i] = (ampl*samples[i]);
//    } 
//
//    AudioFormat format = new AudioFormat( 44100, // sample rate 
//    16, // sample size in bits 
//    2, // channels 
//    true, // signed 
//    true   // bigEndian 
//    ); 
//    wave = minim.createSample( samples, // the samples 
//    format, // the format 
//    1024     // the output buffer size 
//    ); 
//    //sineX= null;
    sine = new SineWave(120, 0.0, 44100);                            
//    sine.setFreq(120); 
//    sine.portamento(20); 
//    square = new SquareZap(120, 0.0, 44100);                            
//    square2 = new SquareHat(120, 0.0, 44100);       
//    square3 = new SquareSpike(120, 0.0, 44100);  
//    bzerk = new SquarePhase(120, 0.0, 44100);  
//    boink = new SquareBoink(120, 0.0, 44100);  
//    ring1 = new boingyringer(120, 0.0, 44100);
//    nring3 = new noisyringer3(120, 0.0, 44100);
//    ned = new nedsyringer(120, 0.0, 44100);
//    pw = new pulseWidthBP(120, 0.0, 44100);
//    tri = new SquareTriangle(120, 0.0, 44100);
//    square.setFreq(120); 
//    //  square.portamento(20); 
//    square.setAmp(0.);
//    square2.setAmp(0.);
//    sine.setAmp(0.); 
//    bnoise.setAmp(0.);
//    bnoise.noPortamento();
//    out.addSignal(sineX);
//    out.disableSignal(sineX);
//    out.addSignal(bnoise);
//    // out.disableSignal(bnoise);
//    out.addSignal(sine); 
//    //  out.disableSignal(sine);
//    out.addSignal(square);
//    out.addSignal(square2);
//    out.addSignal(square3);
//    out.addSignal(bzerk);
//    out.addSignal(boink);
//    out.addSignal(oldnoise);
//    //    out.addSignal(ring1);
//    //    out.addSignal(nring3);
//    //    out.addSignal(ned);
//
//    out.addSignal(pw);
//    out.addSignal(tri);
//    // boink.setAmp(0.3);
//    out.addEffect(comp);
//    println("It always says that!! Ignore it!!");
//    //gameSoundStartup(3);
  }
//  void volume(float thVol) {
//    comp.setLevel(thVol);
//  }
//  void lp(float thlp) {
//    comp.setLP(thlp);
//  }
  void update() {
    synthFrame++;
    amp/=decay;
    //noiseAmp/=1.1;
    sine.setFreq(freq);
    sine.setAmp(amp/2.);
    sine.portamento(round(lastport+10));

    lastport = portamento;
    portamento /=1.4;
    // bnoise.setAmp(constrain(noiseAmp,0.0,0.9));
    //bnoise.setHarmonic(synthFrame%5+2);
    //  pw.pulse = (map(mouseX,0,width,-0.9,1.0));
    //  pw.setPW(map(mouseX,0,width,-1,1));
    //  pw.setBP(map(mouseY,0,height,10,400));
  }
//
//
//  void stop() {
//    out.close();
//    wave.stop();
//    minim.stop();
//  }
//
//  void bang(int thBoom) {
//    bnoise.setAmp(0.4);
//    bnoise.resetFreq(thBoom*555+130);
//    //noiseAmp=1.2-((5+thBoom)/(10+thBoom));
//    wave.trigger();
//    bnoise.setEnv(0.001, 0.4);
//    bnoise.setLFO(6, 0.0);
//    //   bnoise.setFreq(thBoom*555+40);
//    //  bnoise.setFreqLFO(0,0);
//    bnoise.trigger();
//    freq=50+thBoom;
//    amp=0.2;
//    decay=1.4+(0.1*thBoom);
//  }
//  void boom(int thBoom) {
//    bnoise.setAmp(0.8);
//    bnoise.resetFreq(thBoom*555+40);
//    //noiseAmp=1.2-((5+thBoom)/(10+thBoom));
//    wave.trigger();
//    bnoise.setEnv(0.001, 1.4);
//    bnoise.setLFO(6, 0.2);
//    //   bnoise.setFreq(thBoom*555+40);
//    //  bnoise.setFreqLFO(0,0);
//    bnoise.trigger();
//    //  freq=50;amp=0.6;decay=1.1+(0.1*thBoom);
//    tri.resetFreq(35);
//    tri.setAmp(0.7);
//    //tri.setEnv(0.001,1.4);
//    tri.setAmpADSR(0.001, 0.6, 0.01, 1.9, 
//    0.0, 1.0, 0.3, 0.0);
//    tri.trigger();
//  }
//
//  void bump(int thBump) {
//    freq = (constrain(thBump*20, 60, 320));
//    amp = constrain(thBump/5., 0.05, 0.1);
//    decay = 1.7;
//    wave.trigger();
//  }
//  void blip(int thBlip) {
//    freq = (constrain(thBlip*20+160, 160, 640));
//    amp = constrain(thBlip/5., 0.05, 0.1);
//    decay = 1.8;
//    wave.trigger();
//  }
//  void zap(int thZap) {
//    // square.portamento(1);
//    square.setAmp(0.15);
//    square.freqy = (constrain(thZap*100+360, 360, 1440));
//    square.amp = (constrain((thZap%3)*2., 0.8, 0.8));
//    //square.portamento(390);
//    //square.setFreq(80);
//    // decay = 1.8;
//  }
//
//  void zapB(int thZap) {
//    // square.portamento(1);
//    //  bzerk.reset();
//    bzerk.setAmp(0.25);
//    bzerk.SETFreq(60);
//    bzerk.setLFO(5+3*thZap, 0.1);
//    bzerk.setAmpADSR(0.0001, 0.43, 0.18, 0.3, 
//    0.0, 0.9, 0.01, 0.01);
//    //       bzerk.setFreqLFO(99,0.1,60,constrain(thZap*10+90,90,300)+400);
//    bzerk.setFreqADSR(0.001, 0.3, 0.01, 0.03, 300.+(50.*thZap), 200.+(50.*thZap), 60., 60.);
//
//    // bzerk.setFreqADSR(0.01,0.4,0.01,0.5,300.,250.,200.,100.);
//    bzerk.trigger();
//    //square.freqy = (constrain(thZap*100+360,360,1440));
//    //bzerk.amp = (constrain((thZap%3)*2.,0.8,0.8));
//    //square.portamento(390);
//    //square.setFreq(80);
//    // decay = 1.8;
//  }
//
//  void spacey(int thSpace) {
//    square2.SETFreq(constrain(thSpace*20+90, 90, 400));
//    square2.setLFO(0.5+(0.3*thSpace), 0.3+(0.1*thSpace%0.3));
//    square2.setAmp(0.05);
//    square2.setFreqLFO(8, 0.8, constrain(thSpace*20+90, 90, 300)+100, constrain(thSpace*20+90, 90, 300)+600);
//    square2.setFreqADSR(0.01, 0.9, 0.09, 0.9, 300., square2.frequency()-(thSpace*20), square2.frequency()+thSpace*30, 100.);
//    square2.setEnv(1.0001, 2.5);
//    square2.trigger();
//  }
//
//
//  void gulp(int thSpace) {
//    square3.SETFreq(constrain(thSpace*20+90, 90, 300));
//    // square3.setLFO(55,0.9);
//    square3.setAmp(0.1);
//    square3.setFreqLFO(22, 0.9, constrain(thSpace*5+190, 90, 400)+100, constrain(thSpace*20+190, 90, 400)+200);
//    square3.setEnv(0.53, 0.001+(0.01*thSpace/3));
//    square3.trigger();
//  }
//
//
//  void gong(int thSpace) {
//    square3.SETFreq(constrain(thSpace*20+90, 90, 300));
//    square3.setLFO(29, 0.9);
//    square3.setAmp(0.15);
//    square3.setFreqLFO(99, 0.9, constrain(thSpace*3+50, 60, 300)+30, constrain(thSpace*13+30, 60, 300)+100);
//    square3.setEnv(0.001, 0.9);
//    square3.trigger();
//  }
//  void boing1(int thSpace) {
//    square3.SETFreq(constrain(thSpace*20+90, 90, 300));
//    square3.setLFO(229, 1.4);
//    square3.setAmp(0.15);
//    square3.setFreqLFO(6, 1.1, constrain(thSpace*3+50, 60, 300)+100, constrain(thSpace*13+30, 60, 300)+200);
//    square3.setEnv(0.001, 0.9);
//    square3.trigger();
//  }
//
//  void boing2(int thSpace) {
//    square3.SETFreq(constrain(thSpace*20+90, 90, 300));
//    square3.setLFO(28, 0.1);
//    square3.setAmp(0.15);
//    square3.setFreqLFO(5, 0.9, constrain(thSpace*3+50, 60, 300)+100, constrain(thSpace*13+30, 60, 300)+200);
//    square3.setEnv(0.001, 0.6);
//    square3.trigger();
//  }
//  void chime(int thSpace) {
//    square2.resetFreq(constrain(thSpace*80+90, 180, 600));
//    square2.setLFO(125, 0.2);
//    square2.setAmp(0.2);
//    square2.setFreqLFO(500.5, 1.9, constrain(thSpace*3+50, 60, 300)+100, constrain(thSpace*80+90, 180, 800));
//    square2.setEnv(0.0001, 0.25);
//    square2.trigger();
//  }
//
//  void gameSoundStartup(int thSpace) {
//    square2.resetFreq(constrain(thSpace*80+90, 180, 600));
//    //square2.setLFO(125,0.2);
//    square2.setAmp(0.1);
//    // square2.setFreqLFO(500.5,1.9,constrain(thSpace*3+50,60,300)+100,constrain(thSpace*80+90,180,800));
//    square2.setEnv(0.0001, 0.25);
//
//    float[] v =
//    {
//      0, 100, 200, 400, 800, 0, 1600
//    };
//    square2.setBlip(v, 240, 1);
//    //square2.trigger();
//  }
//  void clank(int thSpace) {
//    square2.SETFreq(constrain(thSpace*70+30, 90, 200));
//    square2.setLFO(555+thSpace*49.1, 1.5);
//    square2.setAmp(0.06);
//    square2.setFreqLFO(1.5, 0.01, constrain(thSpace*3+50, 60, 100)+100, constrain(thSpace*13+30, 60, 100)+200);
//    square2.setEnv(0.004, 0.4);
//    square2.trigger();
//  }
//
//  void boinky(int thSpace) {
//    boink.SETFreq(constrain(thSpace*20+30, 90, 200));
//    boink.setLFO(111, 0.1);
//    boink.setAmp(0.4);
//    boink.setFreqLFO(8, 0.2);
//    boink.setEnv(0.001, 0.4);
//    boink.setFreqADSR(0.005, 0.2, 0.08, 0.9, constrain(thSpace*14+30, 90, 300), 
//    constrain(thSpace*40+30, 90, 600), 
//    constrain(thSpace*11+30, 60, 300), constrain(thSpace*10+10, 40, 100));
//    boink.trigger();
//  }
//  void car(int thSpace) {
//    boink.SETFreq(constrain(thSpace*20+30, 90, 200));
//    //boink.reset();
//    boink.setLFO(20+10*thSpace, 0.3);
//    boink.setAmp(0.6);
//    //  boink.setFreqLFO(8,0.0);
//    //  boink.setEnv(0.001,0.4);
//    boink.setFreqADSR(0.005, 0.09, 2.08, 0.5, constrain(thSpace*8+30, 90, 100)*2, 
//    constrain(thSpace*10+30, 90, 230)*2, 
//    constrain(thSpace*14+30, 60, 350)*2, constrain(thSpace*10+10, 40, 80)*2);
//    boink.setAmpADSR(2.8, 0.3, 0.01, 7.8, 
//    0.00, 0.8, 0.1, 0.0);
//    boink.trigger();
//  }
//  void jump(int thSpace) {
//    // boink.reset();
//    boink.SETFreq(constrain(thSpace*20+30, 90, 200));
//    boink.setLFO(0.1, 0.1);
//    boink.setAmp(0.3);
//    //  boink.setFreqLFO(8,0.2);
//    boink.setEnv(0.01, 0.3);
//    boink.setFreqADSR(0.25, 0.25, 0.0, 0.4, 70+(thSpace*5), 150+(thSpace*10), 225+(thSpace*20), 300+(thSpace*40));
//
//    boink.trigger();
//  }
//  void weirdCar(int thSpace) {
//    bzerk.SETFreq(constrain(thSpace*20+30, 90, 200));
//    // bzerk.reset();
//    bzerk.setLFO(1+3.1*thSpace, 0.4);
//    bzerk.setAmp(0.6);
//    //  boink.setFreqLFO(8,0.2);
//    //  boink.setEnv(0.001,0.4);
//    bzerk.setFreqADSR(0.005, 0.09, 2.08, 0.5, constrain(thSpace*8+30, 90, 200)*2, 
//    constrain(thSpace*10+30, 90, 330)*2, 
//    constrain(thSpace*14+30, 60, 600)*2, constrain(thSpace*10+10, 40, 180)*2);
//    bzerk.setAmpADSR(2.8, 0.3, 0.01, 7.8, 
//    0.00, 0.8, 0.1, 0.0);
//    bzerk.trigger();
//  }
//  void bzaap(int thSpace) {
//    bzerk.SETFreq(constrain(thSpace*3+35, 70, 140));
//    // bzerk.reset();
//    bzerk.setLFO(2.*(35.01+3*thSpace), 1.1);
//    bzerk.setAmp(0.3);
//    boink.setFreqLFO(8, 0.2);
//    //  boink.setEnv(0.001,0.4);
//    bzerk.setFreqADSR(0.08, 0.8, 1.0, 0.51, 
//    constrain(thSpace*3+140, 140, 340)-9, 
//    constrain(thSpace*3+140, 140, 340)+0.5, 
//    constrain(thSpace*3+140, 140, 340)-0.1, 
//    constrain(thSpace*3+140, 140, 340)-9
//      );
//    //constrain(thSpace*8+30,90,200)*2,
//    //  constrain(thSpace*10+30,90,330)*2,
//    //constrain(thSpace*14+30,60,600)*2,constrain(thSpace*10+10,40,180)*2);
//    bzerk.setAmpADSR(0.06, 0.8, 1.3, 0.02, 
//    0.00, 0.9, 0.4, 0.9);
//    bzerk.trigger();
//    // freq=35;
//    //amp=0.11;
//    //decay=1.1;
//    //wave.trigger();
//  }
//
//
//  void blipBzap(int thSpace) {
//    bzerk.SETFreq(constrain(thSpace*3+35, 70, 140));
//    // bzerk.reset();
//    bzerk.setLFO(2.*(5.01+1.3*thSpace), 0.2);
//    bzerk.setAmp(0.7);
//    bzerk.setFreqLFO(8, 0.05);
//    //  boink.setEnv(0.001,0.4);
//
//
//    bzerk.setAmpADSR(0.002, 0.1, 0.01, 0.062, 
//    0.00, 0.4, 0.4, 0.1);
//    // bzerk.trigger();
//    float h=(20*thSpace);
//    float[] v = {
//      100+h, 200+h, 155+h, 134+h, 
//      100+h, 200+h, 155+h, 134+h, 
//      100+h/2, 200+h/2, 155+h/2, 134+h/2, 
//      100, 200, 155, 134,
//    };
//    bzerk.setBlip(v, 0.023, 4);
//    //  void setBlip(float[] thblips,float thblipRate, int thblipLoops)
//  }
//
//
//  void blipSong(int thSpace) {
//    square3.SETFreq(constrain(thSpace*3+35, 70, 140));
//    // bzerk.reset();
//    square3.setLFO(8.+(0.01+0.2*thSpace), 0.08);
//    square3.setAmp(0.4);
//    square3.setFreqLFO(8, 0.1);
//    //  boink.setEnv(0.001,0.4);
//
//
//    square3.setAmpADSR(0.002, 0.56, 0.2, 0.30, 
//    0.00, 0.4, 0.1, 0.0);
//    // bzerk.trigger();
//    float U=1+(thSpace*0.1);
//    float[] p = {
//      100*U, 100*U, 150*U, 150*U, 
//
//      168*U, 168*U, 150*U, 0*U, 
//      133*U, 133*U, 127*U, 127*U, 
//      113*U, 113*U, 100*U, 0*U
//    };
//    square3.setBlip(p, 180, 1);
//    //  void setBlip(float[] thblips,float thblipRate, int thblipLoops)
//  }
//
//
//  void classicBump(int thSpace) {
//    boink.resetFreq(50+thSpace*3);
//    boink.setAmp(0.2);
//    boink.setAmpADSR(0.0, 0.0, 0.1, 0.0);
//    boink.trigger();
//  }
//
//  void classicBlip(int thSpace) {
//    square3.resetFreq(250+thSpace*30);
//    square3.setAmp(0.24);
//    square3.setAmpADSR(0.0, 0.0, 0.05, 0.0);
//    square3.trigger();
//  }
//  void classicDown(int thSpace) {
//    boink.resetFreq(50+thSpace*3);
//    boink.setAmp(0.2);
//    boink.setAmpADSR(0.0, 0.0, 1.0, 0.0);
//    boink.sweepDown();
//    boink.trigger();
//  }
//  void classicUp(int thSpace) {
//    boink.resetFreq(50+thSpace*3);
//    boink.setAmp(0.2);
//    boink.setAmpADSR(0.0, 0.0, 1.0, 0.0);
//    boink.sweepUp();
//    boink.trigger();
//  }
//
//  void classicCoin(int thSpace) {
//    boink.resetFreq(200+thSpace*3);
//    boink.setAmp(0.3);
//    //boink.setLFO(200,0.3);
//    boink.setAmpADSR(0.0, 0.05, 0.0, 1.0, 
//    0.0, 1.0, 0.4, 0.0);
//    //boink.sweepUp();
//    float[] t = {
//      400, 300
//    };
//    arrayMult(t, (1.25+float(thSpace)/5.));
//    boink.setBlip(t, 0.1, 1);
//  }
//  void classicCoin2(int thSpace) {
//    square2.resetFreq(200+thSpace*3);
//    square2.setAmp(0.3);
//    square2.setLFO(((200+100*float(thSpace)/5.)), 0.3);
//    square2.setAmpADSR(0.0, 0.05, 0.0, 1.0, 
//    0.0, 1.0, 0.4, 0.0);
//    //boink.sweepUp();
//    float[] t = {
//      400, 300
//    };
//    arrayMult(t, (1.25+float(thSpace)/5.));
//    square2.setBlip(t, 0.1, 1);
//  }
//
//  void classicClik(int thSpace) {
//    oldnoise.resetFreq(800+(200*thSpace));
//    oldnoise.setAmp(0.2);
//    //oldnoise.setLFO(800,0.9);
//    oldnoise.setAmpADSR(0.001, 0.05, 0.0, 0.05, 
//    0.0, 1.0, 0.4, 0.0
//      );
//    oldnoise.trigger();
//    //wave.setAmp(0.05);
//    //wave.trigger();
//  }
//  void classicGun(int thSpace) {
//    oldnoise.resetFreq(300+(5*thSpace));
//    oldnoise.setAmp(0.8);
//    //oldnoise.setLFO(800,0.9);
//    oldnoise.setAmpADSR(0.001, 0.05, 0.0, 0.05, 
//    0.0, 1.0, 0.4, 0.0
//      );
//    float[] v = {
//      100+10*thSpace, 100+5*thSpace
//    };
//    oldnoise.setBlip(v, 0.01, 1);
//
//    boink.resetFreq(150+thSpace*3);
//    boink.setAmp(0.15);
//    boink.setAmpADSR(0.0, 0.1, 0.05, 0.1);
//    boink.setFreqADSR(0.0, 0.15, 0.0, 0.2, 
//    850+thSpace*20, 100+thSpace*10, 80+thSpace*5, 50+thSpace*2
//      );
//    float[] q = {
//      130+thSpace*10, 90+thSpace*5
//    };
//    boink.setBlip(q, 0.01, 3);
//    wave.trigger();
//    //boink.trigger();
//  }
//  void splat(int thSpace) {
//    oldnoise.resetFreq(40+(40*thSpace));
//    oldnoise.setAmp(0.2);
//    //oldnoise.setLFO(800,0.9);
//    oldnoise.setAmpADSR(0.01, 0.02, 0.0, 0.02);
//    float[] v = {
//      200+80*thSpace, 150+40*thSpace
//    };
//    oldnoise.setBlip(v, 0.01, 1);
//
//    bzerk.resetFreq(150+thSpace*3);
//    bzerk.setAmp(0.05);
//    bzerk.setAmpADSR(0.0, 0.05, 0.05, 0.1);
//    bzerk.setFreqADSR(0.0, 0.05, 0.0, 0.2, 
//    850+thSpace*20, 100+thSpace*15, 80+thSpace*10, 50+thSpace*10
//      );
//    float[] q = {
//      80+thSpace*5, 50+thSpace*2
//    };
//    bzerk.setBlip(q, 0.01, 3);
//  }
//
//  void classicPowerUp(int thSpace) {
//
//    boink.resetFreq(250+thSpace*20);
//    boink.setAmp(0.1);
//    boink.setAmpADSR(0.0, 0.05, 0.05, 0.1);
//    //boink.setFreqADSR(0.0,0.05,0.0,0.2,
//    float h = float(thSpace)/7. +0.25;
//
//    float[] t = {
//      200, 230, 260, 400, 
//      200, 230, 260, 400, 
//      200, 230, 260, 400, 
//
//      230, 260, 280, 460, 
//      230, 260, 280, 460, 
//      230, 260, 280, 460, 
//
//      260, 290, 310, 490, 
//      260, 290, 310, 490, 
//      260, 290, 310, 490, 1
//    };
//    arrayMult(t, h);
//    boink.setBlip(t, 0.025, 1);
//  }
//
//  void classicPowerDn(int thSpace) {
//
//    boink.resetFreq(250+thSpace*20);
//    boink.setAmp(0.1);
//    boink.setAmpADSR(0.0, 0.05, 0.05, 0.1);
//    //boink.setFreqADSR(0.0,0.05,0.0,0.2,
//    float h = float(thSpace)/7. +0.25;
//
//    float[] t = {
//
//      260, 290, 310, 490, 
//      260, 290, 310, 490, 
//      260, 290, 310, 490, 
//
//
//      230, 260, 280, 460, 
//      230, 260, 280, 460, 
//      230, 260, 280, 460, 
//
//      200, 230, 260, 400, 
//      200, 230, 260, 400, 
//      200, 230, 260, 400, 1
//    };
//    arrayMult(t, h);
//    boink.setBlip(t, 0.025, 1);
//  }
//
//
//  void bubble(int thSpace) {
//    boink.resetFreq(300+thSpace*3);
//    boink.setAmp(0.5);
//    boink.setAmpADSR(0.0, 0.05, 0.01, 0.1, 
//    1.0, 1.0, 0.3, 0.01
//      );
//    boink.sweepUp();
//    boink.trigger();
//  }
//
//  void pluck(int thSpace) {
//    bzerk.resetFreq(300+thSpace*3);
//    bzerk.setAmp(0.8);
//    bzerk.setLFO(6, 0.1);
//    bzerk.setAmpADSR(0.0, 0.05, 0.01, 0.9, 
//    1.0, 1.0, 0.3, 0.01
//      );
//    bzerk.sweep(1.0, 1);
//    bzerk.trigger();
//  }
//
//  void echoPluck(int thSpace) {
//    bzerk.resetFreq(300+thSpace*3);
//    bzerk.setAmp(0.2);
//    //bzerk.setLFO(6,0.1);
//    //bzerk.setAmpADSR(0.0,0.05,0.01,0.9,
//    //                1.0,1.0,0.3,0.01
//    //                );
//
//    bzerk.sweepAmp(0.4, 0.0, 0.9, 1);
//    bzerk.sweep(1.0, 3);
//    bzerk.trigger();
//  }
//
//  void defending(int thSpace) {
//    bzerk.resetFreq(300+thSpace*3);
//    bzerk.setAmp(0.5);
//    bzerk.setLFO(6, 0.5);
//    //bzerk.setAmpADSR(0.0,0.05,0.01,0.9,
//    //                1.0,1.0,0.3,0.01
//    //                );
//
//    bzerk.sweepAmp(0.05, 0.2, 0.5, 3);
//    bzerk.sweep(-2.0, 4);
//    bzerk.trigger();
//  }
//
//  void defending2(int thSpace) {
//    bzerk.resetFreq(300+thSpace*3);
//    bzerk.setAmp(0.5);
//    bzerk.setLFO(6, 0.1);
//    //bzerk.setAmpADSR(0.0,0.05,0.01,0.9,
//    //                1.0,1.0,0.3,0.01
//    //                );
//    bzerk.setEnv(0.001, 0.4);
//    bzerk.sweepAmp(0.4, 0.2, 0.5, 2);
//    bzerk.sweep(2.0, 3);
//    bzerk.trigger();
//  }
//
//  void justtest(int thSpace) {
//    ring1.resetFreq(100+thSpace*20); 
//    ring1.setAmp(0.7);
//    ring1.setAmpADSR(0.0, 0.05, 0.01, 0.9, 
//    1.0, 1.0, 0.3, 0.01
//      );
//    ring1.trigger();
//  }
//  void justtest2(int thSpace) {
//    ned.resetFreq((50+thSpace*10)/2); 
//    ned.setAmp(0.7);
//    ned.setAmpADSR(0.0, 0.05, 0.01, 0.9, 
//    1.0, 1.0, 0.3, 0.01
//      );
//    ned.trigger();
//  }
//  void justtest3(int thSpace) {
//    pw.resetFreq((50+thSpace*10)); 
//    pw.setAmp(0.3 );
//    pw.setAmpADSR(0.0, 0.05, 3.01, 0.9, 
//    1.0, 1.0, 0.3, 0.01
//      );
//    pw.trigger();
//  }
//
//  void justtest4a(int thSpace) {
//    pw.resetFreq((50+thSpace*10)/2); 
//    pw.setAmp(0.3 );
//    pw.setPWLFO(0.5, 1.0);
//
//    pw.setBPLFO(1.0, 1.0);
//    pw.setAmpADSR(0.0, 0.05, 3.01, 0.9, 
//    1.0, 1.0, 0.3, 0.01
//      );
//    pw.trigger();
//  }
//
//  void spookySong1(int thSpace) {
//    pw.resetFreq((50+thSpace*10)/2); 
//    pw.SETFreq((50+thSpace*10)/2); 
//    pw.setAmp(0.3 );
//    pw.setPWLFO(0.15, 0.8);
//    pw.setBP(80);
//    pw.setBPLFO(0.5, 0.5);
//    pw.setAmpADSR(0.02, 0.05, 1.81, 1.9, 
//    0.3, 0.3, 0.5, 0.01
//      );
//
//    float[] t = {
//      50, 100, 72.4, 0, 
//      107, 100, 50, 1
//    };
//    arrayMult(t, 0.5+thSpace/10.0);
//    pw.setBlip(t, 0.75, 1);
//  }
//
//  void zapburp1(int thSpace) {
//    pw.resetFreq((50+thSpace*10)/2); 
//    pw.SETFreq((50+thSpace*10)/2); 
//    pw.setAmp(0.3 );
//    pw.setPWLFO(10.15, 0.5);
//    pw.setBP(30);
//    pw.setBPLFO(2.33, 0.6);
//
//    pw.sweepAmp(0.05, 0.6, 0.2, 5);
//    pw.sweep(-0.5, 1);
//    pw.setAmpADSR(0.01, 0.02, 0.11, 0.01, 
//    0.0, 0.3, 0.5, 0.00
//      );
//
//    float[] t = {
//      50, 100, 72.4, 0, 
//      107, 100, 50, 0
//    };
//    arrayMult(t, 1.5+thSpace*0.2);
//    pw.setBlip(t, 0.025, 3);
//  }
//
//
//  void zapburp2(int thSpace) {
//    pw.resetFreq((50+thSpace*10)/2); 
//    pw.SETFreq((50+thSpace*10)/2); 
//    pw.setAmp(0.3 );
//    pw.setPWLFO(10.15, 0.5);
//    pw.setBP(30);
//    pw.setBPLFO(1.33, 0.1);
//
//    pw.sweepAmp(0.05, 0.6, 0.2, 5);
//    pw.sweep(-0.5, 1);
//    pw.setAmpADSR(0.01, 0.02, 0.11, 0.01, 
//    0.0, 0.3, 0.5, 0.00
//      );
//
//    float[] t = {
//      50, 100, 72.4, 0, 
//      107, 100, 50, 1
//    };
//    arrayMult(t, 2.0+thSpace*0.5);
//    pw.setBlip(t, 0.025, 7);
//  }
//
//  void harmonicGun8(int thSpace) {
//    pw.resetFreq((50+thSpace*20)); 
//    pw.SETFreq((50+thSpace*20)); 
//    pw.setAmp(0.3 );
//    pw.setPWLFO(10.15, 0.25);
//    pw.setBP(30);
//    pw.setBPLFO(1.33, 0.1);
//
//    pw.sweepAmp(0.6, 0.0, 0.15, 8);
//    pw.sweep(-3, 10);
//    pw.trigger();
//  }
//  void harmonicGun4(int thSpace) {
//    pw.resetFreq((50+thSpace*20)); 
//    pw.SETFreq((50+thSpace*20)); 
//    pw.setAmp(0.3 );
//    pw.setPWLFO(10.15, 0.25);
//    pw.setBP(30);
//    pw.setBPLFO(1.33, 0.1);
//
//    pw.sweepAmp(0.6, 0.0, 0.15, 4);
//    pw.sweep(-3, 10);
//    pw.trigger();
//  }
//  void harmonicGun4b(int thSpace) {
//    pw.resetFreq((90+thSpace*40)); 
//    pw.SETFreq((90+thSpace*40)); 
//    pw.setAmp(0.3 );
//    pw.setPWLFO(0.15, 0.25);
//    pw.setBP(30);
//    pw.setBPLFO(1.33, 0.1);
//
//    pw.sweepAmp(0.4, 0.0, 0.15, 4);
//    pw.sweep(-3, 10);
//    pw.trigger();
//  }
//  void harmonicGun2b(int thSpace) {
//    pw.resetFreq((90+thSpace*40)); 
//    pw.SETFreq((90+thSpace*40)); 
//    pw.setAmp(0.3 );
//    pw.setPWLFO(0.15, 0.25);
//    pw.setBP(30);
//    pw.setBPLFO(1.33, 0.1);
//
//    pw.sweepAmp(0.4, 0.0, 0.15, 2);
//    pw.sweep(-3, 10);
//    pw.trigger();
//  }
//  void harmonicGun2(int thSpace) {
//    pw.resetFreq((50+thSpace*20)); 
//    pw.SETFreq((50+thSpace*20)); 
//    pw.setAmp(0.3 );
//    pw.setPWLFO(10.15, 0.25);
//    pw.setBP(30);
//    pw.setBPLFO(1.33, 0.1);
//
//    pw.sweepAmp(0.6, 0.0, 0.15, 2);
//    pw.sweep(-3, 10);
//    pw.trigger();
//  }
//  void sweepup2(int thSpace) {
//    pw.resetFreq((190+thSpace*20)); 
//    pw.SETFreq((190+thSpace*20)); 
//    pw.setAmp(0.3 );
//    //  pw.setPWLFO(0.15,0.25);
//    pw.setBP(60);
//    pw.setBPLFO(12.33, 0.3);
//
//    pw.sweepAmp(0.0, 0.5, 0.15, 2);
//    pw.sweep(2, 2);
//    pw.trigger();
//  }
//  void sweepup4(int thSpace) {
//    pw.resetFreq((190+thSpace*20)); 
//    pw.SETFreq((190+thSpace*20)); 
//    pw.setAmp(0.3 );
//    //  pw.setPWLFO(0.15,0.25);
//    pw.setBP(60);
//    pw.setBPLFO(12.33, 0.3);
//
//    pw.sweepAmp(0.0, 0.5, 0.15, 2);
//    pw.sweep(2, 2);
//    pw.trigger();
//  }
//
//  void paranoids1(int thSpace) {
//    //  if(synthFrame%(constrain(20-thSpace,1,20))==0){
//    pw.resetFreq((55+thSpace*1)/1.25); 
//    pw.SETFreq((55+thSpace*1)/1.25); 
//    pw.setAmp(0.13 );
//    square2.resetFreq((55+thSpace*1)/1.25); 
//    square2.setAmp(0.10 );
//    square2.setEnv(2.7, 4.9);
//    square2.setAmpADSR(0.03, 0.25, 999.0, 0.2);
//    pw.setPWLFO(0.5, 1.0);
//    pw.setBP(90);
//    //  pw.setBPLFO(6.63,0.3);
//    //  pw.setEnv(2.7,4.9);
//    pw.setAmpADSR(0.03, 0.25, 999.0, 0.2);
//    pw.setLFO(13+thSpace, 0.5);
//    //  pw.sweepAmp(0.0,0.5,0.15,2);
//    //pw.sweep(2,2);
//
//    square2.setLFO(13+thSpace, 0.8);
//    square2.trigger();
//    pw.trigger();
//    //  }
//  }
}//be cool, stay in class





