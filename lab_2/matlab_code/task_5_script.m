clf;
% Acutal data captured experimentally from the pump tank system
frequency = [0.05 0.1 0.2 0.5 10.0 1.0 2.0 5.0];
y_mag_data = [1.0870 0.9306 0.5670 0.2483 0.0142 0.1254 0.0589 0.0246];
y_ph_data = [-22.3454 -40.2216 -56.9520 -80.5006 -143.2394 -91.6732 -103.1324 -123.1859];

% Provide a vector of frequencies to feed to derived transfer functions
w = linspace(0.01,10,1000);

% Transfer function from the time domain derivation of the pump tank system
y_time = 0.121./(1i.*w + 0.1267);

% Transfer function from the frequency response derivation of the pump tank
% system
y_frequency = 0.139./(1i.*w + 0.1178);

% Plot comparing the experimental data, transfer function 1 and transfer
% function 2
figure(1)
semilogx(frequency, mag2db(y_mag_data),'o');
hold on;
semilogx(w, mag2db(abs(y_time)));
semilogx(w, mag2db(abs(y_frequency)));
legend('Experimental Data','Time Domain Model','Frequency Domain Model')
xlabel('Frequency (rad/s)')
ylabel('Magnitude (dB)')
title('Magnitude Bode Plot')

figure(2)
semilogx(frequency, phlag, 'o');
hold on;
semilogx(w, angle(y_time)*180/pi);
semilogx(w, angle(y_frequency)*180/pi);
legend('Experimental Data','Time Domain Model','Frequency Domain Model')
xlabel('Frequency (rad/s)')
ylabel('Phase Lag (deg)')
title('Phase Lag Bode Plot')