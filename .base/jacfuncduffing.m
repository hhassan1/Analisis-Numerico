function y = jacfuncduffing( ~, x, par )
    a = par(1);
    y = [0,1;-3*x(1)^2 + 1, -a];
end