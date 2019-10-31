%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script runs a simulation on a single tank with an output valve
% and an input valve which is driven by an electric pump. The simulation
% has been implemented using Euler approximation.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load system data and specify variables
filepath = 'C:\Users\Shane Reynolds\Desktop\Lab 1 Data\Lab 1 Data\step1.txt';
data = textread(filepath);
time = data(1:end,1);
dataHo = 1.293;
datahu = data(1:end,3) - dataHo;

% Specify time step size and storage for simulation output
dt = 0.01;
hu = [0];

% Specify simulation model parameters
C = pi*((18.7)^2 - 2*(3.18)^2)/4;
R = 0.0305;

% Run simulation
for i = 1:(size(data(1:end,2))-1)
    if data(i,2) == 2
        hu(i+1) = 0;
    else
        hu(i+1) = hu(i) + (dt/C)*(31.97 - (1/R)*hu(i));
    end
end

% Plot simulated and acutal data on same plot
subplot(2,1,1)
plot(time,hu)
hold on
plot(time,data(1:end,3)-1.287)
xlabel('Time in Seconds')
ylabel('dHU(t) in Volts')
legend('dHU(t) simulated','dHU(t) actual',...
        'Location','southeast')

% Plot absolute error
subplot(2,1,2)
error = abs(datahu' - hu);
plot(time,error)
xlabel('Time in Seconds')
ylabel('|error| in Volts')