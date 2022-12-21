clear; 
tk = [-2 -1 0 1 2]';

% Apartado 1.)
yk = fun(tk); t = (-2.5:0.001:2.5)';
f = fun(t);
plot(t, fun(t), 'k', tk, yk, 'ko');

% Apartado 2.)
H = [tk.^0 tk.^1 tk.^2 tk.^3 tk.^4];
c = H\yk; p1 = polyval(c(end:-1:1),t);

% Apartado 3/4.)
H1 = [tk.^0 sin(tk) cos(tk) sin(2*tk) cos(2*tk)];
c1 = H1\yk; p2 = c(1) + c(2)*sin(t) + c(3)*cos(t) + c(4)*sin(2*t) + c(5)*cos(2*t);

% Apartado 5.)
plot(t,p1,'b', t,p2,'r', tk, yk, 'ko');

% Apartado 6.)
figure; plot(t, abs(f-p1), 'b', t, abs(f-p2) , 'r');

function f = fun(t)
    f = 1 - abs(t)/2;
    f(abs(t) > 2) = 0;
end
