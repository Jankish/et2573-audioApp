function [ sample,value ] = ringAlarm( P, threshold)
%   ringAlarm calculates when the alarm should go off
%   The alarm goes off when the threshold value has been 
%   breached 5 times, which means that at least 5 frames 
%   must have contained the wanted sound.
%
%   Input: P-power array, threshold value, alarm counter
%   Output: Trace-array, index for trigger frame, value of the frame 

    % Alarm counter and return values declared
    sample=0;
    value=0;
    alarm=0;
    
    for i=1:size(P,1)
        P(i,1);
        % Validates whether or not the power value has
        % breached the threshold
        if  P(i,1) > threshold
            alarm=alarm+1;
            % If 5 frames have breached the threshold
            % the alarm is set to go off
            if alarm == 5
                sample=i;
                value=P(i,1);
                %disp('ALARM!');
            end
        end
    end
end

