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

m1 = length(xOrig1);
m2 = length(xOrig2);
m3 = length(xOrig3);

n1 = pow2(nextpow2(m1));
n2 = pow2(nextpow2(m2));
n3 = pow2(nextpow2(m3));


y1 = fft(xOrig1,n1);
f1 = (0:n1-1)*(fsOrig1/n1);

power1 = y1.*conj(y1)/n1;

plot(f1,power1)
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf baby_signals/baby-crying.wav}')

y2 = fft(xOrig2,n2);
f2 = (0:n2-1)*(fsOrig2/n2);

power2 = y2.*conj(y2)/n2;

figure
plot(f2,power2)
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf baby_signals/baby-crying-01.wav}')


y3 = fft(xOrig3,n3);
f3 = (0:n3-1)*(fsOrig3/n3);

power3 = y3.*conj(y3)/n3;

figure
plot(f3,power3)
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf baby_signals/baby-talking_8khz.wav}')


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