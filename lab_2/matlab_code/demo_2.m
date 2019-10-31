% Find phase shift between two signals using FFT phase angles
% Note: to keep this simple I separated out steps that could be combined 
% I also didn't bother making the fft output one sided, so the phase plot
% extends from 0:2*pi (0:Fs) and contains the 'negative' frequencies

clear all
%% 1: Generate two sine waves shifted by phase_deg degrees

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

Fs = 100; % Sample frequency

freq = frequency(i)/(2*pi); % Frequency in Hz

%% 2: Take the FFT of each of the two signals
signal_1_fft = fft(u);
signal_2_fft = fft(y);

% Throw away DC component that should be at index 0 in a sane language
signal_1_fft = signal_1_fft(2:end);
signal_2_fft = signal_2_fft(2:end);


%% 3: Find the phases of each signal

signal_1_phase = unwrap(angle(signal_1_fft));
signal_2_phase = unwrap(angle(signal_2_fft));


%% 4: Now we can find the phase angle difference between the two signals
signal_phase_diff = signal_2_phase - signal_1_phase;


%% 5: Next we can pull out the phase diff at the frequency of interest:

% Convert from bin number to frequency from 0 to Fs
binNum = ((length(signal_1_fft))/Fs)*freq;
binNum = round(binNum);

phase_diff = signal_phase_diff(binNum);

%% Display result in degrees
sprintf('Phase difference between signals at %d rad/sec is %f degrees', frequency(i), (phase_diff*180)/pi)