function [t,u] = mieuler(t0,tfin,N,x0,f,par)
%Método de Euler
%Inicalización de variables
h=(tfin-t0)/N;
t=t0:h:tfin;
dim=size(x0,1);
u=zeros(dim,N+1);

%Algoritmo
u(:,1)=x0;
for n=1:N
    u(:,n+1)=u(:,n)+h*f(t(n),u(:,n),par);
end
end

