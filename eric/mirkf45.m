function [t,u,H,ERROR] = mirkf45(t0,tfin,x0,h0,hmin,TOL,f,par)
%Método de Runge-Kutta-Fehlberg de ordenes 4 (int) y 5 (ext)
%Inicalización parametros 
b_int=[25/216; 0; 1408/2565;  2197/4104;   -1/5;  0];
b_ext=[16/135; 0; 6656/12825; 28561/56430; -9/50; 2/55];

A = [0,        0,          0,         0,       0,       0;
    1/4,       0,          0,         0,       0,       0; 
    3/32,      9/32,       0,         0,       0,       0;
    1932/2197,-7200/2197,7296/2197,   0,       0,       0;
    439/216,   -8,        3680/513, -845/4104, 0,       0;
    -8/27  ,    2,      -3544/2565, 1859/4104, -11/40,  0];

c=[0, 1/4, 3/8, 12/13, 1, 1/2];

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
K=zeros(dim,6);

ERROR=zeros(dim,N+1);
H=zeros(dim,N+1);

%Algoritmo
u(:,1)=x0;
n=1;
while t(:,n)<tfin
    
    K(:,1)=f(t(n), u(:,n,par));
    for i=2:6
        K(:,i)=f(t(n)+h*c(i), u(:,n)+h*K*A(i,:)' ,par);
    end
    u_ext=u(:,n)+h*K*b_ext;
    u_int=u(:,n)+h*K*b_int;
    
    %Si la diferencia entre ambos resultados es aceptable, guardamos el resultado
    ERR = norm( u_ext(:,n+1)-u_int(:,n+1) )/h;
    if ERR < TOL
        u(:,n+1)=u_ext;
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