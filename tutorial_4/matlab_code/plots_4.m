omega = linspace(0.001,pi,500);
N = 4;

Omega = [-fliplr(omega) omega];
Htf = H(Omega,N);

subplot(2,1,1);
plot(Omega,abs(Htf));
ylabel('Amplitude')
subplot(2,1,2);
plot(Omega,angle(Htf).*(180/pi));
xlabel('Frequency (rad/sec)')
ylabel('Phase Angle')