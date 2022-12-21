clear;
N = 500; A = rand(N,N); L = tril(A) - tril(A, -2);
b = rand(N,1);
[L,U,perm]=lu(A,'vector'); 

c=solve_L2(L,b(perm)); x1=solve_U(U,c); 
x2=A\b;