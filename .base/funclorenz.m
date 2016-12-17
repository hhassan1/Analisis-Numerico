function y = funclorenz( ~, x, par)
    sigma = par(1);
    ro = par(2);
    b = par(3);
    y = [sigma*(x(2)-x(1)); ro*x(1) - x(2) - x(1)*x(3); x(1)*x(2) - b*x(3)];
end

