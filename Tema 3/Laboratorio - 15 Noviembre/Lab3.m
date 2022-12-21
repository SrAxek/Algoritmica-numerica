clear;

tk = [-1 1 2 3 4]'; yk = [4 2 1 1 2]';
H = [tk.^0 tk.^1 tk.^2 tk.^3];
c = H\yk; x = (-1.5:0.001:4.5);
f1 = c(1) + c(2)*x + c(3)*x.^2 + c(4)*x.^3; 
hold on;
plot(x,f1,'r',tk, yk, 'ko'); 

% Con las restricciones vemos que la función se nos queda en 
% f = b*x + 4*d*x^3.

H2 = [tk 4*tk.^3]; c2 = H2\yk;
f2 = c2(1)*x + c2(2)*x.^3;

plot(x,f2,'b',tk, yk, 'ko'); hold off;

% Apartado c.)
w = [100 1 100 1 100];
W = diag(w);
HH = H'*(W)*H; vv = H'*(W)*yk; c3 = HH\vv;
px = polyval(c3(end:-1:1), x);
plot(x, px, 'b',x,f1,'r', tk, yk, 'ko');
