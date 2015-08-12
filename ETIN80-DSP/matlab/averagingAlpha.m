function P=averagingAlpha(alpha, data)
P(1) = 0;
B = @(n) (1-alpha)*(data(n));

for n = 1:size(data)-1
    R = B(n+1);
    A =  alpha*P(n);
    P(n+1,1) =  A + R;
end
end
