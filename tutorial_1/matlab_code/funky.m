% Original code
t = -2:0.05:3;
x = sin(2*pi*0.789*t);
plot(t,x), grid on
title('TESTPLOT of SINUSOID')
xlabel('TIME(sec)')

% Additional 3 lines of code
hold on
x1 = cos(2*pi*0.789*t);
plot(t,x1,'r')