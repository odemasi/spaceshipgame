class CompanderFilter implements AudioEffect
{
  float[] level ={0.0,0.0};
  float[] comp={0.25,0.25}; 
  float[] filt1={0.0,0.0};
  float[] filt2={0.0,0.0};
  float[] filt3={0.0,0.0};
  float[] op;
  float vol = 1.0;
  float lp=29.;
  void process(float[] samp,int ch)
  {
    op = new float[samp.length];
    int i = samp.length;
    for (int j = 0; j < i; j++)
    {
      level[ch] = ((19000*level[ch]) +abs(samp[j]))/19001;
      comp[ch] = (((0.1+level[ch])/(0.05+(level[ch]*2.))))/2.;
      filt1[ch] = ((lp*filt1[ch])+(samp[j]))/(lp+1);// lo-Pass filter
      
            filt2[ch] = ((6100.0*filt2[ch])+filt1[ch])/6102.;// hi-pass Filter
            filt3[ch] = ((610.0*filt3[ch])+filt2[ch])/611.;
      op[j] = (filt1[ch]+filt3[ch]-(filt2[ch])*2.)*comp[ch]*8.0*vol;
    }
    // we have to copy the values back into samp for this to work
    arraycopy(op, samp);
  }
 void process(float[] mono){
  // int p=0;
  process(mono,0); 
   
 }
  void process(float[] left, float[] right)
  {
    process(left,0);
    process(right,1);
  }
  
  void setLevel(float thLevel){
   vol = constrain(thLevel,0.0,3.0); 
  }
  
    void setLP(float thLP){
   lp = constrain(thLP,6.0,300.0); 
  }
}//class
//
//
//
//
//// arrayMult utility
//void arrayMult(float[] target,float thMult){
//  for(int i=0;i<target.length;i++){
//   target[i] = thMult*target[i]; 
//  }
//}
//  void arrayAdd(float[] target,float thAdd){
//  for(int i=0;i<target.length;i++){
//   target[i] = thAdd+target[i]; 
//  }
//  
//}

