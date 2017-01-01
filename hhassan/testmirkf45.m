mispracticas
if ~exist('h0','var')
    h0 = (tfin - t0)/N;
end
if ~exist('hmin','var')
    hmin = 10^(-5);
end
if ~exist('TOL','var')
    TOL = 10^(-3);
end
[t, u, H, ERROR, rechazo] = mirkf45(t0,tfin, x0, h0, hmin, TOL, fun, par);
misgraficas