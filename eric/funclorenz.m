function f= funclorenz(t,x,par)
%Sistemas de Lorenz
%Parámetros
sigma=par(1); beta=par(2); ro=par(3);
%Funcion
f=[sigma*(x(2)-x(1));
   ro*x(1)-x(2)-x(1)*x(3);
   x(1)*x(2)-beta*x(3)];
end