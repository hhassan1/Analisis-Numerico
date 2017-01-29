close all;
par = [];
itmax=100;
%Para activar una de las funciones, añadir un % delante de %{ debajo del
%nombre de la funcion.


%DISPARO NO LINEAL
%{ 
ffxfy = {@(t, x, y) 2*x^3, @(t, x, y) 6*x^2, @(t, x, y) 0};
x0 = 1/2;
xT = 1/3;
C1 = 0;
C2 = 0;
t0 = 1;
tfin = 2;
N = 1000;
%}
%DISPARO LINEAL
%{ 
pqr = {@(t) 3, @(t) 2, @(t) 3*cos(t)};
x0 = -2;
xT = 1;
C1 = 0;
C2 = 1;
t0 = 0;
tfin = 5;
N = 1000;
%}
%FUNC23_1
%{
fun = @func23_1;  jac = @jacfunc23_1;
x0 = 1;   t0 = 0;  tfin = 2;  N = 400;
%}
%FUNC23_2
%{ 
fun = @func23_2;  jac = @jacfunc23_2;
x0 = 1;   t0 = 0;  tfin = Inf;  N = 400;
%}
%OSCIL
%{ 
fun = @funcoscil;  jac = @jacfuncoscil;
x0 = 1/exp(1);   t0 = 0;  tfin = 8;  N = 400;
%}
%BELOUSOV-ZHABOTINSKY
%{ 
fun = @funbelza;  jac = @jacfunbelza;
x0 = [0.25;0.75;0.25];   t0 = 0;  tfin = 10;  N = 400;
a = 2e4; b = 8e-4; g = 5e3; d= 0.75;
par = [a,b,g,d];
%}
%LORENZ
%{ 
fun = @funclorenz;  jac = @jacfunclorenz;
x0 = [0;5;75];   t0 = 0;  tfin = 10;  N = 400;
sigma = 10; ro = 10; b = 8/3;
par = [sigma,ro,b];
%}
%DUFFING
%{ 
fun = @funcduffing;  jac = @jacfuncduffing;
x0 = [theta0;w0];   t0 = 0;  tfin = 10;  N = 400;
a = 0;
par = [a];
%}
%COMPETICION
%{ 
fun = @funccompet;  jac = @jacfunccompet;
x0 = [1;1];   t0 = 0;  tfin = 10;  N = 400;
a = 1; b = 1; c = 1; d = 0.2; e = 0.4; f = 0.00001;
par = [a,b,c,d,e,f];
%}
%DEPREDADOR
%{ 
fun = @funcdeppresa;  jac = @jacfuncdeppresa;
x0 = [30;50];   t0 = 0;  tfin = 100;  N = 4000;
a = 3; b = 0.2; c = 0.6; d = 5;
par = [a,b,c,d];
%}
%PENDULO LINEAL
%{ 
fun = @funcpendulolin;  jac = @jacfuncpendulolin;
x0 = [p1;0];   t0 = 0;  tfin = 10;  N = 400;
l = 1;  g = 9.8;    beta = 0;
par = [l,g,beta];
%}
%PENDULO
%{
fun = @funcpendulo; jac = @jacfuncpendulo;
x0 = [-pi;1e-6];   t0 = 0;	tfin = 18;	N = 1000;
M = 0; l = 1; g = 9.8; beta = 0; 
par = [M,l,g,beta];
%}
%RIGIDA
%{
fun = @funrigida;   jac = @jacfunrigida;
x0 = 0;	t0 = 0;	tfin = pi/2;    N = 4000;
%}
%VANDERPOL
%{
fun = @funcvanderpol;   jac = @jacfuncvanderpol;
x0 = [2;8]; t0 = 0;  tfin = 100;  N = 4000;
a = 30; b = 1;
par = [a,b];
%}
%CORAZON
%%{
fun = @funccorazon; jac = @jacfunccorazon;
x0 = [0;2]; t0 = 0;  tfin = 2*pi; N = 1000;
%}