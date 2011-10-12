void updateTrace(int j, byte type, int* trace, int wX, int wY, int wH, int maxY, int minY){
  // j is index into sample array 
  //to update first print old pixed black then do new pixel
  // type = 0 color black erase old trace 
  // type= 1 red negative green positive
  // type= 2 cyan positive
  int yZero = wY + fscale(minY, maxY, wH, 0, 0, curve);
  int yZeroLocal = yZero - wY;
  // 1 sample per horiz pixel
  // x is the horizontal sample count, 0 at left most
  // idx is the index into the trace array for position x
  for(int x=1; x<sampleSize; x++){
    int idx;
    int len;
    int screenAmps;
    int localY;
    idx = j-x;
    if(idx<0)
      idx=sampleSize + idx;
    screenAmps = trace[idx] - (wH - yZeroLocal);
    if (trace[idx] == -1) screenAmps = 0; // -1 is the default, because it's an impossible value
    len = abs(screenAmps);
    
    switch(type){
    case 0:
     if(screenAmps>0)
      tft.drawVerticalLine(wX + x, yZero - len, abs(len), BLACK);
     else
      tft.drawVerticalLine(wX + x, yZero, abs(len), BLACK);
     break;
    case 1:
     if(screenAmps>0)
      tft.drawVerticalLine(wX + x, yZero - len, abs(len), GREEN);
     else
      tft.drawVerticalLine(wX + x, yZero, abs(len), RED);
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
