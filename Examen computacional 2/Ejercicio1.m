clear;

xk = [0 1 1.05 2]'; yk = exp(-xk);
H = [xk.^0 xk.^1 xk.^2 xk.^3]; v = yk;
c = H\v;

x= (0:0.001:2); fx = exp(-x); 
px = c(1)*x.^0 + c(2)*x.^1 + c(3)*x.^2 + c(4)*x.^3;
plot(x,fx,'r', xk, yk, 'ro', x, px, 'b');

errorReal = abs(fx-px);
cota = abs((x-0).*(x-1).*(x-1.05).*(x-2))./factorial(4);
plot(x,errorReal,'b', x, cota, 'r');
max = max(abs(fx-px));
%Apartado b.)

x0 = 0; x1 = 1; x2 = 2;
H = [1  x0   x0^2  x0^3
     1  x1   x1^2  x1^3
     0   1   2*x1  3*x1^2
     1  x2   x2^2  x2^3];
v=[exp(-x0) exp(-x1) -exp(-x1) exp(-x2)]';

c = H\v;
hx = polyval(c(end:-1:1), x);
%plot(x, abs(px-hx), 'b');
valor = max(px-hx);