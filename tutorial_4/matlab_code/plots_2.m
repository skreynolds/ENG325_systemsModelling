omega = linspace(-3*pi,3*pi,500);

X = 4*(cos(2.*omega) + cos(omega) + 0.5) + ...
        3*exp(-4i.*omega).*(cos(omega)+0.5);

% X = 2*((sin(2.5*omega)/sin(0.5*omega)).*exp(-2i.*omega) ...
%         - (sin(1.5*omega)/sin(0.5*omega)).*exp(-6j.*omega));
subplot(2,1,1);
plot(omega,abs(X));
ylabel('Amplitude')
subplot(2,1,2);
plot(omega,angle(X).*(180/pi));
xlabel('Frequency (rad/sec)')
ylabel('Phase Angle')