% Values for the bandpass 
A_stop1 = 100;
F_stop1 = 200;
F_pass1 = 300;
F_pass2 = 1300;
F_stop2 = 1400;
A_stop2 = 100;
A_pass = 1;
Fs = 8000;
Filtering = 1;

% Design and create Bandpass filter
BandPassSpecObj = fdesign.bandpass(F_stop1, F_pass1, ...
    F_pass2, F_stop2, A_stop1,A_pass,A_stop2, Fs);
BandPassFilt = design(BandPassSpecObj,'butter');

% Graphical representaion of the bandpass filter 
% Uncomment for usage, requires DSP toolbox for MATLAB
% fvtool(BandPassFilt)

