function [status, start_time] = start_scan
% This code will trigger the 3T GE scanner at CNI using the E-prime trigger
% cable. --Michael 09/30/2013

try
    RestrictKeysForKbCheck([KbName('S'), KbName('5')]);
    start_time = KbWait(-3,2); % -3 = device number, 2 = single keystroke
    RestrictKeysForKbCheck([KbName('A'), KbName('B'), KbName('C'), KbName('D'), KbName('G'), KbName('.')]);
catch
    err
end

if exist('err','var') == 0
    start_time  = GetSecs;
    status = 0;
else
    status = 1;
end

end