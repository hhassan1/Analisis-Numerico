function f = jacfuncvanderpol(~,x, par)
    a = par(1);
    b = par(2);
    f = [0, 1; -2*a*x(1)*x(2)-1, a*(b-x(1)^2)];
end