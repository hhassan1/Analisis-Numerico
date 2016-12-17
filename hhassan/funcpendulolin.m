function y = funcpendulolin(~, x, par)
    l = par(1);
    g = par(2);
    b = par(3);
    y = [x(2); - 2*b*x(2) - (g/l)*x(1)];
end
