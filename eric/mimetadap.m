function [t,u,H,ERROR] = mimetadap(t0,tfin,x0,h0,hmin,TOL,f,metodo,p,par)
%Método adaptativo de 2 pasos (usando método de orden p)
%Inicalización parametros 
fac=0.9;
facmax=2;

%Inicalización del paso y las variables de salida
N=round((tfin-t0)/h0);
h=h0;
hmax=h0;
t=zeros(1,N+1);
t(:,1)=t0;
dim=size(x0,1);
u=zeros(dim,N+1);

ERROR=zeros(dim,N+1);
H=zeros(dim,N+1);

%Algoritmo
u(:,1)=x0;
n=1;
while t(:,n)<tfin
    %Estimación con paso h y con dos pasos h/2
    [~,u1] = metodo(t(n),t(n)+h,1,u(:,n),f,par);
    [~,u2] = metodo(t(n),t(n)+h,2,u(:,n),f,par);
    
    %Si la diferencia entre ambos resultados es aceptable, guardamos el resultado
    ERR = norm(u1(:,2)-u2(:,3)) / (h*(1-1/(2*p)));
    if ERR < TOL
        u(:,n+1)=u1(:,2);
        t(n+1)=t(n) + h;
        ERROR(:,n+1)=ERR;
        H(:,n+1)=h;
        n=n+1;
    end
    
    %Recalculamos el paso
    h=min(hmax, h*min( facmax, fac*(TOL/ERR)^0.25));
    if h<hmin
        fprintf('El paso es más pequeño que el paso mínimo (%d%% del intervalo)\n', ...
            round(100*(t(n)-t0)/(tfin-t0)));
        return
    end
end
end