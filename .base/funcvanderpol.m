function f = funcvanderpol(~,x, par)
 a = par(1);
 b = par(2);
 f = [x(2); a*(b-x(1)^2)*x(2)-x(1)];
end