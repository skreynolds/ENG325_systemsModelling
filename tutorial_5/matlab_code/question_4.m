% Clear variables and clear workspace
clear; clc;

% Numerator and Denomoinator for the Transfer Function
num = 0.02;
den = [1 0.3 0.02];

% Transfer Function
H = tf(num, den);
subplot(3,1,1)
step(H)

% Step response of system with P control (ZN1)
subplot(3,1,2)
P_num = 10.36;
P_den = 1;
P = feedback(tf(P_num, P_den)*H,1)
step(P)
hold on;

% Step response of system with PI control (ZN1)
PI_num = [18 2.797];
PI_den = [1.93 0];
PI = feedback(tf(PI_num, PI_den)*H,1)
step(PI)

% Step response of system with PID control (ZN1)
PID_num = [46.33 48.01 12.44];
PID_den = [3.86 0];
PID = feedback(tf(PID_num, PID_den)*H,1)
step(PID)
legend('P Control', 'PI Control', 'PID Control')

% Step response of system with tuned PID control (ZN1)
% Orignal PID ZN1 parameters
% Kp = 12.43; Ti = 3.86; Td = 0.965;
Kp = 12.43; Ti = 3.86; Td = 5.965;
PID_TUN_NUM = [(Kp*Ti*Td) (Kp*Ti) Kp];
PID_TUN_DEN = [Ti 0];
PID_TUN = feedback(tf(PID_TUN_NUM, PID_TUN_DEN)*H,1)

subplot(3,1,3);
step(H)
hold on;
step(PID_TUN)
legend('Step Response Uncontrolled', 'Step Response Controlled')



