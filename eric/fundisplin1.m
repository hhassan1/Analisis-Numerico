function f=fundisplin1(t,x,pqr)
%Funcion NO homogénea de disparo lineal

f=[x(2);
   feval(pqr{1},t)*x(2)+feval(pqr{2},t)*x(1)+feval(pqr{3},t)];
end