function [L, U]=LU_sin_piv(A)
% Factorizacion LU sin pivotar (puede petar si un pivote==0)
% A la salida, L*U = A (no se han hecho permutaciones)

N = size(A,1); 

for col=1:N-1,  % recorro columnas de 1 a N-1     
  
  % Aquí se pondría el código en caso de querer hacer pivotaje
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
  pivote = A(col,col); 
  for k=col+1:N,  % Recorro filas por debajo de diagonal
    m = A(k,col)/pivote;    
    A(k,col:N)=A(k,col:N)-m*A(col,col:N); %fila(k) = fila(k) - m x fila(col)
    A(k,col)=m;  % Guardo cociente en el 0 que acabo de crear             
  end      
end

%Extraigo matrices L y U de A
U=triu(A);            % U = parte triangular sup de A
L=tril(A,-1)+eye(N);  % L = parte de abajo de A + 1's en diagonal
end




