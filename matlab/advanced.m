close all
clear all

A_stop1 = 60;
F_stop1 = 200;
F_pass1 = 300;
F_pass2 = 1300;
F_stop2 = 1400;
A_stop2 = 60;
A_pass = 20;
Fs = 8000;

BandPassSpecObj = fdesign.bandpass(F_stop1, F_pass1, F_pass2, F_stop2, A_stop1,A_pass,A_stop2, Fs);

BandPassFilt = design(BandPassSpecObj);

fvtool(BandPassFilt)