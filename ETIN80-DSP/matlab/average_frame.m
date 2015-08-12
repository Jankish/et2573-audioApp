function value = average_frame(m, n, data)
%AVERAGE_FRAME Summary of this function goes here
%   Detailed explanation goes here


for j = 0
    R = B(n+1);
    A =  alpha*P(n);
    P(n+1,1) =  A + R;
end

end

