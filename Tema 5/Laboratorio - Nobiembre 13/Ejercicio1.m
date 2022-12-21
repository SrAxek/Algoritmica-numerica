clear;
A=randn(500); s=ones(500,1); b=A*s; 
[L,U,perm]=lu(A,'vector'); 

c=solve_L(L,b(perm)); x1=solve_U(U,c); 
x2=A\b;
e1 = abs(x1-s); e2 = abs(x2-s);
semilogy(1:500,x1,1:500,x2);
m1=mean(e1);m2=mean(e2);
fprintf('%.15d', m1, '%.15d', m2);
