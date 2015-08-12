#include <processor_include.h>
#include <sysreg.h>
#include <signal.h>
#include <string.h>
#include <filter.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "framework.h"

#define FILTER_BIQUAD_SECTIONS  3
#define FILTER_BIQUAD_COEFFS    5
#define FILTER_BIQUAD_STATES    (2*FILTER_BIQUAD_SECTIONS+1)

/*
Bandpass filter design in Matlab.
d = fdesign.bandpass('n,f3db1,f3db2', 6, 400/16000, 3400/16000)
h = design(d, 'butter')

Order for SOS-matrix: [B0, B1, B2, 1.0, A1, A2]
Scale the B-coefficients by the corresponding scales.

Order for biquad coefficients: [-A2, -A1, B2, B1, B0]
*/

static float const pm soscoeff[FILTER_BIQUAD_SECTIONS*FILTER_BIQUAD_COEFFS] = {
    -0.935014210289576,  1.928547594716040, -0.256800106491053,                  0,  0.256800106491053,
    -0.604491777275796,  1.284123557709491, -0.256800106491053,                  0,  0.256800106491053,
    -0.534511135950792,  1.493258914891174, -0.232744432024604,                  0,  0.232744432024604,
};

static float X[DSP_BLOCK_SIZE];         // temporary input signal
static float Y[DSP_BLOCK_SIZE];         // temporary output signal 
static float S[FILTER_BIQUAD_STATES];   // persistent biquad filter state
static int enable;
static int ledcounter;

static float Power[DSP_BLOCK_SIZE];		// Power float array
static float pow_sum;					// Power pow_sum of the block power
static float pow_sum_old;				// Power pow_sum of previous block
static float pow_rec;					// Power pow_sum for recursive algorithm
static float alpha;						// alpha value
static float amp;
float const LOW_THRES = -20;
float const HIGH_THRES = -3;
bool filter;
double dB;

void process(int sig)
{
	int i;
    int n;
    float temp;
 	double pow_sum = 0;
 	
    // Get a pointer to the current audio block.
    sample_t *audioin  = dsp_get_audio();
    sample_t *audioout = dsp_get_audio();
    
    // Copy audio from left channel to input buffer. Audio samples are 32 bit
    // fixed-point values in the range [-1, 1] so no additional scaling is required.
    for(n=0; n<DSP_BLOCK_SIZE; ++n) {
    	X[n] = audioin[n].left;
    }
    
	// Square X[n] and add to pow_sum
	// Linear buffering
	for(n=0; n<DSP_BLOCK_SIZE; ++n) {
		pow_sum += X[n] * X[n];
	}
	
	// Decide if power is increasing or decreasing 
	// apply alpha regarding to that
	if (pow_sum > pow_sum_old) {
		alpha = 0.8187;
	} else {
		alpha = 0.99;
	}
	
	pow_sum_old = pow_sum;
	
	// Recursive averaging 
	pow_rec = (alpha*pow_rec) + (1-alpha)*pow_sum;      	
	
    if (true) {
		if (filter) {
			float value = 10*log10(pow_rec);
			dB = value;
			if (value < LOW_THRES) {
				temp = (value + 20);
				amp = pow(10,(temp*0.1));
			} else if (value > HIGH_THRES) {
				temp = (-1.333333 * value) + (3*-1.333333);
				amp = pow(10,(temp*0.1));
			} else {
				amp = 1;
			}
			for(n=0; n<DSP_BLOCK_SIZE; n++) {
					Y[n] = X[n] * amp;
			}
		} else {
			memcpy(Y, X, sizeof(X));
			}	
    } 
          
    for(n=0; n<DSP_BLOCK_SIZE; ++n) {
        audioout[n].left = Y[n];
        audioout[n].right = Y[n];
    }
}

static void keyboard(int sig)
{
	unsigned int keys = dsp_get_keys();
    // Button 1 (bit value 1) turns on the filering in the process callback.
    // Button 2 (bit value 2) turns off the filering in the process callback.
    if(keys & 1) {
        enable = 1;
        filter = false;
    } else if(keys & 2) {
        enable = 0;
    } else if(keys & 4) {
    	printf("Power is  %f\t Gain is %f\n and dB is %f", pow_rec, amp, dB);
    } else if(keys & 8) {
    		filter = true;
    }
    
}

static void timer(int sig)
{
    ledcounter = (ledcounter+1) & 0x3F;
    dsp_set_leds(ledcounter);
}

void main()
{   
	pow_sum = 0;
	pow_sum_old = 0;
	pow_rec = 0;
	alpha = 0;
	amp = 0;
	dB = 0;
	filter = false;
    memset(S, 0, sizeof(S));
    
    // Setup the DSP framework
    dsp_init();
 
    // Register interrupt handlers:
    // SIG_SP1: the audio callback
    // SIG_USR0: the keyboard callback
    // SIG_TMZ: the timer callback
    interrupt(SIG_SP1, process);
    interrupt(SIG_USR0, keyboard);
    interrupt(SIG_TMZ, timer);
    timer_set(9830400, 9830400);
    timer_on();
    
    // Enable the DSP framework.
    dsp_start();
    
    // Everything is handled by the interrupt handlers, so just put an empty
    // idle-loop here. If not, the program falls back to an equivalent idle-loop
    // in the run-time library when main() returns.
    for(;;) {
    	
        idle();
    }
}

