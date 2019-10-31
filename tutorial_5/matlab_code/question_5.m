% Clear variables and clear workspace
clear; clc; clf;

% Numerator and denominator for Transfer Function
num = 1;
den = [1 6 5 0];

% Transfer Function
H = tf(num, den)

% Step response from transfer function
figure(1)
step(H)
axis([0 5 0 1])

% Plot for P control (ZN2)
figure(2)
subplot(3,1,1)
Kcr = 60; Pcr = 0;
P_num = 0.5*Kcr;
P_den = 1;
P = feedback(tf(P_num, P_den)*H,1)
step(P)
hold on;

% Plot for PI control (ZN2)
subplot(3,1,2)
PI_num = [81 32.4];
PI_den = [3 0];
PI = feedback(tf(PI_num, PI_den)*H,1)
step(PI)

% Plot for PID control (ZN2)
subplot(3,1,3)
PID_num = [13.5 36 24];
PID_den = [1 0];
PID = feedback(tf(PID_num, PID_den)*H,1)
step(PID)