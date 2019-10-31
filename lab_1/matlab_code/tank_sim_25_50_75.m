% Specify time step size and storage for simulation output
dt = 0.01;
hu = [0 0 0];

% Specify simulation model parameters
C = pi*((18.7)^2 - 2*(3.18)^2)/4;
R25 = 0.0194;
R50 = 0.0305;
R75 = 0.0386;

% Run simulation
for i = 1:(size(data(1:end,2))-1)
    if data(i,2) == 2
        hu(i+1,1:end) = 0;
    else
        hu(i+1,1) = hu(i,1) + (dt/C)*(31.97 - (1/R25)*hu(i,1));
        hu(i+1,2) = hu(i,2) + (dt/C)*(31.97 - (1/R50)*hu(i,2));
        hu(i+1,3) = hu(i,3) + (dt/C)*(31.97 - (1/R75)*hu(i,3));
    end
end

% Plot simulated data on same plot
plot(time,hu(1:end,1))
hold on
plot(time,hu(1:end,2))
plot(time,hu(1:end,3))
xlabel('Time in Seconds')
ylabel('dHU(t) in Volts')
legend('dHU(t) R25','dHU(t) R50', 'dHU(t) R75',...
        'Location','southeast')