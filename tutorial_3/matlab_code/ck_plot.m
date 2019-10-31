% Script simply plots k vs ck for a signal composed of a finite number
% of cosine functions

% Determine size of plot
n = 1000;

% Create values for k
k = -n:n;

% Create storage vector for |ck|
pos_ck = zeros(1,n);

% Insert ck amplitude into storage vector
A = [440 554 659];
pos_ck(A) = 0.5;

% Compose |ck|
ck = [fliplr(pos_ck) 0 pos_ck];

% Print and label graph of k vs |ck|
stem(k,ck,'marker','.')
title('Magnitude of Complex Exponetials')
xlabel('Frequency')
ylabel('Amplitude |ck|')
axis([-1000 1000 0 1]);