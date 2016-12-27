function jac=jacfuncvanderpol(t,x,par)
%Jacobiano de la función de Van der Pol
%Parámetros
alfa= par(1); beta= par(2);
%Jacobiano
jac=[           0,              1;
    -2*alfa*x(1)*x(2)-1,  -alfa*(x(1)*x(1)-beta)];
end