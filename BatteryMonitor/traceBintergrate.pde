void traceBupdate(){
  updateTrace(sampleBidx, 0, traceB, wBx, wBy, wBh, maxYB, minYB); //erase last traceA
  sampleBidx = sampleBidx+1;
  if(sampleBidx>sampleSize-1)
    sampleBidx=0;
  traceB[sampleBidx] = fscale(minYB, maxYB, 0, wBh, amps, curve);//sampleBsum/sampleBnum;
  updateTrace(sampleBidx, 1, traceB, wBx, wBy, wBh, maxYB, minYB);
  //The bottom of window B gets overwritten if min value is hit, this conteracts that
  tft.drawHorizontalLine(wBx, wBy+wBh-1, 128-wBx, borderB);
  sampleBctr = 0;
 // windowC();//redraw windowC 
 //barGraph();//redraw Battery Charge data
}

