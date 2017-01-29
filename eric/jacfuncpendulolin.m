function jac = jacfuncpendulolin( ~, ~, par )
%Jacobiano ecuación del péndulo linealizado
%Parámetros
M=par(1); l=par(2); g=par(3); beta=par(4);
%Jacobiano
jac=[0,		1;
   -g/l, - 2*beta];
end