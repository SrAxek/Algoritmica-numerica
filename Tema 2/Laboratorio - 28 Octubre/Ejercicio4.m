clear;
load mano.mat;
N = 37; tk = linspace(0,1,N);

t = (0:0.001:1); px = newton(tk,xk,t); py = newton(tk,yk,t);
figure(1); plot(xk,yk,'bo', px,py,'r');