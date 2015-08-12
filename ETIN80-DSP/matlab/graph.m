figure

for n=0.001:0.001:0.1
     %fprintf('Decibel %d has the value %.40f\n', n, power(10,n+40/10));
     plot(n,10*log10(n+40),'r');
     hold on
end


