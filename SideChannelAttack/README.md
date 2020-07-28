# Side Channel Attack Analysis
This repo holds all the files related to Side Channel Attack Analysis from the SPA and DPA along with examples of each.

## Simple Power Analsis (SPA)
Objective: Figure out password using SPA and protect against SPA

### What is SPA? 
Occurs when an adversary can monitor power side channel. This stems from either ground or power, which provided small amounts of leakage. Using an oscilloscope, SPA can be used to monitor the waveforms of the leakage. Certain instructions and operations on a processor require more/less power than others.

### Preventing SPA
A variety of options are used to prevent this type of attack. This includes: timing, instructions, and data width to name a few. Using a true random number generator would be the best option, but it would not be viable for this situation. Instead, a simple rand() function would suffice and was implemented to prevent SPA. 'images below>'

    - Using the rand() function, a random delay was implemented for each character. Therefore, this method would make waveforms on the oscilloscope inconsistent and ineffective.  

    - Another potential useful method would be to reduce leakage on the GND and VCC lines by sharing amoung more connections in order to produce more noise. This would allow more garbage/dummy data and make it difficult for the attack to extract the good data.





