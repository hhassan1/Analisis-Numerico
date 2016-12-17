function y = funcpendulolin(~, x, par)
    M = par(1);
    l = par(2);
    g = par(3);
    b = par(4);
    y = [x(2); M - 2*b*x(2) - (g/l)*x(1)];
end
