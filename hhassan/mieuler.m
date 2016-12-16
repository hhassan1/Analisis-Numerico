function [t, u] = mieuler(t0,tfin,N,x0,f,par)
 h = (tfin-t0)/N;
 t = t0:h:tfin;
 u = zeros(size(x0,1),N+1);
 u(:,1) = x0;
 for i=1:N
    u(:,i+1) = u(:,i) + h*f(t(i),u(:,i),par);
 end
end