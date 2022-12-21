clear;

% Apartado b.)
x0 = pi/12; x1 = pi/2;
H = [1   x0   x0^2   x0^3
     1   x1   x1^2   x1^3
     0   1    2*x1   3*x1^2
     0   0    2      6*x1];
v = [sin(x0) sin(x1) cos(x1) -sin(x1)]';
c = H\v;

% Apartado c.)
x = (0:0.001:2); pp = polyval(c(end:-1:1),x);

figure(1); plot(x,pp,'b', x, sin(x),'r',[x0 x1], sin([x0 x1]), 'ro');

% Apartado d.)
err = abs(sin(x) - pp);
figure(2); plot(x, err, 'b', [x0 x1], [0 0], 'ro');