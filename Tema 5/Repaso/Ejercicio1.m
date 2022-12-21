clear;
A=rand(10);s=ones(10,1);b=A*s; 
[L,U,perm]=lu(A,'vector');
c=solve_L(L,b);x=solve_U(L,b);