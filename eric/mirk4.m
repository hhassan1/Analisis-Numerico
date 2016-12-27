function [t,u] = mirk4(t0,tfin,N,x0,f,par)
%Método de Runge-Kutta clásico de orden 4
%Inicalización parametros 
b=[1/6;2/6;2/6;1/6];

%Inicalización del paso y las variables de salida
h=(tfin-t0)/N;
t=t0:h:tfin;
dim=size(x0,1);
u=zeros(dim,N+1);
K=zeros(dim,4);

%Algoritmo
u(:,1)=x0;
for n=1:N
    K(:,1)=f(t(n), u(:,n),par);
    K(:,2)=f(t(n)+h/2, u(:,n)+h*K(:,1)/2,par);
    K(:,3)=f(t(n)+h/2, u(:,n)+h*K(:,2)/2,par);
    K(:,4)=f(t(n)+h, u(:,n)+h*K(:,3),par);
    u(:,n+1)=u(:,n)+h*K*b;
end
end