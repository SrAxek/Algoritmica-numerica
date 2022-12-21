clear;
n=3;x0=1;
x=zeros(1,n); 
for k=1:n
    [f,fp]=fun(x0);
    if(f==0), end
    x0=x0-f/fp;
    x(k)=x0;
    fprintf('Iter %2d ‐> x0=%17.16f\n',k,x0);
end
%Suponemos que el valor tercero es el correcto(puesto 
%que no nos dan una solución).
e1=abs(x(1)-x(3)); e2=abs(x(2)-x(3));
%Deducimos el valor de K puesto que, al ser lineal,
%se cumple con la relacion en+1/en~K.
K=e2/e1;
%Estimamos el error del tercer valor.
e3=K*e2;
%La cantidad de cifras que ganamos con cada iteracion
%son las siguientes.
cifrasGanadas=log10(1/K);

clear;

sol=roots([1 2 -1 -3]);
%La única raíz real está en la posición 1.
s=sol(1);
n=5;x0=1;
x=zeros(1,n); e=zeros(1,n);
for k=1:n
    [f,fp]=fun(x0);
    if(f==0), end
    x0=x0-f/fp;
    x(k)=x0;e(k)=abs(s-x(k));
end

semilogy(1:n,e);

fprintf('%.17f %.17f',x(n),s);

clear;
sol=roots([1 2 -1 -3]);s=sol(1);
n=5;x=1;e=zeros(1,n);
for k=1:n
    x=sqrt((3+x)/(2+x));
    e(k)=abs(x-s);
end
semilogy(1:n,e);K=e(5)/(e(4)^2);

clear;
%%m=rand(3,3);I=m*inversa(m);

clear;
x=zeros(1,100);c=zeros(1,100);
for n=1:100
    m=rand(50,50);
    n1=norm(m*inversa(m)-eye(50,50));
    n2=norm(m*inv(m)-eye(50,50));
    c(n)=n1/n2;
end

clear;
clear;
n=6;x0=1;
x=zeros(1,n); 
for k=1:n
    [f,fp]=fun2(x0);
    if(f==0), end
    x0=x0-f/fp;
    x(k)=x0;
    fprintf('Iter %2d ‐> x0=%17.16f\n',k,x0);
end
r= x(6);

function iA=inversa(A) %Calcula inversa de matriz
%A y devuelve en iA.
    k=50;I=eye(k,k);iA=zeros(k,k);
    for n=1:k
        b=I(1:end,n);
        x=A\b; 
        iA(1:end,n)=x;
    end
end

function [f,fp]=fun(x)
    f=x^3+2*x^2-x-3;
    fp=3*x^2+2*x-1;
end

function [f,fp]=fun2(x)
    f=3*x^2+2*x-1;
    fp=6*x+2;
end
