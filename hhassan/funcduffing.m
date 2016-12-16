function y = funcduffing( ~, x, par )
    a = par(1);
    y = [x(2);-a*x(2) - x(1)^3 + x(1)];
end