clear;

tk = [-3 -2 -1 0 1 2 3]'; yk = sinc(tk); tt = (-3:0.001:3);
H1 = [tk.^0 tk.^1 tk.^2 tk.^3 tk.^4 tk.^5 tk.^6];
H2 = [tk.^0 sin(tk) cos(tk) sin(2*tk) cos(2*tk) sin(3*tk) cos(3*tk)];

c1 = H1\yk; c2 = H2\yk; 
f = sinc(tt);
f1 = polyval(c1(end:-1:1),tt); 
f2 = c2(1) + c2(2)*sin(tt) + c2(3)*cos(tt) + c2(4)*sin(2*tt) + c2(5)*cos(2*tt) + c2(6)*sin(3*tt) + c2(7)*cos(3*tt);
figure(1); plot(tt, f, 'k', tk, yk, 'ko', tt, f1, 'b', tt, f2, 'r');

e1 = abs(f-f1); e2 = abs(f-f2); figure(2); plot(tt, e1, 'b', tt, e2, 'r');
errorMax1 = max(e1); errorMax2 = max(e2);