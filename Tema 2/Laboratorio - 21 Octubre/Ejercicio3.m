clear;

xk = (200:207)'; yk = rand(size(xk));
% Apartado a.)
H = [xk.^0 xk.^1 xk.^2 xk.^3 xk.^4 xk.^5 xk.^6 xk.^7];
c = H\yk;
xx=(200:0.001:207); pp1 = polyval(c(end:-1:1),xx);

% Apartado b.)
pp2 = newton(xk,yk,xx);
plot(xx,pp1,'g',xx,pp2,'b', xk,yk,'ko');

% Apartado c.) El resultado claramente incorrecto es el a. Nos da un aviso
% Matlab (line 6: Warning: Matrix is close to singular or badly scaled. Results may
% be inaccurate. RCOND =  8.299383e-32).
difdiv = newton(xk,yk); % Los coeficientes son el error.