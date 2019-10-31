U = [2 2.5 3 3.5 4 4.5]';
Q = [4435.91 5645.70 6765 7821.50 8649.41 9466.88]';

y = Q;

X = [ones(length(U),1) U];
b = X\y

yCalc2 = X*b;
Rsq2 = 1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2)

scatter(U,Q,'o')
hold on
plot(U,yCalc2)
xlabel('U(t)')
ylabel('Qi(t)')
theString = sprintf('Qi(t) = %.3f U(t) + %.3f', b(2), b(1));
text(3.25, 4500, theString, 'FontSize', 10);