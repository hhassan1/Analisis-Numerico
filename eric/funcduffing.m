function f= funcduffing(t,x,par)
%Ecuación de Duffing
%Parámetros
alfa= par;
%Funcion
f=[x(2);
   -alfa*x(2)-x(1)^3+x(1)];
end