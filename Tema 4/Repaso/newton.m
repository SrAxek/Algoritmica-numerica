function s=newton(fun,x0,tol)
% fun puntero a función que devuelve f(x) y f'(x)
% x0 es el punto inicial
  for iter=1:10
    [f ,fp]=fun(x0);     % Llamo a f para obtener valores de f(x) y f'(x)     
    x1 = x0-(f/fp);  
    if(tol > abs(x0-x1)) break 
    % Iteracion de Newton.    
    fprintf('%2d -> %20.17f\n',iter,x1);  % Vuelco datos iteracion.   
    x0=x1;              % Actualizo x0 para volver a iterar.  
  end 
  s = x1;  % Al final se devuelve el último término de la sucesión. 
end
