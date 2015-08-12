




% Add noise to baby recordings
LOrig1=length(xOrig1);
LOrig2=length(xOrig2);
xLen=min(LOrig1);
xLen = min(LOrig1,LOrig2); % xLen is the shortest length
Nstrength = 10; % Controls the strength of the noise added to the signal
disp('Adderad brusstyrka: '),disp(Nstrength)
x=xOrig1(1:xLen)+Nstrength*xOrig2(1:xLen);
% x=xOrig1(1:xLen);

% Create a buffer with 40 samples in each frame
blocklength=40;
buff = buffer(x,blocklength);
buffSquared = buff.^2;

% Calculate the average power for each frame
for i=1:length(buffSquared)
    Frameaverage(i,1)=sum(buffSquared(1:end,i))/blocklength;
end


figure(1)
subplot(211)
plot(x(1:xLen)), title('Babyljud')
subplot(212)
plot(Frameaverage,'r'), title('Short-time energy')