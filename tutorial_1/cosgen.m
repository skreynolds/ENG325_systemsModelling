function x = cosgen(f,dur)
% cosgen fucntion to generate a cosine wave
% usage:
%   x = cosgen(f,dur)
%   f = desired frequency
%   dur = duration of the waveform in seconds

t = [0:1/(20*f):dur];
y = cos(2*pi*f*t);