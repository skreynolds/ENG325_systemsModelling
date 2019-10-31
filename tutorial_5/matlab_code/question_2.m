% Clear the variables and clear the workspace
clear; clc;

% Numberator and denominator for transfer function
numerator = [2 5];
denominator = [1 7 12];

% Transfer function
sys = tf(numerator, denominator);

% Bode plot for 
subplot(2,1,1);
bode(sys);

% Step Resonpse of the System
subplot(2,1,2);
step(sys)
