mispracticas
%Método a usar y orden p del mismo

%metodo=@miab4; p=5;
%metodo=@miab4am3; p=5;
metodo=@mieuler; p=1;
%metodo=@mieulertr; p=2;
%metodo=@mirk4; p=4;
%metodo=@mitrap; p=2;

[t,u,H,ERROR] = mimetadap ...
    (tinic,tfin,x0,h0,hmin,TOL,fun,metodo,p,par);
misgraficas