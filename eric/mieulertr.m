function [t,u,numfun] = mieulertr(t0,tfin,N,x0,f,par)
%Método de predicción-corrección Euler/Trapecio
%Inicalización de variables
h=(tfin-t0)/N;
t=t0:h:tfin;
dim=size(x0,1);
u=zeros(dim,N+1);

%Algoritmo
u(:,1)=x0;
for n=1:N
   %Predicción: Euler
   u(:,n+1)=u(:,n)+h*f(t(n),u(:,n),par);
   %Corrección: Trapecio
   u(:,n+1)=u(:,n)+( f(t(n),u(:,n),par) + f(t(n+1),u(:,n+1),par) )*h/2;
end
end