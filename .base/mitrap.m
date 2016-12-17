function [t, u, numfun] = mitrap(t0,tfin,N,x0,f,jac,itmax,par)
 h = (tfin-t0)/N;
 t = t0:h:tfin;
 m = size(x0,1);
 u = NaN(m,N+1);
 numfun = 0;
 u(:,1) = x0;
 I = eye(m);
 for n=1:N
    const = feval(f,t(n),u(:,n), par);
    W = (I - (h/2)*feval(jac,t(n+1),u(:,n),par))\((h/2)*(const + feval(f,t(n+1),u(:,n),par)));
    z = u(:,n) - W;
    it=1;
    while((it < itmax) && (norm(W) > h^3))
        W = (I - (h/2)*feval(jac,t(n+1),z,par))\(z - (u(:,n) + (h/2)*(const + feval(f,t(n+1),z,par))));
        z = z - W;
        it=it+1;
    end
    u(:,n+1) = z;
    numfun = numfun + it;
 end
end