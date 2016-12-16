function [ t, u] = mieulertr( t0,tfin,N,x0,f,par )
 h = (tfin-t0)/N;
 t = t0:h:tfin;
 u = NaN(size(x0,1),N+1);
 u(:,1) = x0;
 for n=1:N
    const = feval(f,t(n),u(:,n),par);
    u(:,n+1) = u(:,n) + (h/2)*(const + feval(f,t(n+1),u(:,n)+h*const, par)); 
 end
end

