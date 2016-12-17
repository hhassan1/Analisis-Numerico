function y = funbelza(~, x, par)
    a = par(1);
    b = par(2);
    g = par(3);
    d = par(4);
    y = [a*(x(2) - x(1)*x(2) + x(1) - b*x(1)^2); 
        (g*x(3) - x(2) - x(1)*x(2))/a;
        (x(1)-x(3))*d];
end