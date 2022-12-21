clear;

% Apartado a.)
 xk = [-3 -2 -1 0 1 2 3]';
 yk = [0.21 0.27 0.48 1 0.53 0.25 0.23]';
 H = [xk.^0 xk cos(xk)];
 v = 1./yk; c = H\v;

 xx = (-3:0.01:3);
 fx = 1./(c(1) + c(2)*xx.^0 + c(3)*cos(xx));
 plot(xk, yk, 'ro', xx, fx, 'r');
 res1 = yk -H*c; normaRes1 = norm(res1);

 % Apartado b.)
 xk2 = [-3 -2 -1 1 2 3]';
 yk2 = [0.21 0.27 0.48 0.53 0.25 0.23]';
 v=1./yk2 -1; H = [xk2.^1 (cos(xk2)-1)];
 c = H\v; A = 1 - c(2);
 px = 1./(1 + c(1)*xx.^1 + c(2)*(cos(xx)-1));
 plot(xx,fx,'r',xx,px,'b' ,xk,yk,'ko');
 res2 = yk2 -H*c; normaRes2 = norm(res2);

 % Apartado c.)
m = f_ajuste([3 0 -2]);
function E = f_ajuste(X)
     xk = [-3 -2 -1 0 1 2 3]';
     yk = [0.21 0.27 0.48 1 0.53 0.25 0.23]';
     H = [xk.^0 xk cos(xk)];
     error = yk - H.*X;
     E = norm(error);
end

 
