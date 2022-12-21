clear;

% Apartado a.)
tk = [0.5 1.0 1.5 2.0 2.5 3.0]';
hk = [6.9 11.3 12.5 12.4 9.3 4.2]';

H = [tk -0.5*tk.^2];
c = H\hk;
v0 = c(1); g = c(2);

% Apartado b.)
res = hk - H*c; norm(res);

% Apartado c.)
t = (0:0.01:3.5);
h = v0*t-0.5*g*t.^2;
plot(tk,hk, 'ro', t,h,'b',t,h*0,'k:');

% Apartado d.)
H1 = tk;
hk1 = hk + 0.5*9.8*tk.^2;
v01 = H1\hk1;
res = hk1 - H*v01; norm(res);