function y = jacfunbelza(t, x, par)
    a = par(1);
    b = par(2);
    g = par(3);
    d = par(4);
    y = [a*(1 - x(2) - 2*b*x(1)), a*(1 - x(1)), 0;
        -x(2)/a,-(1+x(1))/a, g/a;
        d,0,-d];
end

