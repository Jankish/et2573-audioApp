% Clear and close all
close all
clear all

% Read the audio files and extract fs
fileName1=('baby_signals/baby-talking_8khz.wav');
[xOrig1, fsOrig1] = audioread(fileName1);
fileName2=('noise_signals/ventilation_8khz.wav');
[xOrig2, fsOrig2] = audioread(fileName2);


% Add noise to baby recordings
LOrig1=length(xOrig1);
LOrig2=length(xOrig2);
xLen=min(LOrig1);
xLen = min(LOrig1,LOrig2); % xLen ?r nu den kortaste l?ngden
Nstrength = 10; % Styr hur stark st?rningen ska vara
disp('Adderad brusstyrka: '),disp(Nstrength)
x=xOrig1(1:xLen)+Nstrength*xOrig2(1:xLen);
% x=xOrig1(1:xLen);

blocklength=40;

buff = buffer(x,blocklength);

buffSquared = buff.^2;

for i=1:length(buffSquared)
    Frameaverage(i,1)=sum(buffSquared(1:end,i))/blocklength;
end
figure(1)
subplot(211)
plot(x(1:xLen)), title('Babyljud')
subplot(212)
plot(Frameaverage,'r'), title('Short-time energy')