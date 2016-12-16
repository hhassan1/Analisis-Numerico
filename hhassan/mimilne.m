function [ t, u ] = mimilne( t0,tfin,N,x0,x1,x2,x3,f,par)
 h = (tfin-t0)/N;
 t = t0:h:tfin;
 u = NaN(size(x0,1),N+1);
 u(:,1) = x0;
 u(:,2) = x1;
 u(:,3) = x2;
 u(:,4) = x3;
 buffer = [feval(f,t(4),x3,par), feval(f,t(3),x2,par), feval(f,t(2),x1,par)];
 scalar = [8;-4;8].*(h/3);
 indexes = [1,2,3];
 for n=4:N
     u(:,n+1) = u(:,n-3) + buffer(:,indexes)*scalar;
     buffer(:,indexes(3)) = feval(f,t(n+1),u(:,n+1),par);
     indexes = mod(indexes+1,3)+1;
 end
end

