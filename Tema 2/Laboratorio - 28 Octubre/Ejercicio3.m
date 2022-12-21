clear;
N = 9;
t = (0:0.001:1); [x,y] = param(t);
tk = linspace(0,1,N); [xk,yk] = param(tk);
figure(1); plot(x,y,'b:',xk, yk, 'bo');

px = spline(tk,xk,t); py = spline(tk,yk,t);
figure(2); plot(px,py,'r'); 

function [x,y] = param(t)
    x = cos(4*pi*t)./(1+5*t.^2);
    y = sin(4*pi*t)./(1+5*t.^2);
end