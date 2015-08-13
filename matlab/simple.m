makeSound;

% For plotting purpose
x0=x_BC10;
x1=x_BC11;
x2=x_BC12;
x3=x_BC13;

% x0=X_BC20;
% x1=X_BC21;
% x3=X_BC22;
% x4=X_BC23;
% 
% x0=X_BT0;
% x1=X_BT1;
% x3=X_BT2;
% x4=X_BT3;

% Predefined values for the algorithm and treshold
blocklength=10;
alpha = 0.5;
threshold = 2;
alarm = 0;

% Create a buffer with 10 samples in each frame
% Baby crying 1
buff_B0 = buffer(x_BC10,blocklength);
buff_B1 = buffer(x_BC11,blocklength);
buff_B2 = buffer(x_BC12,blocklength);
buff_B3 = buffer(x_BC13,blocklength);

% Baby crying 2
% buff_B0 = buffer(x_BC20,blocklength);
% buff_B1 = buffer(x_BC21,blocklength);
% buff_B2 = buffer(x_BC22,blocklength);
% buff_B3 = buffer(x_BC23,blocklength);

% Baby talking
% buff_B0 = buffer(x_BT0,blocklength);
% buff_B1 = buffer(x_BT1,blocklength);
% buff_B2 = buffer(x_BT2,blocklength);
% buff_B3 = buffer(x_BT3,blocklength);

% m=size(buff_BC10,1); % row
% Length of the columns
n0=size(buff_B0,2); 
n1=size(buff_B1,2);
n2=size(buff_B2,2);
n3=size(buff_B3,2);

% Square every sample in the buffer
buffSquared0 = buff_B0.^2;
buffSquared1 = buff_B1.^2;
buffSquared2 = buff_B2.^2;
buffSquared3 = buff_B3.^2;


% for i=1:n
%     vec(i,1)=sum(buffSquared(1:end,i));
% end


% v_row = size(vec,1);
% P=zeros(v_row,1);
% 
% P(1,1)=0;
% for i=2:size(vec,1)
%     P(i,1)=alpha*P(i-1,1) + (1-alpha)*vec(i,1);
% end
[P0] = simple_reverseAverg(buffSquared0, n0, alpha);
[P1] = simple_reverseAverg(buffSquared1, n1, alpha);
[P2] = simple_reverseAverg(buffSquared2, n2, alpha);
[P3] = simple_reverseAverg(buffSquared3, n3, alpha);

% row=size(P,1);
% Trace=zeros(row,1);
% 
% 
% for i=1:row
%    if  P(i,1) > threshold
%        Trace(i,1)=P(i,1);
%        alarm=alarm+1
%        if alarm == 5
%            ring=i;
%            value=P(i,1);
%        end
%    end
% end
alarm
[Trace0, ring0, value0] = ringAlarm(P0, threshold, alarm);
alarm
[Trace1, ring1, value1] = ringAlarm(P1, threshold, alarm);
alarm
[Trace2, ring2, value2] = ringAlarm(P2, threshold, alarm);
alarm
[Trace3, ring3, value3] = ringAlarm(P3, threshold, alarm);

% Clean plot
figure
subplot(3,4,1)
plot1=plot(x0,'b');
title('signal');
subplot(3,4,5)
plot2=plot(P0,'b');
title('power from the signal');
subplot(3,4,9)
plot3=plot(P0,'b');hold on;
plot(ring0,value0,'or');
hline=refline(0,2);
hline.Color='r';
title('treshold and trigger point of the alarm');

% Bird plot
subplot(3,4,2)
plot4=plot(x1,'b');
title('signal');
subplot(3,4,6)
plot5=plot(P1,'b');
title('power from the signal');
subplot(3,4,10)
plot6=plot(P1,'b');hold on;
plot(ring1,value1,'or');
hline=refline(0,2);
hline.Color='r';
title('treshold and trigger point of the alarm');

% Noise plot
subplot(3,4,3)
plot7=plot(x2,'b');
title('signal');
subplot(3,4,7)
plot8=plot(P2,'b');
title('power from the signal');
subplot(3,4,11)
plot9=plot(P2,'b');hold on;
plot(ring2,value2,'or');
hline=refline(0,2);
hline.Color='r';
title('treshold and trigger point of the alarm');

% Amplified noise plot
subplot(3,4,4)
plot10=plot(x3,'b');
title('signal');
subplot(3,4,8)
plot11=plot(P3,'b');
title('power from the signal');
subplot(3,4,12)
plot12=plot(P3,'b');hold on;
plot(ring3,value3,'or');
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