void upDatetraceA(int j, byte type){
  //to update first print old pixed black then do new pixel
  // type = 0 color black erase old trace 
  // type= 1 red negative green positive
  // type= 2 cyan positive
  int yZero = wAy + zeroLoc*wAh/255;
  for(int x=1; x<sampleSize; x++){
    int idx;
    int len;
    int localY;
    idx = j-x;
    if(idx<0)
      idx=sampleSize + idx;
    localY = wAy + traceA[idx]*wAh/255;
    len = yZero - localY;
    switch(type){
    case 0:
     if(len>0)
     tft.drawVerticalLine(wAx +x, yZero - len, abs(len), BLACK);
     else
     tft.drawVerticalLine(wAx +x, yZero, abs(len), BLACK);
      break;
    case 1:
     if(len>0)
     tft.drawVerticalLine(wAx +x, yZero - len, abs(len), GREEN);
     else
     tft.drawVerticalLine(wAx +x, yZero, abs(len), RED);
      break;

    }
  }
}
void upDatetraceB(int j, byte type){
  //to update first print old pixed black then do new pixel
  // type = 0 color black erase old trace 
  // type= 1 red negative green positive
  // type= 2 cyan positive
  int yZero = wBy + zeroLoc*wBh/255;
  for(int x=1; x<sampleSize; x++){
    int idx;
    int len;
    int localY;
    idx = j-x;
    if(idx<0)
      idx=sampleSize + idx;
    localY = wBy + traceB[idx]*wBh/255;
    len = yZero - localY;
    switch(type){
    case 0:
     if(len>0)
     tft.drawVerticalLine(wBx +x, yZero - len, abs(len), BLACK);
     else
     tft.drawVerticalLine(wBx +x, yZero, abs(len), BLACK);
      break;
    case 1:
     if(len>0)
     tft.drawVerticalLine(wBx +x, yZero - len, abs(len), GREEN);
     else
     tft.drawVerticalLine(wBx +x, yZero, abs(len), RED);
      break;

    }
  }

}
/*
void upDatetraceC(int j){
  //to update first print old pixed black then do new pixel
  // type = 0 color black erase old trace 
  // type= 1 red negative green positive
  // type= 2 cyan positive
  
  for(int x=1; x<sampleSize; x++){
    int idx;
    idx = j-x;
    if(idx<0)
      idx=sampleSize + idx;
    // draw Battery Full line
    for(int x=1; x<sampleSize; x++){
    int yValue = traceC[0]*wCh/100;
    tft.drawVerticalLine(x+wCx, wCy , wCh-yValue, BLACK);
  }
  }

}*/
