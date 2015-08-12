format long
recObj = audiorecorder;
disp('Start speaking')
recordblocking(recObj,2);
disp('End of recording');

data = getaudiodata(recObj);

P_real = averagingReal(data);
alpha = difference(P_real, data);
P_rec = averaging(alpha, data); 


b = buffer(data, 256);
whos

figure 
plot(P_real);
title('P real');
figure 
plot(data);
title('data');
figure 
plot(P_rec);
title('P rec');