clear;

% Apartado 1.)
xk = [1 2 4 5]';
yk = [0 -1 3 -4]';

% Apartado 2.)
H = [xk.^0 xk.^1 xk.^2 xk.^3];
v = yk;
c = H\v;

% Apartado 3.)
xx = (0.5:0.01:5.5);

% Apartado 4.)
px = c(1) + c(2)*xx + c(3)*xx.^2 + c(4)*xx.^3;
px2 = polyval(c(end:-1:1), xx);

% Apartado 5.)
plot(xk, yk, 'ks', xx, px, 'b');
% Lo repetimos con u(x) = A·sin(x) + B·cos(x) + C·sin(2x) + D·cos(2x)
H2 = [sin(xk) cos(xk) sin(2*xk) cos(2*xk)];
c2 = H2\v;
ux = c2(1)*sin(xx) + c2(2)*cos(xx) + c2(3)*sin(2*xx) + c2(4)*cos(2*xx);
plot(xk, yk, 'ks', xx, ux, 'r:');

% Las diferencias divididas son [0 -1 1 -1]
dd=[0 -1 1 -1]';
% newton(xk,yk);
pp2 = dd(1) + dd(2).*(xx-1) + dd(3).*(xx-1).*(xx-2) + dd(4)*(xx-1).*(xx-2).*(xx-4);
plot(xx,px-pp2);