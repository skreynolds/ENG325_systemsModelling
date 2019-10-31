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

u = u - mean(u);
y = y - mean(y);

[c,lag] = xcorr(u,y);
[maxC,idx] = max(c);
lag = lag(idx);
phase_lag = 360/(2*pi)*frequency(i)*lag*0.01