makeSound;

% Create a buffer with 40 samples in each frame
blocklength=10;
alpha = 0.5;
treshold = 2;

buff_BC10 = buffer(x_BC10,blocklength);

m=size(buff_BC10,1); % row
n=size(buff_BC10,2); % columns

buffSquared = buff_BC10.^2;



for i=1:n
    vec(i,1)=sum(buffSquared(1:end,i));
end

v_row = size(vec,1);
P=zeros(v_row,1);

P(1,1)=0;
for i=2:size(vec,1)
    P(i,1)=alpha*P(i-1,1) + (1-alpha)*vec(i,1);
end

row=size(P,1);
Trace=zeros(row,1);
Alarm = 0;

for i=1:row
   if  P(i,1) > treshold
       Trace(i,1)=P(i,1);
       Alarm=Alarm+1
       if Alarm == 5
           ring=i;
           value=P(i,1);
       end
   end
end


figure
subplot(3,3,1)
plot1=plot(x_BC10,'b');
title('signal');
subplot(3,3,5)
plotTemp=plot(ring,value,'o');
subplot(3,3,4)
plot2=plot(P,'b');
title('power from the signal');
subplot(3,3,7)
plot3=plot(P,'b');hold on;
plot(ring,value,'or');
hline=refline(0,2);
hline.Color='r';
title('treshold and trigger point of the alarm');

subplot(3,3,2)
plot1=plot(x_BC10,'b');
title('signal');
subplot(3,3,5)
plot2=plot(P,'b');
title('power from the signal');
subplot(3,3,8)
plot3=plot(P,'b');hold on;
plot(ring,value,'or');
hline=refline(0,2);
hline.Color='r';
title('treshold and trigger point of the alarm');

subplot(3,3,3)
plot1=plot(x_BC10,'b');
title('signal');
subplot(3,3,6)
plotTemp=plot(ring,value,'o');
subplot(3,3,4)
plot2=plot(P,'b');
title('power from the signal');
subplot(3,3,9)
plot3=plot(P,'b');hold on;
plot(ring,value,'or');
hline=refline(0,2);
hline.Color='r';
title('treshold and trigger point of the alarm');



% % Calculate the average power for each frame
% for i=1:length(buffSquared)
%     Frameaverage(i,1)=sum(buffSquared(1:end,i))/blocklength;
% end
% 
% 
% figure(1)
% subplot(211)
% plot(x_baby_crying_1(1:xL_baby_crying1)), title('Babyljud')
% subplot(212)
% plot(Frameaverage,'r'), title('recursive averaging')