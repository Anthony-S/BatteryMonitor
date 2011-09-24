## notes about this project 

### The main TFT window *Window A*

The analog inputs are digitized and mapped to a *real* range in void batVA.

	 volts = map(volts, 0, 1023, 0, 299);  //0 - 29.9 volts in tenths
 	 int printvolts = volts - 200; // display 2 + 0 - 9.9 volts in tenths, update only 2 digits
 	 amps = map(amps, 0, 1023, -132, 32);
 	 if(amps<-72)
  	   amps = -72;
The real amps are clamped between -72 amps, saturation of the Hall effect current sensor and +32 amps fixed by the upper 5 volt rail of the Arduino. In the future an external Op-amp will scale and offset the analog input to a better range.

### First need new code to scale and plot the amps into the window.

Window height must be the amp range -72 to + 32. The positive amps must plot in **green** and the negative amps in **red**.  Zero amps is not in the middle of the window. Each update, once a second, will update the graph on the left as is currently done. The window width is the history time shown, currently about 100 seconds. In the future this vertical scale will be **non-linear**.

