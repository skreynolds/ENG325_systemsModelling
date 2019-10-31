function sigplot(t,u,y,freq)
    
    % Plot input signal
    plot(t,u);
    hold on;
    tString = sprintf('Frequency: %1.2f (rad/sec)' ,freq);
    title(tString);
    xlabel('Time');
    ylabel('Signal');
    
    % Plot output signal
    plot(t,y);
    legend('u(t)','y(t)','Location','northeast');

end