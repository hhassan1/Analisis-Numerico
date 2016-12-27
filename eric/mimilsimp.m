function [t,u] = mimilsimp(t0,tfin,N,x0,f,par)
%Método de predicción-corrección Milne 4/Simpson 2
%Inicalización de variables
h=(tfin-t0)/N;
t=t0:h:tfin;
dim=size(x0,1);
u=zeros(dim,N+1);

%Inicialización de vector auxiliar de evaluaciones de f
fv=zeros(dim,N+1);
%Inicalización método Adams-Bashforth de orden 4 con RK clásico
[t_dummy, u_init] = mirk4(t0,t0+3*h,3,x0,f,par);

%Inicializacion de los datos iniciales y evaluaciones auxiliares
u(:,1:4)=u_init;
fv(:,1)=f(t(1),u(:,1),par);
fv(:,2)=f(t(2),u(:,2),par);
fv(:,3)=f(t(3),u(:,3),par);
%Algoritmo
for n=4:N
    fv(:,n)=f(t(n),u(:,n),par);
	
	%Predicción: Milne de 4 pasos
    clf=2*fv(:,n)-fv(:,n-1)+2*fv(:,n-2); %Cálculo auxiliar de la combinación lineal de evaluaciones de f
    u(:,n+1)=u(:,n-3)+clf*4*h/3;
	
	%Corrección: Simpson de 2 pasos
    clf=fv(:,n+1)+4*fv(:,n)+fv(:,n-1); %Cálculo auxiliar de la combinación lineal de evaluaciones de f
    u(:,n+1)=u(:,n-1)+clf*h/3;
end
end