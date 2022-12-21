clear;

xx = (-1: 0.001 : 1);
xk = linspace(-1,1,15); yk = fun(xk);
pp = newton(xk,yk,xx);

plot(xx, fun(xx), 'b', xk, yk, 'bo', xx, pp, 'r');

errorAbsoluto = abs(fun(xx) - pp); maxDif = max(errorAbsoluto);
fprintf('%.2e',maxDif);

function y = fun(x)
    %y = sin(pi*(x/2));
    y = atan(pi*x);
end