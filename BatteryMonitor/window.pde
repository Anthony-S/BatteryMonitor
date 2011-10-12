//setup windows
void drawWindow(int x, int y, int w, int h, int fill, int border){
  tft.fillRect(x, y, w, h, fill);
  tft.drawRect(x, y, w, h, border);
}
//setup grid A
// draw the bounding box, grid graticule and labels for graph A
// depends on 
// wAy
// maxY
// minY
// wAh
// wAw
// borderA
// wAx
// zeroAcolor

void gridA(int maxY, int minY, int graticuleStep){
  char buff[4];
  int yZero = wAy + fscale(minY, maxY, wAh, 0, 0, curve);
  tft.drawRect(wAx, wAy, wAw, wAh, borderA);
  tft.drawHorizontalLine(wAx, yZero, 128-wAx, zeroAcolor);
  tft.drawString(0, yZero-3, " 0", YELLOW);
  //Print the positive graticules
  // counter is the nth graticule above 0
  for(int counter=1,i=graticuleStep; i<=maxY; i+=graticuleStep,counter++) 
  {
    int graticulePos = wAy + fscale(minY, maxY, wAh, 0, i, curve);
    sprintf(buff, "%d", i);
    tft.drawString(0, graticulePos-3, buff, GREEN);  // numbers will most likely overlap if too many graticules in small graph
    tft.drawHorizontalLine(wAx, graticulePos, 128-wAx, GREEN);
  }
  //Print the negative graticules

  for(int counter=1,i=-graticuleStep; i>=minY; i-=graticuleStep,counter++)
  {
    int graticulePos = wAy + fscale(minY, maxY, wAh, 0, i, curve);
    sprintf(buff, "%d", graticuleStep*counter);
    tft.drawString(0, graticulePos-3, buff, RED);  // numbers will most likely overlap if too many graticules in small graph
    tft.drawHorizontalLine(wAx, graticulePos, 128-wAx, RED);
  }
  int xStep=20;  //time tics
  for(int i=1; i<6; i++)
    tft.drawVerticalLine(wAx+xStep*i, wAy , wAh, jWheel(16));
}
//setup grid B
void gridB(int maxY, int minY){
  int yZero = wBy + fscale(minY, maxY, wBh, 0, 0, curve);
  tft.drawHorizontalLine(wBx, yZero, 128-wBx, zeroBcolor);
}
