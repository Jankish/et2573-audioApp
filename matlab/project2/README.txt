Instruction for running the MATLAB files

The file structure is the following:

project2
|----baby_signals
|    |----baby-crying.wav
|    |----baby-crying-01.wav
|    |----baby-talking_8khz.wav
|----noise_signals
|    |----bird_chirp_ext_8khz.wav
|    |----noise_ambient_library.wav
|    |----noise_traffic_intersection.wav
|    |----traffic-noise-01(dobelnsgatan).wav
|    |----ventilation_8khz.wav
|----algorithm.m
|----butterFilter.om
|----filterPass.m
|----makeSound.m
|----reverseAverg.m
|----ringAlarm.m

-algorithm.m
Holds the main executing code that calls the other scripts. When testing
the algorithms, this is the script that should be executed. There is a line
that can be uncommented to allowed the advanced algorithm.

-butterFilter.m
Designs and creates the Butterworth bandpass filter. This scripts is called 
from Algorithm.m

-filterPass.m
Advanced algorithm, filters the signals through the created bandpass filter 
that was created in butterFilter.m. The script is called from algorithm.m

-makeSound.m
Creates the different configurations in the sets. New sound files can be inserted
here to test the algorithm even further. This script is called from algorithm.m.

-reverseAverg.m
This script hold the reverse averaging algorithm. Called from algorithm.m.

-ringAlarm.m
This script is called from algorithm.m and validates where the alarm has been 
set off.

(run)algorithm
       |
       |-->(calls) makeSound
                  |
       |<---------|
       |
       |-->(calls if uncommented) butterFilter
       		  |
       |<---------|
       |
       |-->(calls if filtering==1) filterPass
       		  |
       |<---------|
       |
       |-->(calls) reverseAverg
       		  |
       |<---------|
       |
       |-->(calls) ringAlarm
       		  |
       |<---------|
       |
       Plot 3 figures, each a different base
       |
<-end--|

Step1:
Run algorithm.m
Runs the basic algorithm

Step2:
To run the advanced algorithm
uncomment "butterFilter" in
algorithm.m


