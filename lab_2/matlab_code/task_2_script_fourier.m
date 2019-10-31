clc; clear;
% Create a general path string that can use used to access file paths
path_name = 'C:\Users\Shane Reynolds\Desktop\ENG325 Lab 2 data\ENG325 Lab 2 data\';

% Create a general tag to build .txt file list
gen_path = '*.txt';

% Store file list in files
files = dir(strcat(path_name,gen_path));

% Frequencies used in experiment
frequency = [0.05 0.1 0.2 0.5 10.0 1.0 2.0 5.0];

store = [];

% Loop creates a subplot which plots input and response. Also fits
% sinusoid to curves with high degree of accuracy
for i = 1:length(frequency)
    
    % Pull file path and load data from file into system store in data
    new_path = strcat(path_name,files(i).name);
    data = csvread(new_path);
    
    % t is the time for which the process was run, u is the input data,
    % and y is the output data
    t = data(:,1);
    u = data(:,2);
    y = data(:,3);
    
    % Determine the subplot entry to plot in
    subplot(4,2,i);
    
    % Plot the input signal, title the graph and label the axes
    plot(t,u);
    hold on;
    tString = sprintf('Frequency: %1.2f (rad/sec)' ,frequency(i));
    title(tString);
    xlabel('Time');
    ylabel('Signal');
    
    fprintf('********************************************************\n');
    
    % Create the curve which is to be fit to the sinusoid, specifying
    % the frequency to be used
    curve = sprintf('ubar + A*sin(%1.2f*x + theta)', frequency(i));
    type = fittype(curve);
    
    % Fit curve to sinusoid using linear regression (because the frequency)
    % is known, a very high probability fit is produced with minimal error.
    fprintf('\n\nFitting sinusoid for u(t) at frequency: %1.2f\n', frequency(i));
    fitcurve_u = fit(t,u,type)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %plot(t,fitcurve_u(t))   % Used to visually inspect the fit
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Plot the output signal, add legend to the graph
    plot(t,y);
    legend('u(t)','y(t)','Location','northeast');
    
    % Fit curve to sinusoid using linear regression (because the frequency)
    % is known, a very high probability fit is produced with minimal error.
    fprintf('\n\nFitting sinusoid for y(t) at frequency: %1.2f\n', frequency(i));
    fitcurve_y = fit(t,y,type)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %plot(t,fitcurve_y(t))   % Used to visually inpect the fit
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fft_u = fft(u); %fft(u)
    fft_u = fft_u(2:end); %drop the first point
    angle_u = angle(fft_u); %angle() the result
    fft_y = fft(y); %fft(y)
    fft_y = fft_y(2:end); %drop the first point
    angle_y = angle(fft_y); %angle() the result
    
    phase_shift = abs(angle_y - angle_u);
    
end