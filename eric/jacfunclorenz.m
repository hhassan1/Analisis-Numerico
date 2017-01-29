function jac = jacfunclorenz( ~, x, par)
%Jacobiano sistemas de Lorenz
%Parámetros
sigma=par(1); beta=par(2); ro=par(3);
%Jacobiano
jac=[-sigma*x(1), sigma*x(2), 0;
	 ro - x(3)  , -1        ,-x(1);
	 x(2)       ,x(1)       ,-beta];
end

