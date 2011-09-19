void traceBupdate(){
  upDatetraceB(sampleBidx, 0); //erase last traceA
  sampleBidx = sampleBidx+1;
  if(sampleBidx>sampleSize-1)
    sampleBidx=0;
  traceB[sampleBidx] = sampleBsum/sampleBnum;
  upDatetraceB(sampleBidx, 1); 
  sampleBsum = 0;
  sampleBctr = 0;
 // windowC();//redraw windowC 
 //barGraph();//redraw Battery Charge data
}

