function y = jacfunccompet( ~, x, par )
    a = par(1);
    b = par(2);
    c = par(3);
    d = par(4);
    e = par(5);
    f = par(6);
    y = [a - b*x(2) - 2*e*x(1), - b*x(2) ;
         d*x(2), -c + d*x(1) - 2*f*x(2)];
end

