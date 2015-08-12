close all
clear all

% Read the audio files and extract the sample rate
fileName1=('baby_signals/baby-crying.wav');
%fileName1=('noise_signals/bird_chirp_ext_8khz.wav');
[xOrig1, fsOrig1] = audioread(fileName1);
fileName2=('baby_signals/baby-crying-01.wav');
%fileName2=('noise_signals/ventilation_8khz.wav');
[xOrig2, fsOrig2] = audioread(fileName2);
fileName3=('baby_signals/baby-talking_8khz.wav');
%fileName3=('noise_signals/traffic-noise-01(dobelnsgatan).wav');
[xOrig3, fsOrig3] = audioread(fileName3);
% Own recordings
fileName4=('noise_signals/noise_ambient_library_2.wav');
[xOrig4, fsOrig4] = audioread(fileName4);
fileName5=('noise_signals/noise_traffic_intersection.wav');
[xOrig5, fsOrig5] = audioread(fileName5);

% Get the length of the audio file
m1 = length(xOrig1);
m2 = length(xOrig2);
m3 = length(xOrig3);

% Own recordings 
m4 = length(xOrig4);
m5 = length(xOrig5);

% Find a propert transform length
n1 = pow2(nextpow2(m1));
n2 = pow2(nextpow2(m2));
n3 = pow2(nextpow2(m3));

% Own recordings
n4 = pow2(nextpow2(m4));
n5 = pow2(nextpow2(m5));

% Preform FFT on the different audio files 
% and rearrange so that they are zero-centered
% First audio file to process
y1 = fft(xOrig1,n1);
f1 = (0:n1-1)*(fsOrig1/n1);
power1 = y1.*conj(y1)/n1;

y1c = fftshift(y1);         
fs1c = (-n1/2:n1/2-1)*(fsOrig1/n1);  
power1c = y1c.*conj(y1c)/n1;  

% Second audio file to process
y2 = fft(xOrig2,n2);
f2 = (0:n2-1)*(fsOrig2/n2);
power2 = y2.*conj(y2)/n2;

y2c = fftshift(y2);          
fs2c = (-n2/2:n2/2-1)*(fsOrig2/n2);  
power2c = y2c.*conj(y2c)/n2;   

% Third audio file
y3 = fft(xOrig3,n3);
f3 = (0:n3-1)*(fsOrig3/n3);
power3 = y3.*conj(y3)/n3;

y3c = fftshift(y3);          
fs3c = (-n3/2:n3/2-1)*(fsOrig3/n3);  
power3c = y3c.*conj(y3c)/n3;

% Own recordings
y4 = fft(xOrig4,n4);
f4 = (0:n4-1)*(fsOrig4/n4);
power4 = y4.*conj(y4)/n4;

y4c = fftshift(y4);          
fs4c = (-n4/2:n4/2-1)*(fsOrig4/n4);  
power4c = y4c.*conj(y4c)/n4;
% Own recordings
y5 = fft(xOrig5,n5);
f5 = (0:n5-1)*(fsOrig5/n5);
power5 = y5.*conj(y5)/n5;

y5c = fftshift(y5);          
fs5c = (-n5/2:n5/2-1)*(fsOrig5/n5);  
power5c = y5c.*conj(y5c)/n5;


% Plot the all FFT into one figure
figure
plot1 = subplot(511);
plot(fs1c,power1c);
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf bird chirp ext 8khz.wav}')
plot2 = subplot(512);
plot(fs2c,power2c);
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf ventilation 8khz.wav}')
plot3 = subplot(513);
plot(fs3c,power3c);
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf traffic noise 01(dobelnsgatan).wav}')
plot4 = subplot(514);
plot(fs4c,power4c);
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf noise ambient library.wav}')
plot5 = subplot(515);
plot(fs5c,power5c);
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf noise traffic intersection.wav}')

linkaxes([plot1,plot2,plot3,plot4,plot5],'y');
