function y = jacfuncpendulolin( ~, ~, par )
    l = par(2);
    g = par(3);
    b = par(4);
    y = [0,1; -(g/l), - 2*b];
end