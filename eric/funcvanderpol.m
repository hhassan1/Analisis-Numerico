function f= funcvanderpol(t,x,par)
%Ecuación de Van der Pol
%Parámetros
alfa= par(1); beta= par(2);
%Funcion
f=[x(2);
   -alfa*(x(1)*x(1)-beta)*x(2)-x(1)];
end

