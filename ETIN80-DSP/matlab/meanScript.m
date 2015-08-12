close all
clear all
format long
recObj = audiorecorder;
disp('Start speaking')
recordblocking(recObj,5);
disp('End of recording');

audio = getaudiodata(recObj);

%audio = audioread('gunshot.wav');

buff = buffer(audio, 256);


m = size(buff, 1); % row
n = size(buff, 2); % columns

buffSquared = buff.^2;

a1 = 0.9910;
a2 = 0.9903;

alpha = a1;

 for i = 1:n
      vec(i, 1) = sum(buffSquared(1:end,i));
 end 
 
row = size(vec, 1);
 
P = zeros(row,1);
P(1,1) = 0;
 for i = 2:size(vec,1)-1
     if vec(i,1) > vec(i-1,1)
         alpha = a2;
     else
         alpha = a1;
     end
     P(i,1) = alpha*P(i-1,1) + (1-alpha)*vec(i,1);
 end
 plot(P, 'r');

% vecRowSize = size(vec, 1);
% 
% buffVec = buffer(vec, 16);
% buffVecRowSize = size(buffVec, 1);
% buffVecColSize = size(buffVec, 2);
% 
% for a = 99990000:1:99990001;
%     a  = a / 1e8
%     position = 1;
%     positionEnd = buffVecRowSize;
%     finishedVec = zeros(vecRowSize, 1);
% 
%     for i = 1:buffVecColSize
%        fragmentVec = averagingAlpha(a, buffSquared(1:end, i));
%         finishedVec(position:positionEnd, 1) = fragmentVec;
%         position = i * buffVecRowSize + 1;
%         positionEnd = i * buffVecRowSize + buffVecRowSize;
%     end
%     
%     plot(fragmentVec);
%     title('recMean');
%     hold on
%     pause
%     
% end
% 
% % figure
% % plot(vec)
% 
%figure
%plot(vec, 'b');
%title('x^2');
hold on
% % % whos
figure
plot(audio, 'r');
%title('audio');
% plot(meanVal, 'y');
% title
figure;
plot(filter((1-alpha), [1, -(alpha)], vec));
%title('Filter function matlab');
%filter((1-alpha),[1, -alpha], vector)