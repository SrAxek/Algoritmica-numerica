clear;

% Apartado a.)
tk = [25 100 150 300]';
yk = [0.7 0.06 0.02 0.0003]';

H = [tk.^0 -tk];
v = log(yk);

% Apartado b.)
c = H\v;
A = exp(c(1)); B = c(2);
valor = A*exp(-B*0.1);

% Apartado c.)
T=(0:300); V = A*exp(-B*T);
plot(tk,yk,'ro',T,V,'b');

% Apartado d.)
res = (yk-A*exp(-B*tk));
res2 = v-H*c;