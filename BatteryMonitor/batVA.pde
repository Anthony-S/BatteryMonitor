void batVA( int color){
  //char StrVA[ ] = "Bat 2X.X v sAA amps";
  volts = map(volts, 0, 1023, 0, 299); //0 - 29.9 volts in tenths
  int printvolts = volts - 200; // display 2 + 0 - 9.9 volts in tenths, update only 2 digits
 // Serial.println(amps);
  tft.drawString(wAx +3, 1,StrVA, BLACK); //Erase old VA
  StrVA[5] =48+printvolts/10;
  StrVA[7] =48+printvolts%10;
  if(amps<0)
    StrVA[11]= '-';
  else
    StrVA[11]= '+';
  int printamps = abs(amps);
  StrVA[12] = 48+printamps/10;
  StrVA[13] = 48+printamps%10;

  tft.drawString(wAx +3, 1,StrVA, color);//Current VA values
}

void calcVA(){
  
  power = amps * volts;
  power = power/10; //Units are watt-seconds
  powerSum = powerSum + power;
  if (power <= 0){
    bCharge = bCharge + power;
    //disCtr = disCtr + 1;
   // bidx = 1;
  }
  else {
    bCharge = bCharge + ((power * 100)/85);//Charging only 85% efficent
    if(bCharge>bSize)
      bCharge = bSize; //This is the max stored energy in battery
    //chrCtr = chrCtr + 1;
    //bidx = 0;
  }
 // Serial.print("amps = ");
 // Serial.print(amps);
 // Serial.print(" volts= ");
 // Serial.println(volts);
  Serial.println(bCharge/bSize,3);
}
