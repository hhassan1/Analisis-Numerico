function x=miecdiferencias(f,x0,x1,N)
x=zeros(1,N);
x(1)=x0;
x(2)=x1;
for i=3:N
   x(i)=feval(f,x(i-2:i-1)); 
end
