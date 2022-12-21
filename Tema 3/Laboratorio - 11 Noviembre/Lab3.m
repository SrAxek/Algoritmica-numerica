clear;

% Apartado a.)
tk = [0 1 3 4 5]';
yk = [0 1 2.5 0.5 0]';

H = [tk.^0 tk tk.^2 tk.^3];
c = H\yk;

tt = (0:0.01:5);
f=c(1)+c(2)*tt+c(3)*tt.^2+c(4)*tt.^3;
plot(tk,yk,'ro',tt,f,'b');
res1 = yk - H*c;

% Apartado b.)
% Resolviendo las condiciones iniciales nos queda que la función es igual a
% f(x) = C(-5x + x^2) + D(-25x + x^3)
ti = [1 3 4]';
yi = [1 2.5 0.5]';

H=[(ti.^2-5*ti) (ti.^3-25*ti)];
c1 = H\yi;

A=0; C=c1(1); D = c1(2); B=-5*C-25*D;
f1 = A +B*tt+C*tt.^2+D*tt.^3;

plot(tt,f1,'r');hold on;
res2 = yi - H*c1;

% Apartado c.)
w= [1 4 1];
H2 = sqrt(w)*H;
v = sqrt(w)*yi;

c2 = H2\v;
A=0; C=c2(1); D = c2(2); B=-5*C-25*D;
p=A + B*tt + C*tt.^2 + D*tt.^3;
res3 = yi - H2*c2;
plot(tt,p,'b'); hold off;

% Apartado d.)
% Empleamos pesos muy altos por los puntos que queremos pasar.
 w2 = [100 1 4 1 100];
 W = diag(w2);
 HH = H'*(W)*H; vv = H'*(W)*v;
 coefs = HH\vv;

 ps = polyval(flipud(coefs),x);
 res4 = yi - H*coefs;

