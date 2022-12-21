function s=secante(fun,x0,x1,tol)
    if nargin==3,tol=1e-8;end
    f0=fun(x0);f1=fun(x1);n=1;
    while(n<10||tol>abs(x0-x1))
        f1d=(f1-f0)/(x1-x0);
        x2=x1-f1/f1d;
        x0=x1;x1=x2;
        f0=f1;f1=fun(x1);
        n=n+1;
    end
    s=x1;
end
function f=fun(x)
    f=x^2-3;
end