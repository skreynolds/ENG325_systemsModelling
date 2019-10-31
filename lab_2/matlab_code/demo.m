% clear
clear all

% Choose which file to process
i = 8;

% Create a general path string that can use used to access file paths
path_name = 'C:\Users\Shane Reynolds\Desktop\ENG325 Lab 2 data\ENG325 Lab 2 data\';

% Create a general tag to build .txt file list
gen_path = '*.txt';

% Store file list in files
files = dir(strcat(path_name,gen_path));

% Pull file path and load data from file into system store in data
new_path = strcat(path_name,files(i).name);
data = csvread(new_path);

% Frequencies used in experiment
frequency = [0.05 0.1 0.2 0.5 10.0 1.0 2.0 5.0];

% t is the time for which the process was run, u is the input data,
% and y is the output data
t = data(:,1);
u = data(:,2);
y = data(:,3);

% Sampling frequency
Fs = 100;

% number of points
npts = length(t);

% Input
x = u;

% remove bias
x = x - mean(x);
y = y - mean(y);

% plot the signal
figure(1)
plot(t,x,t,y);
xlabel('Time (s)');
ylabel('Amplitude');
legend('u(t)','y(t)');

% take the FFT
X=fft(x);
Y=fft(y);

% Calculate the numberof unique points
NumUniquePts = ceil((npts+1)/2);
figure(2)
subplot(211);
f = (0:NumUniquePts-1)*Fs/npts;
semilogx(2*pi*f,abs(X(1:NumUniquePts)));
title('X(f) : Magnitude response');
ylabel('|X(f)|')
subplot(212)
semilogx(2*pi*f,abs(Y(1:NumUniquePts)));
title('Y(f) : Magnitude response')
xlabel('Frequency (Hz)');
ylabel('|Y(f)|')
figure(3)
subplot(211)
semilogx(2*pi*f,angle(X(1:NumUniquePts)));
title('X(f) : Phase response');
ylabel('Phase (rad)');
subplot(212)
semilogx(2*pi*f,angle(Y(1:NumUniquePts)));
title('Y(f) : Phase response');
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');

% Determine the max value and max point.
% This is where the sinusoidal
% is located. See Figure 2.
[mag_x idx_x] = max(abs(X));
[mag_y idx_y] = max(abs(Y));

% determine the phase difference
% at the maximum point.
px = angle(X(idx_x));
py = angle(Y(idx_y));
phase_lag = py - px

% determine the amplitude scaling
amplitude_ratio = mag_y/mag_x