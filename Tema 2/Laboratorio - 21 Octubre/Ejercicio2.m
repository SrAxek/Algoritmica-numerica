clear;

c = [-120 274 -225 85 -15 1]; n = length(c) - 1;
x=(1:0.005:5);

% Opcion a.)
pa=c(1); xx = x;
tic;
for k=2:n+1
    pa = pa + c(k)*xx; xx = xx.*x;
end; toc;


% Opcion b.)
pb = c(n+1);
tic;
for k = n:-1:1
    pb = pb.*x + c(k);
end; toc;

% Opcion c.)
tic;
pc = polyval(c(end:-1:1),x); toc;

plot(x,pa,'r',x,pb,'b',x,pc,'g');
errorAbsoluto = abs(pa-pb);
plot(x, errorAbsoluto, 'r');

