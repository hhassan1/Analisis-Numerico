function z = miecdiferencias(x0,x1,N)
  aux = @(t)(feval(funcecdif, t));
  z = aux(x0:x1:N);
