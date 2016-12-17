mispracticas
h=(tfin-t0)/N;
[~, u] = mirk4(t0,t0+3*h,3,x0,fun,par);
[t, u] = miab4am3(t0,tfin,N,x0,u(:,2),u(:,3),u(:,4),fun,par);
misgraficas