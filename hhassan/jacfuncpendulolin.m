function y = jacfuncpendulolin( ~, ~, par )
    l = par(1);
    g = par(2);
    b = par(3);
    y = [0,1; -(g/l), - 2*b];
end