H = [9 37 47 70 92 110.5 136 159]';
HU = [0.86 1.22 1.27 1.625 1.85 2.225 2.65 3.275]';

y = HU;

X = [ones(length(H),1) H];
b = X\y

yCalc2 = X*b;
Rsq2 = 1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2)

scatter(H,HU,'o')
hold on
plot(H,yCalc2)
xlabel('H(t)')
ylabel('HU(t)')
theString = sprintf('HU(t) = %.4f H(t) + %.3f', b(2), b(1));
text(80, 0.75, theString, 'FontSize', 10);