function [ t, u ] = miab4am3( t0,tfin,N,x0,x1,x2,x3,f,par)
 h = (tfin-t0)/N;
 t = t0:h:tfin;
 u = NaN(size(x0,1),N+1);
 u(:,1) = x0;
 u(:,2) = x1;
 u(:,3) = x2;
 u(:,4) = x3;
 buffer = [feval(f,t(4),x3,par), feval(f,t(3),x2,par), feval(f,t(2),x1,par), feval(f,t(1),x0,par)];
 scalar_ab = [55;-59;37;-9].*(h/24);
 scalar_am = [9;19;-5;1].*(h/24);
 indexes = [1,2,3,4];
 for n=4:N
     buffer(:,indexes(4)) = feval(f,t(n+1),u(:,n) + buffer(:,indexes)*scalar_ab,par);
     indexes = mod(indexes+2,4)+1;
     u(:,n+1) = u(:,n) + buffer(:,indexes)*scalar_am;
     buffer(:,indexes(1)) = feval(f,t(n+1),u(:,n+1),par);
 end
end

