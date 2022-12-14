function out=newton(x,y,xx)
% Calcula diferencias divididas a partir de x e y 
% Entrada: x, N abcisas de interpolacion
%          y, N ordenadas de interpolacion
%          xx, opcional. Si se da, evalua polinomio en esos puntos
% Salida:  out, N diferencias divididas
 
N=length(y); y=reshape(y,N,1); 
DD = zeros(N,N);      % Reservo matriz de Diferencias Divididas 
DD(:,1) = y;    % 1era columna = valores de y

for k=2:N, %  Barremos columnas de DD (diferencias ordenadas orden k)         
  for j=k:N, % En cada columna k barremos de la diagonal(k) hacia abajo  
    dif =  (DD(j,k-1)-DD(j-1,k-1));  % resta de dif divididas orden k-1
    dx =  x(j)-x(j-k+1);           % resta de abscisas
    DD(j,k) =  dif/ dx;              % Diferencia DIVIDIDA
  end
end

c = diag(DD)';  % extraemos la diagonal del cuadro de diferencias div

if nargin==2,  % Si solo nos dan 2 argumentos de entrada, devolver dif div
 out=c;      
else    % Si llegamos aqui hay un tercer arg -> evaluar polinomio en xx
 pp = c(N);  % Regla de Horner con diferencias divididas
 for k=N-1:-1:1,
   pp = c(k) + pp.*(xx-x(k));  
 end
 out=pp; % devuelve valores obtenidos polinomio en out            
end    


end  
