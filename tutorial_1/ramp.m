function r = ramp(t)
% ramp function
% usage:
%   r = ramp(t)
%   enter the time vector t as an arguement and the output
%   will be t for every value of t greater than 0.
r = t.*(t>0);
