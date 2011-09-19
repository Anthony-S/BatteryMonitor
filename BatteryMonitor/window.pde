//setup windows
void drawWindow(int x, int y, int w, int h, int fill, int border){
  tft.fillRect(x, y, w, h, fill);
  tft.drawRect(x, y, w, h, border);
}
//setup grid A
void gridA(){
  int yZero = wAy + zeroLoc*wAh/255;
  tft.drawRect(wAx, wAy,wAw, wAh, borderA);
  tft.drawHorizontalLine(wAx, yZero, 128-wAx, zeroAcolor);
  tft.drawString(0, wAy + wAh/2 -3," 0", YELLOW);
  tft.drawString(0, wAy + wAh/2 -13," 8", GREEN);
  tft.drawString(0, wAy + wAh/2 -23,"24", GREEN);
  tft.drawString(0, wAy + wAh/2 -33,"56", GREEN);
  tft.drawString(0, wAy + wAh/2 +7," 8", RED);
  tft.drawString(0, wAy + wAh/2 +17,"24", RED);
  tft.drawString(0, wAy + wAh/2 +27,"56", RED);
  int yStep=10;  //Ytics
  for(int i=1; i<3; i++){
    tft.drawHorizontalLine(wAx, yZero - i*yStep, 128-wAx, GREEN);
    tft.drawHorizontalLine(wAx, yZero + i*yStep, 128-wAx, RED);
  }
  int xStep=20;  //time tics
  for(int i=1; i<6; i++)
    tft.drawVerticalLine(wAx+xStep*i, wAy , wAh, jWheel(16));
}
//setup grid B
void gridB(){
  tft.drawHorizontalLine(wBx, wBy + wBh/2, 128-wBx, zeroBcolor);
}
