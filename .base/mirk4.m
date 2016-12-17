function [t, u] = mirk4(t0,tfin,N,x0,f,par)
 h = (tfin-t0)/N;
 t = t0:h:tfin;
 u = zeros(size(x0,1),N+1);
 u(:,1) = x0;
 for i=1:N
    k1 = f(t(i),u(:,i),par);
    k2 = f(t(i)+h/2,u(:,i) + k1*h/2, par);
    k3 = f(t(i)+h/2,u(:,i)+ k2*h/2, par);
    k4 = f(t(i+1),u(:,i) + k3*h, par);
    u(:,i+1) = u(:,i) + (1/6)*h*(k1 + 2*k2 + 2*k3 + k4);
 end
end