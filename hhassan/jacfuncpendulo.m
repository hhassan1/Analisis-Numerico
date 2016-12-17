function y = jacfuncpendulo( t, x, par )
    l = par(2);
    g = par(3);
    b = par(4);
    y = [0,1; -(g/l)*cos(x(1)), - 2*b];
end