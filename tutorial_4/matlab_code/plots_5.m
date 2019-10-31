n = linspace(-10,10,21);

%x = ones(1,length(n));
%y = ones(1,length(n));

%x = cos(n*pi/4);
%y = 0.8047*cos(n*pi/4 - 0.7854);

%x = cos(n*pi/2);
%y = 0.3333*cos(n*pi/2 - 1.5708);

x = cos(n*pi/2).*sin(n*pi/4);
y = 0.5*0.1381*cos(n*3*pi/4 - pi/2 + 0.7854) - 0.5*0.8047*cos(n*pi/4 - pi/2 - 0.7854);

subplot(2,1,1);
stem(n,x);
ylabel('x[n]')
axis([-10 10 -1 1]);

subplot(2,1,2);
stem(n,y);
xlabel('time')
ylabel('y[n]')
axis([-10 10 -1 1]);