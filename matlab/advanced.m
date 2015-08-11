close all
clear all

A_stop1 = 60;
F_stop1 = 200;
F_pass1 = 300;
F_pass2 = 1300;
F_stop2 = 1400;
A_stop2 = 60;
A_pass = 1;
Fs = 8000;

BandPassSpecObj = fdesign.bandpass(F_stop1, F_pass1, F_pass2, F_stop2, A_stop1,A_pass,A_stop2, Fs);

BandPassFilt = design(BandPassSpecObj,'butter');
fvtool(BandPassFilt)

%fileName1=('baby_signals/baby-crying-01.wav');
fileName1=('noise_signals/traffic-noise-01(dobelnsgatan).wav');
[xOrig1, fsOrig1] = audioread(fileName1);

y = filter(BandPassFilt, xOrig1);
t = [1:length(y)]./fsOrig1;

% Frequency spectrum after filtering
m1 = length(y);
n1 = pow2(nextpow2(m1));

y1 = fft(y,n1);
f1 = (0:n1-1)*(fsOrig1/n1);
power1 = y1.*conj(y1)/n1;

y1c = fftshift(y1);         
fs1c = (-n1/2:n1/2-1)*(fsOrig1/n1);  
power1c = y1c.*conj(y1c)/n1;

figure;
plot(fs1c,power1c);
% figure;
% plot(t,y,'g');hold on;
% figure;
% plot(t,xOrig1,'r');


