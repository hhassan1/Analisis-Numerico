function [t,u] = midisplin(pqr,t0,tfin,a,b,N,c1,c2)
%Método de disparo lineal
%pqr: funciones lineales

%cond inic: x(t0)=a   (c1=0) ó x'(t0)=a   (c1=1)
%           x(tfin)=b (c2=0) ó x'(tfin)=b (c2=1)
if c1==0
    v01=[a;0];
    v02=[0;1];
else
    v01=[0;a];
    v02=[1;0];
end

%Resolución del PVI no homogéneo
[~, v1]=mirk4(t0,tfin,N,v01,@fundisplin1,pqr);
%Resolución del PVI homogéneo
[t, v2]=mirk4(t0,tfin,N,v02,@fundisplin2,pqr);

%Si v2(tfin)!=0, existe solución única
if v2(:,N+1) ~= 0
	%Hallamos el parámetro de disparo
	if c2==0
		s = (b-v1(1,N+1))/v2(1,N+1); %s = (b-v1(tfin))/v2(tfin)
	else
		s = (b-v1(2,N+1))/v2(2,N+1); %s = (b-v1'(tfin))/v2'(tfin)
	end
    u = v1 + s * v2;
end

end