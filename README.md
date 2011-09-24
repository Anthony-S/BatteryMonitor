## Background

This is the third version of an Arduino Battery Monitor for a solar powered home. One of the most important bits of information needed in a Solar Powered Home is "How charged is the Battery?".  This is not an easy question to answer. The power that the battery supplies is easy, the power the is used to charge the battery is not 100% efficient. It varies from about 90% to almost 0% depending on the battery state of charge.

The monitor inputs are two analog voltages, one for the current battery voltage and one for the real time current flowing to/from the battery. This version uses an 1.8" 18-bit color TFT LCD display with microSD card breakout and a DS1307 Real Time Clock breakout board kit.  Both of these are from [Adafruit.]( http://www.adafruit.com/)

The TFT LCD shows current time, date, current, voltage. The battery current for the last 100 seconds, the intergrated current for the last few hours. A graph of the battery "percent charged" for the last few days. It aslo logs the battery current and voltage, intergrated for one second, on a micro SD card. This information will be used in the future as the software will learn what applicances are on over time by the power profile.

Version one is at [TropicArduino](http://tropicarduino.blogspot.com/2010/11/arduino-solar-battery-monitor.html/)
