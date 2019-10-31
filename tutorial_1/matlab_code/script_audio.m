dur = 1.0;
fs = 44100;
t = 0:(1/fs):dur;
x = sin(2*pi*2000*t);
soundsc(x,fs)