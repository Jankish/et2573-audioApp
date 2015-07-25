close all
clear all

fileName1=('baby_signals/baby-crying.wav');
[xOrig1, fsOrig1] = audioread(fileName1);
fileName2=('baby_signals/baby-crying-01.wav');
[xOrig2, fsOrig2] = audioread(fileName2);
fileName2=('baby_signals/baby-talking_8khz.wav');
[xOrig3, fsOrig3] = audioread(fileName2);

disp('Baby-crying'), disp(fsOrig1);
disp('Baby-crying-01'), disp(fsOrig2);
disp('Baby-talking_8khz'), disp(fsOrig3);

N1 = length(xOrig1);
N2 = length(xOrig2);
N3 = length(xOrig3);

fax_bins1 = [0:N1-1];
fax_bins2 = [0:N2-1];
fax_bins3 = [0:N3-1];

fax_Hz1 = fax_bins1*fsOrig1/N1;
fax_Hz2 = fax_bins2*fsOrig1/N2;
fax_Hz3 = fax_bins3*fsOrig3/N3;

% figure(1)
% subplot(311)
% plot(fax_Hz1, abs(fft(xOrig1)));
% subplot(312)
% plot(fax_Hz2, abs(fft(xOrig2)));
% subplot(313)
% plot(fax_Hz3, abs(fft(xOrig3)));
segmentlen=100;
noverlap=90;
NFFT=128;


spectrogram(xOrig1,segmentlen,noverlap,NFFT,fsOrig1,'yaxis')
%cceps(xOrig1)