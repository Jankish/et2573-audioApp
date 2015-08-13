close all;
clear all;

makeSound;

% Predefined values for the algorithm and treshold
blocklength=10;
alpha = 0.5;
threshold = 1;
alarm = 0;

% For plotting purpose
% x0=x_BC10;
% x1=x_BC11;
% x2=x_BC12;
% x3=x_BC13;

% x0=x_BC20;
% x1=x_BC21;
% x2=x_BC22;
% x3=x_BC23;

x0=x_BT0;
x1=x_BT1;
x2=x_BT2;
x3=x_BT3;

% Active filtering
% butterFilter;
% [x0,x1,x2,x3] = filterPass(x0,x1,x2,x3,BandPassFilt);

% Create a buffer with 10 samples in each frame
% Baby crying 1
buff_B0 = buffer(x0,blocklength);
buff_B1 = buffer(x1,blocklength);
buff_B2 = buffer(x2,blocklength);
buff_B3 = buffer(x3,blocklength);

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

% Perform reverse averaging 
[P0] = reverseAverg(buffSquared0, n0, alpha);
[P1] = reverseAverg(buffSquared1, n1, alpha);
[P2] = reverseAverg(buffSquared2, n2, alpha);
[P3] = reverseAverg(buffSquared3, n3, alpha);

% Calculate whether or not the signal will trigger the alarm
[Trace0, ring0, value0] = ringAlarm(P0, threshold, alarm);
[Trace1, ring1, value1] = ringAlarm(P1, threshold, alarm);
[Trace2, ring2, value2] = ringAlarm(P2, threshold, alarm);
[Trace3, ring3, value3] = ringAlarm(P3, threshold, alarm);

% Clean plot
figure('units','normalized','outerposition',[0 0 1 1])
subplot(3,4,1)
plot1=plot(x0,'b');
title('clean');
subplot(3,4,5)
plot2=plot(P0,'b');
title('recursive averaging');
subplot(3,4,9)
plot3=plot(P0,'b');hold on;
plot(ring0,value0,'or');
hline=refline(0,threshold);
hline.Color='g';
hline=refline(0,threshold+1);
hline.Color='r';
title('treshold and trigger point of the alarm');

% Bird and ventilation plot
subplot(3,4,2)
plot4=plot(x1,'b');
title('bird and ventilation noise added');
subplot(3,4,6)
plot5=plot(P1,'b');
title('recursive averaging');
subplot(3,4,10)
plot6=plot(P1,'b');hold on;
plot(ring1,value1,'or');
hline=refline(0,threshold);
hline.Color='g';
hline=refline(0,threshold+1);
hline.Color='r';
title('treshold and trigger point of the alarm');

% Noise plot
subplot(3,4,3)
plot7=plot(x2,'b');
title('all noise files added');
subplot(3,4,7)
plot8=plot(P2,'b');
title('recursive averaging');
subplot(3,4,11)
plot9=plot(P2,'b');hold on;
plot(ring2,value2,'or');
hline=refline(0,threshold);
hline.Color='g';
hline=refline(0,threshold+1);
hline.Color='r';
title('treshold and trigger point of the alarm');

% Amplified noise plot
subplot(3,4,4)
plot10=plot(x3,'b');
title('all noise files added and amplified');
subplot(3,4,8)
plot11=plot(P3,'b');
title('recursive averaging');
subplot(3,4,12)
plot12=plot(P3,'b');hold on;
plot(ring3,value3,'or');
hline=refline(0,threshold);
hline.Color='g';
hline=refline(0,threshold+1);
hline.Color='r';
title('treshold and trigger point of the alarm');

