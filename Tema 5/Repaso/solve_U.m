function x=solve_U(U,b)
% Resuelve el sistema triangular superior Ux=b y devuelve la solucion en x
N=length(b); % Tamaño sistema
x=NaN*b; % Reservo espacio para vector solución x 
     
x(N)=b(N)/U(N,N);
for r=N-1:-1:1,        
 S=b(r); 
 for k=r+1:N, S=S-U(r,k)*x(k); end   
 x(r)=S/U(r,r);
end       
end
