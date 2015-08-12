function aCurrent = difference(P, data)


diffCurrent = 99999999999999;
aCurrent = 0;
for a = 9999000:9999700;
    a  = a / 1e7
    Pave = averagingAlpha(data, a);
    diff = 0;
    for n = 1:100:size(P)-1
        diff = abs(P(n)-Pave(n)) + diff;
    end
    if diffCurrent > diff
        diffCurrent = diff;
        aCurrent = a;
  %      plot(P)
  %      hold on
  %     plot(Pave, 'r')
        
    end
    
end
end



        
