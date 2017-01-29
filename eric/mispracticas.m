clear all
close all

%% Datos comunes (**NO COMENTAR**)
N=100; itmax=100; hmin=1e-6; TOL=1e-3; par=[]; fex=@(t) 123456789;

%% Funcion corazón
%fun=@funccorazon;   x0=[0;2];      tinic=0;  tfin=2*pi;  jac=@jacfunccorazon;

%% Ecuación de Van der Pol
%alfa= 1; beta= 1;
%fun=@funcvanderpol; x0=[0.1;0.2]; tinic=0; tfin=10; par=[alfa,beta]; jac=@jacfuncvanderpol; 

%% Ecuación del péndulo
%M=0; l=1; g=9.8; beta=0;
%fun=@funcpendulo;   x0=[-pi;1e-10]; tinic=0;  tfin=6*pi; par=[M,l,g,beta];

%% Ecuación del péndulo linealizado
%M=0; l=1; g=9.8; beta=0;
%fun=@funcpendulolin; x0=[-pi;1e-10]; tinic=0;  tfin=6*pi; par=[M,l,g,beta];

%% Sistemas depredador presa
%a=1; b=1; c=1; d=2;
%a=3; b=0.2; c=0.6; d=5;
%fun=@funcdeppresa; x0=[5;5]; tinic=0; tfin=100; par=[a,b,c,d];

%% Sistemas de competicion
%a=1; b=1; c=1; d=0.2; e=0.4; f=0.0001;
%fun=@funccompet; x0=[10;1]; tinic=0; tfin=100; par=[a,b,c,d,e,f];

%% Ecuación de Duffing
%alfa= 0;
%fun=@funcduffing; x0=[-2;0]; tinic=0; tfin=100; par=alfa;

%% Sistemas de Lorenz
%sigma=10; beta=8/3; ro=110;
%fun=@funclorenz; x0=[0;5;75]; tinic=0; tfin=100; par=[sigma,beta,ro];

%% Ecuación de Belousov-Zhabotinsky
%alfa=2e4; beta=8e-4; gamma=5e3; delta=0.75;
%fun=@funbelza; x0=[0.25;0.75;0.25]; tinic=0; tfin=10; jac=@jacfunbelza; par=[alfa,beta,gamma,delta];

%% Otras funciones
%fun=@func23_1;  x0=1;  tinic=0;  tfin=2;
%fun=@func23_2;  x0=1;  tinic=0;  tfin=3;
%fun=@funcoscil;  x0=1/exp(1);  tinic=0;  tfin=8;
%fun=@funcrigida; x0=0; tinic=0;  tfin=20;

%% Disparo lineal
%pqr={@(t) 0, @(t) 4, @(t) -4};				tinic=0;  tfin=1;	a=0;  b=2; c1=0; c2=0;
%pqr={@(t) 3, @(t) 2, @(t) 3*cos(t)};		tinic=0;  tfin=5;	a=-2; b=1; c1=0; c2=1;
%pqr={@(t) 0, @(t) cos(t), @(t) t};			tinic=0;  tfin=10;	a=-2; b=-1; c1=1; c2=0;
%pqr={@(t) 1-sin(t), @(t) cos(t), @(t) sin(t)}; tinic=0; tfin=10; a=-2; b=-1; c1=1; c2=1;

%% Diparo no lineal
%ffxfy={@(t,x,y) 2*x^3, @(t,x,y) 6*x*x, @(t,x,y) 0};  tinic=1;  tfin=2; a=0.5; b=1/3;  c1=0; c2=0; fex=@(t) 1/(1+t);
%ffxfy={@(t,x,y) 8*x^3, @(t,x,y) 24*x*x, @(t,x,y) 0}; tinic=0;  tfin=1; a=1/3; b=-2/25; c1=0; c2=1; fex=@(t) 1/(3+2*t);
%ffxfy={@(t,x,y) (-t*y+x+t)^3+(1/t), ...
%		@(t,x,y) 3*(-t*y+x+t)^2, ...
%		@(t,x,y) -3*t*(-t*y+x+t)^2};				 tinic=1;  tfin=exp(1); a=1; b=exp(1); c1=1; c2=0; fex=@(t) t*log(t);
ffxfy={@(t,x,y) -y*y+x+t, @(t,x,y) 1, @(t,x,y) -2*y}; tinic=1; tfin=2;     a=0; b=2; c1=1; c2=1;

%% Datos de metodos adaptativos (**NO COMENTAR**)
ERROR=0; H=0; h0=(tfin-tinic)/N;


