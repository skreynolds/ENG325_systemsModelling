function parameter_printout(freq,ubar,Au,Ay,H_mag,phlag)
    
    % Printout headings
    fprintf('\n\n\nEstimating parameters...\n');
    data = [ubar' Au' Ay' H_mag' phlag'];
    
    %row_name = {'ROW1','ROW2','ROW3','ROW4','ROW5','ROW6','ROW7','ROW8'};
    %col_name = {'Freq','ubar','Au','Ay','H_mag','H_Phase_lag'};
    %array2table(data, 'VariableNames', col_name, 'RowNames', row_name)
    
    row_name = 'Freq(0.05) Freq(0.10) Freq(0.20) Freq(0.50) Freq(10.0) Freq(1.0) Freq(2.0) Freq(5.0)';
    col_name = 'ubar Au Ay H_mag H_Phase_lag';
    printmat(data, 'SIGNAL PARAMETERS',row_name,col_name);
end