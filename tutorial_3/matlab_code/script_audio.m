% Script plays audio of signal x(t)
dur = 2.0;
fs = 44100;
t = 0:(1/fs):dur;

% Complex representation of the signal
xe1 = 0.5*(exp(1i*440*2*pi*t) + exp(-1i*440*2*pi*t));
xe2 = 0.5*(exp(1i*554*2*pi*t) + exp(-1i*554*2*pi*t));
xe3 = 0.5*(exp(1i*659*2*pi*t) + exp(-1i*659*2*pi*t));

x = xe1 + xe2 + xe3;

sound(x,fs)