void traceBupdate(){
  updateTrace(sampleBidx, 0, traceB, wBx, wBy, wBh); //erase last traceA
  sampleBidx = sampleBidx+1;
  if(sampleBidx>sampleSize-1)
    sampleBidx=0;
  traceB[sampleBidx] = sampleBsum/sampleBnum;
  updateTrace(sampleBidx, 1, traceB, wBx, wBy, wBh); 
  sampleBsum = 0;
  sampleBctr = 0;
 // windowC();//redraw windowC 
 //barGraph();//redraw Battery Charge data
}

