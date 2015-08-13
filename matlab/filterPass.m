function [ x0,x1,x2,x3 ] = filterPass( x0,x1,x2,x3,BandPassFilt )
%   FILTERPASS Function filter four signals and outputs them again
%   
%   Input:four discretized signals
%   Output:four filtered signals
    
    x0=filter(BandPassFilt, x0);
    x1=filter(BandPassFilt, x1);
    x2=filter(BandPassFilt, x2);
    x3=filter(BandPassFilt, x2);

end

