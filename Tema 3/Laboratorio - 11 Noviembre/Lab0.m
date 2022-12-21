clear;
xi = [-1 0 1 2 4]';
yi=  [0 -2 0 3 3]';

% Apartado a.)
H1 = [xi.^0 xi xi.^2];
H2 = [xi.^0 cos(xi) sin(xi)];

c1 = H1\yi; c2 = H2\yi;

% Apartado b.)
r1 = yi-H1*c1; r2 = yi-H2*c2;

% Apartado c.)
E1 = norm(r1);
E2 = norm(r2);
fprintf(' E1 = %.3f\n E2 = %.3f\n',E1,E2);

% Apartado d.)
xx=-1.5:0.001:4.5;
f1=polyval(c1(end:-1:1), xx);
f2 = c2(1)+c2(2)*cos(xx)+c2(3)*sin(xx);
plot(xi, yi, 'ko', xx, f1, 'b', xx, f2, 'r');

% Apartado e.)
cc1 = inv(H1'*H1)*(H1'*yi);