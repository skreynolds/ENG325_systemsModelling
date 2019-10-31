% Script simply plots k vs ck for a signal composed of a finite number
% of cosine functions

% Determine size of plot
n = 1000;
w0 = 2*pi;

% Create values for k
k_pos = 1:n;
k = -n:n;

% Create storage vector for |ck|
pos_ck = zeros(1,n);

% Insert ck amplitude into storage vector
A = [440 554 659];
pos_ck(A) = 0.5;

% Compose |ck|
ck = [fliplr(pos_ck) 0 pos_ck];
ck_out = zeros(1,6);

dur = 2.0;
fs = 44100;
t = 0:(1/fs):dur;

for i = 0:5
    ck_out = low_pass_filter(n,ck,w0,1000*i);
    subplot(3,2,i+1)
    stem(k,ck_out,'marker','.')
    title(sprintf('B: %d', 1000*i))
    xlabel('Frequency')
    ylabel('Amplitude |ck|')
    axis([-1000 1000 0 1]);
    
    for j = 1:length(k_pos)
        if ck_out(j) ~= 0
            x = ck_out(j)*( exp(1i*k(j)*w0*t) + exp(-1i*k(j)*w0*t) );
            real_x = real(x);
            sound(x,fs)
            pause(3)
        end
    end
    
    
end