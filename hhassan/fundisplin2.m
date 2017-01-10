function dx=fundisplin2(t, x, pqr)
    dx = [x(2);feval(pqr{1}, t) * x(2)+ feval(pqr{2}, t) * x(1)];
end
