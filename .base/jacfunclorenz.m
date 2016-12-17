function y = jacfunclorenz( ~, x, par)
    sigma = par(1);
    ro = par(2);
    b = par(3);
    y = [-sigma*x(1), sigma*x(2), 0;
         ro - x(3)  , -1        ,-x(1);
         x(2)       ,x(1)       ,-b];
end

