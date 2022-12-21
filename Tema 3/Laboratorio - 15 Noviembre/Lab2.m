clear;

% Caso a.)
tk = [0.69 1.46 1.82 2.25 2.85]';
yk = [1.98 5.34	6.01 7.25 8.06]';
v = 1./yk; H = [1./tk.^2 tk.^0];
c = H\v; A = 1/c(2); B = c(1)/c(2);
res = yk - A*tk.^2/(B+tk.^2);
normRes1 = norm(res);

% Caso b.)
v2 = yk.*tk.^2; H2 = [tk.^2  -yk];
c2 = H2\v2; A2 = c(1); B2 = c(2);
res2 = yk - A2*tk.^2/(B2+tk.^2);
normRes2 = norm(res2);

x = (0:0.001:3);
f1=A*x.^2/(B+x.^2); f2 = A2*x.^2/(B2+x.^2);
plot(tk, tk, 'ko', x, f1, 'b', x, f2, 'r');

function E=f_coste(X) 
    tk=[0.69 1.46 1.82 2.25 2.85]'; 
    yk=[1.98	5.34	6.01	7.25	8.06]';
    
end

