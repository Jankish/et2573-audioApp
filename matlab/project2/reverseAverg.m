function [ P ] = reverseAverg( buffer, alpha )
%   SIMPLE_REVERSEAVERG function calculates reverse averaging 
%   given a squared buffer. The buffer is squared and the frames
%   are summed up and placed in a cell in vec-array. Each cell 
%   represent a frame and is later used in the recursive averaging
%   algorithm. The alpha value is 0.5. 
%   
%   Input: buffSquared, alpha
%   Output: P-array with reverse averaging power calculations
    
    % The buffer-matrix is squared and summed to fit in
    % vec-array
    n=size(buffer,2);
    buffSquared=buffer.^2;
    for i=1:n
        vec(i,1)=sum(buffSquared(1:end,i));
    end
    
    % The vec-array is used to perform recursive averaging, which
    % is stored in P-array
    rows = size(vec,1);
    P=zeros(rows,1);
    P(1,1)=0;
    for i=2:size(vec,1)-1
        P(i,1)=alpha*P(i-1,1) + (1-alpha)*vec(i,1);
    end
end

