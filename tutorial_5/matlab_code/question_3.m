% Clear previous variables and screen ouput
clear; clc;

% Set parameters for Plant model
k = 0.5;
L = 3e-3;
R = 0.6;
J = 0.004;
b = 0.1;

% Numerator and denominator for transfer function
num1 = k;
den1 = [L*J (L*b + R*J) R*b];

% Create transfer function for model (Gp)
M1 = tf(num1, den1);
M2 = num1;
M = feedback(M1,M2)

% Create control transfer function for open loop control (Gp)
num2 = [1.2e-5 0.0027 0.31];
den2 = 0.5;
G = tf(num2,den2);

% Bode plot of both the transfer function for uncontrolled and controlled
% systems
subplot(2,1,1);
bode(M)
hold on;
bode(G*M)

% Step response plot of both the transfer function for uncontrolled and
% controlled systems
subplot(2,1,2);
step(M)
hold on;
step(G*M)
legend('system', 'controlled system',...
        'Location','southoutside','Orientation','horizontal');


