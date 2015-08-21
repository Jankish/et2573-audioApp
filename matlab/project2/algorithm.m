close all;
clear all;

makeSound;

% Predefined values for the algorithm and treshold
blocklength=10;
alpha = 0.5;
threshold = 1;
filtering = 0;

% Active the advanced algorithm (filtering)
% butterFilter;

%% Plotting the first set (Baby crying)
x0=x_BC10;
x1=x_BC11;
x2=x_BC12;
x3=x_BC13;

if filtering == 1 
    [x0,x1,x2,x3] = filterPass(x0,x1,x2,x3,BandPassFilt);
end
% Create a buffer with 10 samples in each frame
% Generic name for the buffers
buff_B0 = buffer(x0,blocklength);
buff_B1 = buffer(x1,blocklength);
buff_B2 = buffer(x2,blocklength);
buff_B3 = buffer(x3,blocklength);

% Perform reverse averaging 
[P0] = recursiveAverg(buff_B0, alpha);
[P1] = recursiveAverg(buff_B1, alpha);
[P2] = recursiveAverg(buff_B2, alpha);
[P3] = recursiveAverg(buff_B3, alpha);

% Calculate whether or not the signal will trigger the alarm
[sample0, value0] = ringAlarm(P0, threshold);
[sample1, value1] = ringAlarm(P1, threshold);
[sample2, value2] = ringAlarm(P2, threshold);
[sample3, value3] = ringAlarm(P3, threshold);

%
% Clean plot
figure('units','normalized','outerposition',[0 0 1 1])
subplot(3,4,1)
plot1=plot(x0,'b');
if filtering==1
    title('clean (filtered)');
else
    title('clean');
end
subplot(3,4,5)
plot2=plot(P0,'b');
title('recursive averaging');
subplot(3,4,9)
plot3=plot(P0,'b');hold on;
plot(sample0,value0,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');

% Bird and ventilation plot
subplot(3,4,2)
plot4=plot(x1,'b');
if filtering==1
    title('bird and ventilation noise added (filtered)');
else
    title('bird and ventilation noise added');
end
subplot(3,4,6)
plot5=plot(P1,'b');
title('recursive averaging');
subplot(3,4,10)
plot6=plot(P1,'b');hold on;
plot(sample1,value1,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');

% Noise plot
subplot(3,4,3)
plot7=plot(x2,'b');
if filtering==1
    title('all noise files added (filtered)');
else
    title('all noise files added');
end
subplot(3,4,7)
plot8=plot(P2,'b');
title('recursive averaging');
subplot(3,4,11)
plot9=plot(P2,'b');hold on;
plot(sample2,value2,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');

% Amplified noise plot
subplot(3,4,4)
plot10=plot(x3,'b');
if filtering==1
    title('all noise files added and amplified (filtered)');
else
    title('all noise files added and amplified');
end
subplot(3,4,8)
plot11=plot(P3,'b');
title('recursive averaging');
subplot(3,4,12)
plot12=plot(P3,'b');hold on;
plot(sample3,value3,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');
set(gcf,'name','Baby Crying.wav set','numbertitle','off')

%% Plotting the second set 

x0=x_BC20;
x1=x_BC21;
x2=x_BC22;
x3=x_BC23;


if filtering == 1 
    [x0,x1,x2,x3] = filterPass(x0,x1,x2,x3,BandPassFilt);
end
% Create a buffer with 10 samples in each frame
% Generic name for the buffers
buff_B0 = buffer(x0,blocklength);
buff_B1 = buffer(x1,blocklength);
buff_B2 = buffer(x2,blocklength);
buff_B3 = buffer(x3,blocklength);

% Perform reverse averaging 
[P0] = recursiveAverg(buff_B0, alpha);
[P1] = recursiveAverg(buff_B1, alpha);
[P2] = recursiveAverg(buff_B2, alpha);
[P3] = recursiveAverg(buff_B3, alpha);

% Calculate whether or not the signal will trigger the alarm
[sample0, value0] = ringAlarm(P0, threshold);
[sample1, value1] = ringAlarm(P1, threshold);
[sample2, value2] = ringAlarm(P2, threshold);
[sample3, value3] = ringAlarm(P3, threshold);

%
% Clean plot
figure('units','normalized','outerposition',[0 0 1 1])
subplot(3,4,1)
plot1=plot(x0,'b');
if filtering==1
    title('clean (filtered)');
else
    title('clean');
end
subplot(3,4,5)
plot2=plot(P0,'b');
title('recursive averaging');
subplot(3,4,9)
plot3=plot(P0,'b');hold on;
plot(sample0,value0,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');

% Bird and ventilation plot
subplot(3,4,2)
plot4=plot(x1,'b');
if filtering==1
    title('bird and ventilation noise added (filtered)');
else
    title('bird and ventilation noise added');
end
subplot(3,4,6)
plot5=plot(P1,'b');
title('recursive averaging');
subplot(3,4,10)
plot6=plot(P1,'b');hold on;
plot(sample1,value1,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');

% Noise plot
subplot(3,4,3)
plot7=plot(x2,'b');
if filtering==1
    title('all noise files added (filtered)');
else
    title('all noise files added');
end
subplot(3,4,7)
plot8=plot(P2,'b');
title('recursive averaging');
subplot(3,4,11)
plot9=plot(P2,'b');hold on;
plot(sample2,value2,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');

% Amplified noise plot
subplot(3,4,4)
plot10=plot(x3,'b');
if filtering==1
    title('all noise files added and amplified (filtered)');
else
    title('all noise files added and amplified');
end
subplot(3,4,8)
plot11=plot(P3,'b');
title('recursive averaging');
subplot(3,4,12)
plot12=plot(P3,'b');hold on;
plot(sample3,value3,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');
set(gcf,'name','Baby Crying1.wav set','numbertitle','off')


%% Plotting the third set
x0=x_BT0;
x1=x_BT1;
x2=x_BT2;
x3=x_BT3;


if filtering == 1 
    [x0,x1,x2,x3] = filterPass(x0,x1,x2,x3,BandPassFilt);
end
% Create a buffer with 10 samples in each frame
% Generic name for the buffers
buff_B0 = buffer(x0,blocklength);
buff_B1 = buffer(x1,blocklength);
buff_B2 = buffer(x2,blocklength);
buff_B3 = buffer(x3,blocklength);

% Perform reverse averaging 
[P0] = recursiveAverg(buff_B0, alpha);
[P1] = recursiveAverg(buff_B1, alpha);
[P2] = recursiveAverg(buff_B2, alpha);
[P3] = recursiveAverg(buff_B3, alpha);

% Calculate whether or not the signal will trigger the alarm
[sample0, value0] = ringAlarm(P0, threshold);
[sample1, value1] = ringAlarm(P1, threshold);
[sample2, value2] = ringAlarm(P2, threshold);
[sample3, value3] = ringAlarm(P3, threshold);

%
% Clean plot
figure('units','normalized','outerposition',[0 0 1 1])
subplot(3,4,1)
plot1=plot(x0,'b');
if filtering==1
    title('clean (filtered)');
else
    title('clean');
end
subplot(3,4,5)
plot2=plot(P0,'b');
title('recursive averaging');
subplot(3,4,9)
plot3=plot(P0,'b');hold on;
plot(sample0,value0,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');

% Bird and ventilation plot
subplot(3,4,2)
plot4=plot(x1,'b');
if filtering==1
    title('bird and ventilation noise added (filtered)');
else
    title('bird and ventilation noise added');
end
subplot(3,4,6)
plot5=plot(P1,'b');
title('recursive averaging');
subplot(3,4,10)
plot6=plot(P1,'b');hold on;
plot(sample1,value1,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');

% Noise plot
subplot(3,4,3)
plot7=plot(x2,'b');
if filtering==1
    title('all noise files added (filtered)');
else
    title('all noise files added');
end
subplot(3,4,7)
plot8=plot(P2,'b');
title('recursive averaging');
subplot(3,4,11)
plot9=plot(P2,'b');hold on;
plot(sample2,value2,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');

% Amplified noise plot
subplot(3,4,4)
plot10=plot(x3,'b');
if filtering==1
    title('all noise files added and amplified (filtered)');
else
    title('all noise files added and amplified');
end
subplot(3,4,8)
plot11=plot(P3,'b');
title('recursive averaging');
subplot(3,4,12)
plot12=plot(P3,'b');hold on;
plot(sample3,value3,'or');
hline=refline(0,threshold);
hline.Color='g';
title('treshold and trigger point of the alarm');
set(gcf,'name','Baby talking.wav set','numbertitle','off')

%%

