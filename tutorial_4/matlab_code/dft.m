%
% Discrete Fourier Transform
%
function Xk = dft(x)
    
    [N,M] = size(x);
    
    if M ~= 1
        x = x';
        N = M;
    end
    
    Xk = zeros(N,1);
    n = 0:(N-1);
    
    for k = 0:(N-1)
        Xk(k+1) = exp(-1i*2*pi*k*n/N)*x;
    end

    k = [0 1 2 3]';

    -1 + exp(-1i*k*pi/2) + exp(-1i*k*pi) + exp(-1i*k*3*pi/2)
    
end

