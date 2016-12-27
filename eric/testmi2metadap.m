mispracticas

%Métodos a usar: interno (orden menor) y externo (orden mayor)
met_int=@mieuler; met_ext=@mirk4;

[t,u,H,ERROR] = mi2metadap ...
    (tinic,tfin,x0,h0,hmin,TOL,fun,met_ext,met_int,par);
misgraficas