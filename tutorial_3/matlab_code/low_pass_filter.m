function ck_out = low_pass_filter(k,ck,w0,B)

    % Function has one output ck_out which is the output
    % of the intput signal with the filter applied to it.
    % The inputs for the function are the fundamental
    % frequency (w0), the input signal complex coefficients (ck),
    % the bandwidth of the filter (B)

    filter = abs(-k:k) < (B/w0);
    ck_out = ck.*filter;
end
