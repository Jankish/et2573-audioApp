% Rensa gamla variabler och figurer:
close all
clear all
% Vi f?ruts?tter nu att ljudfilerna vi anv?nder har 8 kHz sampelfrekvens:
%fs = 8000; 

% L?s in ljudfiler (se till att det blir r?tt s?kv?g)
fileName1=('baby_signals/baby-talking_8khz.wav');
[xOrig1, fsOrig1] = audioread(fileName1);
fileName2=('noise_signals/ventilation_8khz.wav');
[xOrig2, fsOrig2] = audioread(fileName2);
% Om sampelfrekvens beh?vs kan den l?sas in s?h?r:
%    [xOrig1, fsOrig1] = audioread(fileName1);

% L?gg samman babyljud och st?rning:
LOrig1=length(xOrig1);
LOrig2=length(xOrig2);
xLen = min(LOrig1,LOrig2); % xLen ?r nu den kortaste l?ngden
Nstrength = 2; % Styr hur stark st?rningen ska vara
disp('Adderad brusstyrka: '),disp(Nstrength)
x=xOrig1(1:xLen)+Nstrength*xOrig2(1:xLen);

blen=128;

buff = buffer(x,blen);

buffSquared = buff.^2;

for i=1:length(buff)
    Frameaverage(i,1)=sum(buffSquared(1:end,i))/blen;
end
figure(1)
subplot(311)
plot(xOrig1(1:xLen)), title('Babyljud')
subplot(312)
plot(x), title('Babyljud plus st?rning')
subplot(313)
plot(Frameaverage,'r'), title('Short-time energy')