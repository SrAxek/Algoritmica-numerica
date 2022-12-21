clear;

% Apartado a.)
N = 9;
tt = (-15:0.001:15);
tk = linspace(-15, 15, N)';
yk = fun2(tk);

H = [tk.^0 tk.^1 tk.^2 tk.^3 tk.^4]; yk2 = 1./yk;

c1 = H\yk; c2 = H\yk2;

f1 = polyval(c1(end:-1:1),tt); f2 = polyval(c2(end:-1:1),tt);
figure(1); plot(tt, fun2(tt), 'k', tk, yk, 'ko', tt, f1, 'b', tt, 1./f2, 'r');

% Apartado b.)
errorAbsoluto1 = abs(fun2(tt) - f1); errorAbsoluto2 = abs(fun2(tt) - f2);
figure(2); plot(tt, errorAbsoluto1, 'r', tt, errorAbsoluto2, 'b');

function f = fun2(t)
    f = atan(t)./t;
    f(t == 0) = 1;
end