function Preal = averagingReal(data)
Preal(1) = 0;
    B = @(n, k) data(n-k).^2;
    N = size(data);
    N = N(1);
for n = 1:100:size(data)-1
    sumPoint = 0;
    for k = 1:n-1
        sumPoint = sumPoint + B(n,k);
    end
    Preal(n, 1) = sumPoint/n;
    n
    N
end
end
    