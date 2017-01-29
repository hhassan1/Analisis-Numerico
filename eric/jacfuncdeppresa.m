function jac = jacfuncdeppresa( ~, x, par )
%Jacobiano de los sistemas depredador presa
%Parámetros
a=par(1); b=par(2); c=par(3); d=par(4);
%Jacobiano
 jac = [a - b*x(2), - b*x(1);
		d*x(2), -c + d*x(1)];
end

