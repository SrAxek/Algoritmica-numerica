function x=solve_L(L,b)
N=length(b); % Tama�o sistema
x=NaN*b; % Reservo espacio para vector soluci�n x 

x(1)=b(1)/L(1,1);
for r=2:N    
  S=b(r);  
  for k=1:r-1, S = S-x(k)*L(r,k);  end
  x(r)=S/L(r,r);
end    
end