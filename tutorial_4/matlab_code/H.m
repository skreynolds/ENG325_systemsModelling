function H = H(w,N)
    H = (1 - cos(N*w) + 1i*sin(N*w))./(N*(1 - cos(w) + 1i*sin(w)));
end