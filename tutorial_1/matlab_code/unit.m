function u = unit(t)
% unit step function
% usage:
%   u = unit(t)
%   enter the time vector t as an arguement and the output
%   recieved will be 1 for every value of t greater than 0.
u = t>0;