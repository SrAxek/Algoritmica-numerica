clear;

x = zeros(70:1); ea = zeros(70:1); ea2 = zeros(70:1);
x0 = 1; 
x(1) = x0; 
for k=2:70
    x1 = exp(-x0); x0 = x1; 
    x(k) = x1; 
end

ea(1:70) = abs(fun(x(1:70)) - fun (x(70)));
K(1:69) = ea(2:70)/ea(1:69);

semilogy(1:70, ea, 'bo:'); hold on


for k=2:70
    f = x0 - exp(-x0);
    fd = 1 + exp(-x0);
    if(f == 0), return; end
    x0 = x0 - f/fd;
    x(k) = x0;
end

ea2(1:70) = abs(x(1:70) - exp(-x(1:70)) - x(70) + exp(-x(70)));
semilogy(1:70, ea2, 'ro:'); hold off;
function f = fun(x)
    f = x - exp(-x);
end 