t = linspace(-2,5,2000);

y1 = unit(t);
subplot(2,2,1)
plot(t,y1)

y2 = ramp(t);
subplot(2,2,2)
plot(t,y2)

piecewise = t.*(t>=0 & t<=2);
y3 = exp(2*t).*sin(6*t).*unit(t);
subplot(2,2,3)
plot(t,y3.*piecewise)

y4 = 2*(ramp(t+0.5)-2*ramp(t)+ramp(t-0.5));
subplot(2,2,4)
plot(t,y4)