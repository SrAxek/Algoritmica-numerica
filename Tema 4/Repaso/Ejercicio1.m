clear;
x = zeros(1,10); x(1) = 1.8; s=1.83928675521416113;
for n = 2:10
    x(n) = (1+x(n-1)+x(n-1)^2)^(1/3);
    e = abs(x(n) - s)/s;
    fprintf('Iteración %2d :: x = %.17f E rel = %.1e\n',n, x(n), e);
end
e = abs(x-s)/s;semilogy((1:10),e,'bo:','LineWidth',2);

e(2:end)./e(1:end-1);
K=e(end)/e(end-1); cif=log10(1/K);
fprintf('K=%.3f -> %.2f cif/iter = %.2f iter/cif\n',...
K,cif,1/cif);

KK = (x(3)-x(2))./(x(2)-x(1));
KK = (x(10)-x(9))./(x(9)-x(8));

clear;
s = 1.8;
for k = 1:10
    [f,fp] = fun(s);
    if(f == 0) 
    end
    s = s-f/fp;
end


function [f,fp] = fun(x)
    f = x^3 -x^2-x-1;
    fp = 3*x^2-2*x-1;
end