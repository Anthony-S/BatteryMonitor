//convert RGB to 565
uint16_t convRGBto565(uint8_t r, uint8_t g, uint8_t b)
{
  return ((r / 8) << 11) | ((g / 4) << 5) | (b / 8);
}
// jerry full byte version
//Input a value 0 to 96 to get a color value.
//The colours are a inkscape color wheel

unsigned int jWheel(byte jWheelPos){
  byte r,g,b;
  r,g,b=0;
  //Serial.println(jWheelPos/16);
  switch(jWheelPos/16){
  case 0:
    r=255;
    g=jWheelPos*16;
    b=0;
    break;
  case 1:
    r=255-jWheelPos*16;
    g=255;
    b=0;
    break;
  case 2:
    r=0;
    g=255;
    b=jWheelPos*16;
    break;
  case 3:
    r=0;
    g=255-jWheelPos*16;
    b=255;
    break;
  case 4:
    r=jWheelPos*16;
    g=0;
    b=255;
    break;
  case 5:
    r=255;
    g=0;
    b=255-jWheelPos*16;
    break;
  }
  return(convRGBto565(r,g,b));
}
void barGraph(int k){  //This is window C I'm just too lazy to change the name.
  float j=64; //This is a non-integer way to step the color wheel
  char battFull[] = " 93";//This needs to be the actual % battery full below!
  if(traceC[sampleCidx]>99){
    battFull[0] = '1';
    battFull[1] = '0';
    battFull[2] = '0';
  }
  else{
    battFull[0] = char(' ');
    battFull[1] = char(48 + traceC[sampleCidx]/10);
    battFull[2] = char(48 + traceC[sampleCidx]%10);
  }
  //Draw colors the background for the graph
  for(int y=wCy; y<wCy+wCh+1; y++){
    tft.drawHorizontalLine(wCx, y , wCw, jWheel(j));
    j=j-2;
  }
  for(int x=1; x<sampleSize; x++){
    int idx;
    idx = k-x;
    if(idx<0)
      idx=sampleSize + idx;
    // draw Battery Full line
    int yValue = 100-traceC[idx];//because window is 30 pixels and I only want 30%
    tft.drawVerticalLine(x+wCx, wCy , yValue, BLACK);
  }
  //Draw charge array Total stored charge
  //for(int x=1; x<sampleSize; x++){
  // int yValue = traceC[0]*wCh/100;
  // tft.drawVerticalLine(x+wCx, wCy , wCh-yValue, BLACK);
  // }

  DateTime now = RTC.now();
  char date[] = "DD/MM/YY";
  sprintf(date, "%02d/%02d/%02d", now.day(), now.month(), now.year()%100);
  char time[] = "HH:MM pm";
  const char* mi = (now.hour() < 12)? "am": "pm";
  uint8_t hour = ((now.hour()+11)%12)+1; //Get hour for am/pm
  sprintf(time, "%02d:%02d %s", hour, now.minute(), mi);
  tft.fillRect(18, wCy-8, 128-18, 7, BLACK);//fill time and date area before write
  tft.drawString(18, wCy-8,date, YELLOW); //date
  tft.drawString(80, wCy-8,time, YELLOW);//time
  tft.fillRect(1, wCy+7,18, 7, BLACK);//fill battFull area before write
  tft.drawChar(1, wCy+7, battFull[0], GREEN);
  tft.drawChar(7, wCy+7, battFull[1], GREEN);
  tft.drawChar(13, wCy+7, battFull[2], GREEN);
  tft.drawChar(19, wCy+7, '%', GREEN);
  tft.drawString(2, wCy+15,"Full", GREEN);
}



