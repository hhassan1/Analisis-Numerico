mispracticas
h=(tfin-tinic)/N;
[~, u] = mirk4(tinic,tinic+3*h,3,x0,fun,par);
[t, u] = mimilsimp(tinic,tfin,N,x0,u(:,2),u(:,3),u(:,4),fun,par);
misgraficas