////Chris Ball (ball2000)  (cc) 2010 (Creative Commons License)
////GameSynth by Chris Ball  
////0.1.6b
//
// int b =0;
// PFont fontA;
//String theText = "game sounds \nby Chris Ball \nv0.1.6b \n use the \nkeyboard,y'all";
//String text2 = "";
//GameSynth synth = new GameSynth(this);
//void setup()
//{
//fontA= loadFont("CourierNew36.vlw");
//size(200,200,P2D);
////synth 
//}
//
//void draw()
//{
// // synth.lp(map(mouseX,0,width,1.0,500.0));
// //   synth.volume(map(mouseY,0,height,0.0,2.0));
//  synth.update();
//    background(0);
//    stroke(color(128,256,0));
//    textFont(fontA,16);
//text(theText+"\n\n"+text2,20,20);
//
//  
//}
//void keyPressed(){
//   theText = "game sounds \nby Chris Ball \nv0.1.6b ";
//    if(key==' '){
//  synth.paranoids1(b=round(random(20)));
//  printsc("paranoids1 "+b);
// }
//     if(key=='u'){
//  synth.paranoids1(b=round(random(20)));
//  printsc("paranoids1 "+b);
// } //sweepup4
//     if(key=='y'){
//  synth.sweepup4(b=round(random(20)));
//  printsc("sweepup4 "+b);
// } //sweepup4
//   if(key=='t'){
//  synth.harmonicGun4b(b=round(random(20)));
//  printsc("harmonicGun4b "+b);
// } 
//     if(key=='.'){
//  synth.classicCoin(b=round(random(20)));
//  printsc("classicCoin "+b);
// } 
//       if(key=='/'){
//  synth.classicCoin2(b=round(random(20)));
//  printsc("classicCoin2 "+b);
// } 
//   if(key=='q'){
//  synth.boom(b=0);
//  printsc("boom "+b);
// } 
// if(key=='a'){
//  synth.boom(b=round(random(10)));
//  printsc("boom "+b);
// } 
//  if(key=='w'){
//  synth.bang(b=round(random(10)));
//  printsc("bang "+b);
// } 
//  if(key=='s'){
//  synth.bump(b=round(random(10)));
//    printsc("bump "+b);
// } 
//  if(key=='d'){
//  synth.blip(b=round(random(10)));
//      printsc("blip "+b);
// } 
//   if(key=='g'){
//  synth.zapB(b=round(random(10)));
//      printsc("zapB "+b);
// } 
//  if(key=='f'){
//  synth.zap(b=round(random(10)));
//      printsc("zap "+b);
// } 
//  if(key=='\\'){
//  synth.spacey(b=round(random(10)));
//      printsc("spacey "+b);
// } 
//    if(key=='h'){
//  synth.gulp(b=round(random(10)));
//      printsc("gulp "+b);
// } 
//     if(key=='j'){
//  synth.chime(b=round(random(10)));
//        printsc("chime "+b);
// } 
//      if(key=='k'){
//  synth.gong(b=round(random(10)));
//          printsc("gong "+b);
// } 
//       if(key=='l'){
//  synth.boing1(b=round(random(10)));
//          printsc("boing1 "+b);
// } 
//        if(key==';'){
//  synth.boing2(b=round(random(10)));
//          printsc("boing2 "+b);
// } 
//         if(key=='\''){
//  synth.clank(b=round(random(20)));
//          printsc("clank "+b);
// } 
//          if(key=='z'){
//  synth.boinky(b=round(random(10)));
//          printsc("boinky "+b);
// } 
//           if(key=='x'){
//  synth.car(b=round(random(10)));
//          printsc("car "+b);
// } 
//
//           if(key=='c'){
//  synth.weirdCar(b=round(random(20)));
//          printsc("weirdCar "+b);
// } 
//            if(key=='v'){
//  synth.bzaap(b=round(random(20)));
//          printsc("bzaap "+b);
// }             if(key=='b'){
//  synth.bzaap(b=2);
//          printsc("bzaap "+b);
// }             if(key=='b'){
//   synth.blipBzap(b=round(random(20)));
//             printsc("blipBzap "+b);
//  }             if(key=='p'){
//   synth.blipSong(b=round(random(20)));
//             printsc("blipSong "+b);
//
//   }             if(key=='1'){
//   synth.classicBlip(b=round(random(20)));
//             printsc("classicBlip "+b);
//   }             if(key=='2'){
//   synth.classicBump(b=round(random(20)));
//             printsc("classicBump "+b);
//    }             if(key=='3'){
//   synth.classicDown(b=round(random(20)));
//             printsc("classicDown "+b);
//
// }             if(key=='4'){
//   synth.classicUp(b=round(random(20)));
//             printsc("classicUp "+b);
// }// classicDrop}// spaceInvaderGun  
// if(key=='5'){
//   synth.classicClik(b=round(random(20)));
//             printsc("classicClik "+b);
//}
// if(key=='6'){
//   synth.classicGun(b=round(random(20)));
//             printsc("classicGun "+b);
//}
// if(key=='7'){
//   synth.splat(b=round(random(20)));
//             printsc("splat "+b);
//}
// if(key=='8'){
//   synth.classicPowerUp(b=round(random(20)));
//             printsc("classicPowerUp "+b);
//}
// if(key=='9'){
//   synth.classicPowerDn(b=round(random(20)));
//             printsc("classicPowerDn "+b);
//}
// if(key=='n'){
//   synth.bubble(b=round(random(20)));
//             printsc("bubble "+b);
//}
//
// if(key=='m'){
//   synth.pluck(b=round(random(20)));
//             printsc("pluck "+b);
//}
// if(key==','){
//   synth.echoPluck(b=round(random(20)));
//             printsc("echoPluck "+b);
//}
//
// if(key=='e'){
//   synth.defending(b=round(random(20)));
//             printsc("defending "+b);
//}
// if(key=='r'){
//   synth.defending2(b=round(random(20)));
//             printsc("defending2 "+b);
//}
//
//
//}
//void printsc(String thString){
//  text2=thString;
//}
//void stop(){
// synth.stop();
//super.stop(); 
//}
