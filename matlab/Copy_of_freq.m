close all
clear all

% Read the audio files and extract the sample rate
%fileName1=('baby_signals/baby-crying.wav');
fileName1=('noise_signals/bird_chirp_ext_8khz.wav');
[xOrig1, fsOrig1] = audioread(fileName1);
%fileName2=('baby_signals/baby-crying-01.wav');
fileName2=('noise_signals/ventilation_8khz.wav');
[xOrig2, fsOrig2] = audioread(fileName2);
%fileName2=('baby_signals/baby-talking_8khz.wav');
fileName2=('noise_signals/traffic-noise-01(dobelnsgatan).wav');
[xOrig3, fsOrig3] = audioread(fileName2);

% disp('Baby-crying'), disp(fsOrig1);
% disp('Baby-crying-01'), disp(fsOrig2);
% disp('Baby-talking_8khz'), disp(fsOrig3);

% Get the length of the audio file
m1 = length(xOrig1);
m2 = length(xOrig2);
m3 = length(xOrig3);
% Find a propert transform length
n1 = pow2(nextpow2(m1));
n2 = pow2(nextpow2(m2));
n3 = pow2(nextpow2(m3));

% Preform FFT on the different audio files 
% and rearrange so that they are zero-centered
% First audio file to process
y1 = fft(xOrig1,n1);
f1 = (0:n1-1)*(fsOrig1/n1);
power1 = y1.*conj(y1)/n1;

% y1c = fftshift(y1);         
% fs1c = (-n1/2:n1/2-1)*(fsOrig1/n1);  
% power1c = y1c.*conj(y1c)/n1;  

% Second audio file to process
y2 = fft(xOrig2,n2);
f2 = (0:n2-1)*(fsOrig2/n2);
power2 = y2.*conj(y2)/n2;

% y2c = fftshift(y2);          
% fs2c = (-n2/2:n2/2-1)*(fsOrig2/n2);  
% power2c = y2c.*conj(y2c)/n2;   

% Third audio file
y3 = fft(xOrig3,n3);
f3 = (0:n3-1)*(fsOrig3/n3);
power3 = y3.*conj(y3)/n3;

% y3c = fftshift(y3);          
% fs3c = (-n3/2:n3/2-1)*(fsOrig3/n3);  
% power3c = y3c.*conj(y3c)/n3;   

% Plot the all FFT into one figure
figure
plot1 = subplot(311)
plot(f1,abs(y1))
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf bird chirp ext 8khz.wav}')
plot2 = subplot(312)
plot(f2,abs(y2))
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf ventilation 8khz.wav}')
plot3 = subplot(313)
plot(f3,abs(y3))
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf traffic noise 01(dobelnsgatan).wav}')

linkaxes([plot1,plot2,plot3],'y');

% fax_bins1 = [0:N1-1];
% fax_bins2 = [0:N2-1];
% fax_bins3 = [0:N3-1];
% 
% fax_Hz1 = fax_bins1*fsOrig1/N1;
% fax_Hz2 = fax_bins2*fsOrig1/N2;
% fax_Hz3 = fax_bins3*fsOrig3/N3;
% 
% figure(1)
% subplot(311)
% plot(fax_Hz1, abs(fft(xOrig1)));
% subplot(312)
% plot(fax_Hz2, abs(fft(xOrig2)));
% subplot(313)
% plot(fax_Hz3, abs(fft(xOrig3)));

% segmentlen=100;
% noverlap=90;
% NFFT=128;


%spectrogram(xOrig1,segmentlen,noverlap,NFFT,fsOrig1,'yaxis')
%cceps(xOrig1)