function y=fundispnolin(t,x,ffxfy)
%Funcion de disparo NO lineal

y=[x(2);
   feval(ffxfy{1}, t,x(1),x(2));
   x(4);
   feval(ffxfy{3}, t,x(1),x(2))*x(1) + ...
    feval(ffxfy{2}, t,x(1),x(2))*x(3)];
end