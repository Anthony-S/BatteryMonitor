

//setup window A
void windowA(){
  tft.fillRect(wAx, wAy,wAw, wAh, fillA);
  tft.drawRect(wAx, wAy,wAw, wAh, borderA);
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

//setup window B
void windowB(){
  tft.fillRect(wBx, wBy,wBw, wBh, fillB);
  tft.drawRect(wBx, wBy,wBw, wBh, borderB);
}
//setup grid B
void gridB(){
  tft.drawHorizontalLine(wBx, wBy + wBh/2, 128-wBx, zeroBcolor);
}
//setup window CB
void windowC(){
  tft.fillRect(wCx, wCy,wCw, wCh, fillC);
  tft.drawRect(wCx, wCy,wCw, wCh, borderC);
}