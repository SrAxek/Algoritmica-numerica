function s = secante(f,x0,x1,tol)
    f0=f(x0);f1=f(x1); k=1;
    while(abs(x0-x1)>tol)
        fd1=(f1-f0)/(x1-x0);
        x2 = x1-f1/fd1;
        x0=x1;x1=x2; s = x1;
        f0=f(x0);f1=f(x1);fprintf('%i\n', k);
        k= k+1;
    end
    s= x1;
end