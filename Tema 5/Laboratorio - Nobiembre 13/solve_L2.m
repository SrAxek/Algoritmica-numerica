function x=solve_L2(L,b)
N=length(b); % Tamaño sistema
x=NaN*b; % Reservo espacio para vector solución x 

x(1)=b(1)/L(1,1);
for r=2:N    
  S=b(r);  
  for k=r-2:r-1, S = S-x(k)*L(r,k);  end
  x(r)=S/L(r,r);
end    
end