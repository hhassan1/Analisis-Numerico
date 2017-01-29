function [t,v,ERROR,numiter] = midispnolin(ffxfy,t0,tfin,a,b,N,c1,c2,TOL,itmax)
%Método de disparo no lineal: Resolución del PVI por Newton
%ffxfy: funcion y sus derivadas parciales

%Cálculo de s0 y la condicion inicial4
if c2==1
	s=b;
else if c1==1 %&& c1==0
	s=b-a*(tfin-t0);
else %c0==0 && c1==0
	s=(b-a)/(tfin-t0);
end
end

ERROR = zeros(1,itmax);
error = 100;
numiter=1;
while and (error > TOL, numiter < itmax)
	%Resolución de los PVIs
	if c1==0
		vwzu0=[a;s;0;1];
	else
		vwzu0=[s;a;0;1];
	end
	[t,vwzu]=mirk4(t0,tfin,N,vwzu0,@fundispnolin,ffxfy);
	
	%Calcular s_(k+1) a partir de s_k
	if c2==0
		s=s-(vwzu(1,N+1)-b)/vwzu(3,N+1);
	else
		s=s-(vwzu(2,N+1)-b)/vwzu(4,N+1);
	end
	
	error= vwzu(1,N+1)-b;
	ERROR(numiter)=error;
	numiter = numiter +1;
end

v=vwzu(1,:);
ERROR(itmax)=ERROR(itmax-1);
if numiter >= itmax
	fprintf('Número máximo de iteraciones alcanzadas (%d)\n', itmax);
	return
end
end